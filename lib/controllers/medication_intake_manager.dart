import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/controllers/supply_item_manager.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/services/preferences_service.dart';
import '../data/model/medication_intake.dart';
import '../data/providers/medication_intake_provider.dart';

final Decimal microlitersToMilliliters = Decimal.parse('0.001');

class MedicationIntakeManager {
  final MedicationIntakeProvider _medicationIntakeProvider;
  final SupplyItemProvider _supplyItemProvider;
  final PreferencesService _preferencesService;

  MedicationIntakeManager(this._medicationIntakeProvider,
      this._supplyItemProvider, this._preferencesService);

  Future<void> takeMedication({
    required Decimal takenDose,
    TimeOfDay? scheduledTime,
    required DateTime takenDateTime,
    MedicationSupplyItem? medicationItem,
    List<GenericSupply> genericItems = const [],
    required MedicationSchedule schedule,
    Decimal? deadSpace, //in μL
    String? notes,
    Decimal? wastedAmount, // in mL
    List<Placement> placements = const [],
  }) async {
    if (!takenDateTime.isUtc) {
      throw ArgumentError('takenDateTime must be in UTC');
    }

    final timezone = await FlutterTimezone.getLocalTimezone();
    final tzName = timezone.identifier;

    await _medicationIntakeProvider.add(MedicationIntake(
      takenDose: takenDose,
      scheduledTime: scheduledTime,
      takenDateTime: takenDateTime,
      takenTimeZone: tzName,
      scheduleId: schedule.id,
      molecule: schedule.molecule,
      administrationRoute: schedule.administrationRoute,
      ester: schedule.ester,
      medicationSupplyItemId: medicationItem?.id,
      genericSupplyItemIds: genericItems.map((item) => item.id).toList(),
      notes: notes,
      wastedAmount: wastedAmount,
      deadSpace: deadSpace,
      placements: placements,
    ));

    final itemManager = SupplyItemManager(_supplyItemProvider);

    for (final group in genericItems.groupListsBy((g) => g.id).values) {
      await itemManager.use(group.first, quantity: group.length);
    }

    if (medicationItem != null) {
      if (deadSpace != null && deadSpace > Decimal.zero) {
        takenDose +=
            medicationItem.getDose(deadSpace * microlitersToMilliliters);
      }
      if (wastedAmount != null && wastedAmount > Decimal.zero) {
        takenDose += medicationItem.getDose(wastedAmount);
      }
      await itemManager.useDose(medicationItem, takenDose);
    }
  }

  Future<void> deleteIntake(MedicationIntake intake) async {
    await _medicationIntakeProvider.deleteIntake(intake);

    final itemManager = SupplyItemManager(_supplyItemProvider);

    for (final group in _genericItemsByIds(intake.genericSupplyItemIds)
        .groupListsBy((g) => g.id)
        .values) {
      await itemManager.putBack(group.first, quantity: group.length);
    }

    final medicationItem = _supplyItemProvider
        .getItemById(intake.medicationSupplyItemId) as MedicationSupplyItem?;
    if (medicationItem != null) {
      final wastedDose =
          medicationItem.getDose(intake.wastedAmount ?? Decimal.zero);
      final deadSpaceDose = medicationItem.getDose(
          (intake.deadSpace ?? Decimal.zero) * microlitersToMilliliters);
      await itemManager.useDose(
          medicationItem, -(intake.takenDose + wastedDose + deadSpaceDose));
    }
  }

