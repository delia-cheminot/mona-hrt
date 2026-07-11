import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/controllers/supply_item_manager.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import '../data/model/medication_intake.dart';
import '../data/providers/medication_intake_provider.dart';

final Decimal microlitersToMilliliters = Decimal.parse('0.001');

class MedicationIntakeManager {
  final MedicationIntakeProvider _medicationIntakeProvider;
  final SupplyItemProvider _supplyItemProvider;

  MedicationIntakeManager(
      this._medicationIntakeProvider, this._supplyItemProvider);

  Future<void> takeMedication({
    required Decimal takenDose,
    TimeOfDay? scheduledTime,
    required DateTime takenDateTime,
    SupplyItem? supplyItem,
    required MedicationSchedule schedule,
    InjectionSide? side,
    Decimal? deadSpace, //in μL
    String? notes,
    Decimal? wastedAmount, // in mL
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
      side: side,
      scheduleId: schedule.id,
      molecule: schedule.molecule,
      administrationRoute: schedule.administrationRoute,
      ester: schedule.ester,
      supplyItemId: supplyItem?.id,
      notes: notes,
      wastedAmount: wastedAmount,
      deadSpace: deadSpace,
    ));

    final itemManager = SupplyItemManager(_supplyItemProvider);

    switch (supplyItem) {
      case null:
        return;
      case GenericSupply _:
        await itemManager.use(supplyItem);
        return;
      case MedicationSupplyItem _:
        if (deadSpace != null && deadSpace > Decimal.zero) {
          takenDose +=
              (supplyItem).getDose(deadSpace * microlitersToMilliliters);
        }
        if (wastedAmount != null && wastedAmount > Decimal.zero) {
          takenDose += (supplyItem).getDose(wastedAmount);
        }
        await itemManager.useDose(supplyItem, takenDose);
    }
  }

  Future<void> deleteIntake(MedicationIntake intake) async {
    await _medicationIntakeProvider.deleteIntake(intake);

    final SupplyItem? item =
        _supplyItemProvider.getItemById(intake.supplyItemId);
    final itemManager = SupplyItemManager(_supplyItemProvider);

    switch (item) {
      case null:
        return;
      case GenericSupply _:
        await itemManager.putBack(item);
        return;
      case MedicationSupplyItem _:
        final wastedDose = item.getDose(intake.wastedAmount ?? Decimal.zero);
        final deadSpaceDose = item.getDose(
            (intake.deadSpace ?? Decimal.zero) * microlitersToMilliliters);
        await itemManager.useDose(
            item, -(intake.takenDose + wastedDose + deadSpaceDose));
    }
  }

  Future<void> editIntake(
    MedicationIntake intake, {
    required Decimal takenDose,
    Decimal? wastedAmount,
    Decimal? deadSpace,
    required DateTime takenDateTime,
    required String takenTimeZone,
    InjectionSide? side,
    SupplyItem? supplyItem,
    String? notes,
  }) async {
    if (!takenDateTime.isUtc) {
      throw ArgumentError('takenDateTime must be in UTC');
    }

    final previousItem = _supplyItemProvider.getItemById(intake.supplyItemId);
    final itemManager = SupplyItemManager(_supplyItemProvider);
    final bool sameItem = previousItem == supplyItem;

    if (!sameItem) {
      if (previousItem is GenericSupply) {
        await itemManager.putBack(previousItem);
      }
      if (supplyItem is GenericSupply) {
        await itemManager.use(supplyItem);
      }
    }

    final previousMedication =
        previousItem is MedicationSupplyItem ? previousItem : null;
    final newMedication =
        supplyItem is MedicationSupplyItem ? supplyItem : null;

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
      side: side,
      supplyItemId: supplyItem?.id,
      notes: notes,
    ));
  }

  InjectionSide getNextSide() {
    final lastIntake = _medicationIntakeProvider.getLastTakenInjectionIntake();

    if (lastIntake == null || lastIntake.side == null) {
      return InjectionSide.left;
    }

    return lastIntake.side == InjectionSide.left
        ? InjectionSide.right
        : InjectionSide.left;
  }
}
