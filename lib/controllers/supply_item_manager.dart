import 'package:decimal/decimal.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import '../data/model/medication_supply_item.dart';
import '../data/providers/supply_item_provider.dart';

class SupplyItemManager {
  final SupplyItemProvider _supplyItemProvider;

  SupplyItemManager(this._supplyItemProvider);

  /// Uses a portion of the amount of the [MedicationSupplyItem] and updates the database.
  Future<void> useDose(MedicationSupplyItem item, Decimal doseToUse) async {
    if (doseToUse == Decimal.zero) {
      return;
    }

    if (item.usedDose + doseToUse > item.totalDose) {
      doseToUse = item.totalDose - item.usedDose;
    }

    if (item.usedDose + doseToUse < Decimal.fromInt(0)) {
      doseToUse = -item.usedDose;
    }

    await _supplyItemProvider.updateItem(item.copyWith(
      usedDose: item.usedDose + doseToUse,
    ));
  }

  /// Uses [quantity] units of the [GenericSupply] and updates the database.
  Future<void> use(GenericSupply item, {int quantity = 1}) async {
    final updatedAmount =
        item.amount - quantity < 0 ? 0 : item.amount - quantity;
    await _supplyItemProvider.updateItem(item.copyWith(
      amount: updatedAmount,
    ));
  }

  /// Puts back [quantity] units of the [GenericSupply] and updates the database.
  Future<void> putBack(GenericSupply item, {int quantity = 1}) async {
    await _supplyItemProvider.updateItem(item.copyWith(
      amount: item.amount + quantity,
    ));
  }

  /// Switch doses between two [MedicationSupplyItem]
  Future<void> switchDoses(
      MedicationSupplyItem? previousItem,
      MedicationSupplyItem? nextItem,
      Decimal previousDose,
      Decimal nextDose) async {
    bool sameItems = nextItem == previousItem;

    if (previousItem != null) {
      if (sameItems) {
        Decimal doseDifference = nextDose - previousDose;
        await useDose(previousItem, doseDifference);
      } else {
        await useDose(previousItem, -previousDose);
      }
    }

    if (nextItem != null && !sameItems) {
      await useDose(nextItem, nextDose);
    }
  }
}
