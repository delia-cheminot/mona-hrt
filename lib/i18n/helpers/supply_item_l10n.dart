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
    return '${molecule.localizedNameWithEster(ester)} • '
        '${_localizedConcentration()}\n'
        '${_localizedRemaining()}';
  }

  String get localizedConcentrationAndRemaining {
    return '${_localizedConcentration()} • ${_localizedRemaining()}';
  }

  String _localizedConcentration() {
    final routeConcentrationUnit = administrationRoute.localizedUnit(1);
    return '$concentration ${molecule.localizedUnit}/$routeConcentrationUnit';
  }

  String _localizedRemaining() {
    final amountRemaining = getAmount(remainingDose);
    final amountRemainingFormatted =
        amountRemaining % Decimal.one == Decimal.zero
            ? amountRemaining.toDouble().toInt()
            : amountRemaining.round(scale: 1).toDouble();
    final routeUnitRemaining =
        administrationRoute.localizedUnit(amountRemaining.toDouble());
    return t.remaining(
        count: amountRemainingFormatted, unit: routeUnitRemaining);
  }
}

extension GenericSupplyL10n on GenericSupply {
  String get localizedSummary => genericSupplyType.localizedRemaining(amount);
}
