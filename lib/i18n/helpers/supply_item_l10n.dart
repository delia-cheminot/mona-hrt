import 'package:decimal/decimal.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/generic_type_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';

extension SupplyItemL10n on SupplyItem {
  String get localizedSummary {
    return switch (this) {
      final MedicationSupplyItem m => m.localizedSummary,
      final GenericSupply g => g.localizedSummary,
      _ => '',
    };
  }
}

extension MedicationSupplyItemL10n on MedicationSupplyItem {
  String localizedSupplyAmount(Decimal dose, Molecule molecule) {
    final amount = getAmount(dose);
    return ' $dose ${molecule.localizedUnit} = $amount '
        '${administrationRoute.localizedUnit(amount.toDouble())}';
  }

  String get localizedSummary {
    final amountRemaining = getAmount(remainingDose);
    final amountRemainingFormatted =
        amountRemaining % Decimal.one == Decimal.zero
            ? amountRemaining.toDouble().toInt()
            : amountRemaining.toDouble();
    final routeUnitRemaining =
        administrationRoute.localizedUnit(amountRemaining.toDouble());
    final routeConcentrationUnit = administrationRoute.localizedUnit(1);
    final moleculeUnitLabel = molecule.localizedUnit;

    return '${molecule.localizedNameWithEster(ester)} • '
        '$concentration $moleculeUnitLabel/$routeConcentrationUnit\n'
        '${t.remaining(amount: amountRemainingFormatted, unit: routeUnitRemaining)}';
  }
}

extension GenericSupplyL10n on GenericSupply {
  String get localizedSummary => genericSupplyType.localizedRemaining(amount);
}