  Future<void> editIntake(
    MedicationIntake intake, {
    required Decimal takenDose,
    Decimal? wastedAmount,
    Decimal? deadSpace,
    required DateTime takenDateTime,
    required String takenTimeZone,
    MedicationSupplyItem? medicationItem,
    List<GenericSupply> genericItems = const [],
    String? notes,
    List<Placement> placements = const [],
  }) async {
    if (!takenDateTime.isUtc) {
      throw ArgumentError('takenDateTime must be in UTC');
    }

    final itemManager = SupplyItemManager(_supplyItemProvider);

    final previousCounts = _countById(intake.genericSupplyItemIds);
    final newCounts = _countById(genericItems.map((g) => g.id));

    final removedIds =
        previousCounts.keys.where((id) => !newCounts.containsKey(id)).toList();
    final itemById = {
      for (final generic in genericItems) generic.id: generic,
      for (final generic in _genericItemsByIds(removedIds)) generic.id: generic,
    };

    for (final id in {...previousCounts.keys, ...newCounts.keys}) {
      final delta = (newCounts[id] ?? 0) - (previousCounts[id] ?? 0);
      final generic = itemById[id];
      if (generic == null || delta == 0) continue;
      if (delta > 0) {
        await itemManager.use(generic, quantity: delta);
      } else {
        await itemManager.putBack(generic, quantity: -delta);
      }
    }

    final previousMedication = _supplyItemProvider
        .getItemById(intake.medicationSupplyItemId) as MedicationSupplyItem?;
    final newMedication = medicationItem;

    final previousUsedDose = previousMedication == null
        ? Decimal.zero
        : intake.takenDose +
            previousMedication.getDose(intake.wastedAmount ?? Decimal.zero) +
            previousMedication.getDose(
                (intake.deadSpace ?? Decimal.zero) * microlitersToMilliliters);
    final newUsedDose = newMedication == null
        ? Decimal.zero
        : takenDose +
            newMedication.getDose(wastedAmount ?? Decimal.zero) +
            newMedication.getDose(
                (deadSpace ?? Decimal.zero) * microlitersToMilliliters);

    await itemManager.switchDoses(
      previousMedication,
      newMedication,
      previousUsedDose,
      newUsedDose,
    );

    await _medicationIntakeProvider.updateIntake(intake.copyWith(
      takenDateTime: takenDateTime,
      takenTimeZone: takenTimeZone,
      takenDose: takenDose,
      wastedAmount: wastedAmount,
      deadSpace: deadSpace,
      medicationSupplyItemId: medicationItem?.id,
      genericSupplyItemIds: genericItems.map((item) => item.id).toList(),
      notes: notes,
      placements: placements,
    ));
  }

  List<Placement> getOrderedPlacements({required int scheduleId}) {
    final placementsList = _preferencesService.placementsList;
    final perSchedule = _preferencesService.placementSuggestionPerSchedule;

    final history = perSchedule
        ? _medicationIntakeProvider.getTakenIntakesDescForSchedule(scheduleId)
        : _medicationIntakeProvider.takenIntakesSortedDesc;

    DateTime lastUsed(Placement placement) {
      return history
              .firstWhereOrNull(
                (intake) => intake.placements.contains(placement),
              )
              ?.takenDateTime ??
          DateTime.fromMillisecondsSinceEpoch(0);
    }

    final ordered = [...placementsList];
    ordered.sort((a, b) {
      final byLastUsed = lastUsed(a).compareTo(lastUsed(b));
      if (byLastUsed != 0) return byLastUsed;
      return placementsList.indexOf(a).compareTo(placementsList.indexOf(b));
    });
    return ordered;
  }

  Placement? suggestNextPlacement({required int scheduleId}) =>
      getOrderedPlacements(scheduleId: scheduleId).firstOrNull;

  MedicationSupplyItem? suggestMedicationItem({
    required MedicationSchedule schedule,
  }) {
    final lastIntake =
        _medicationIntakeProvider.getLastTakenIntakeForSchedule(schedule.id);
    final previous =
        _supplyItemProvider.getItemById(lastIntake?.medicationSupplyItemId);

    if (previous is MedicationSupplyItem &&
        previous.molecule == schedule.molecule &&
        previous.administrationRoute == schedule.administrationRoute &&
        previous.ester == schedule.ester) {
      return previous;
    }

    return _supplyItemProvider.getMostUsedItemForMedication(
      schedule.molecule,
      schedule.administrationRoute,
      schedule.ester,
    );
  }

  List<GenericSupply> suggestGenericItems({
    required MedicationSchedule schedule,
  }) {
    final lastIntake =
        _medicationIntakeProvider.getLastTakenIntakeForSchedule(schedule.id);
    if (lastIntake == null) return const [];
    return _genericItemsByIds(lastIntake.genericSupplyItemIds);
  }

  List<GenericSupply> _genericItemsByIds(List<int> ids) => _supplyItemProvider
      .getItemsByIds(ids)
      .whereType<GenericSupply>()
      .toList();

  Map<int, int> _countById(Iterable<int> ids) {
    final counts = <int, int>{};
    for (final id in ids) {
      counts[id] = (counts[id] ?? 0) + 1;
    }
    return counts;
  }
}
