import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/custom_mappers.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:mona/util/validators.dart';

part 'medication_supply_item.mapper.dart';

@MappableClass(
  discriminatorValue: 'medication',
  includeCustomMappers: [
    DateStringMapper(),
    DecimalStringMapper(),
    MoleculeJsonMapper(),
    AdministrationRouteNameMapper(),
    EsterNameMapper(),
  ],
)
class MedicationSupplyItem extends SupplyItem
    with MedicationSupplyItemMappable {
  @override
  final int id;
  @override
  final String name;
  final Decimal totalDose;
  final Decimal usedDose;
  final Decimal concentration;
  @MappableField(key: 'moleculeJson')
  final Molecule molecule;
  @MappableField(key: 'administrationRouteName')
  final AdministrationRoute administrationRoute;
  @MappableField(key: 'esterName')
  final Ester? ester;

  MedicationSupplyItem({
    int? id,
    required this.name,
    required this.totalDose,
    required this.concentration,
    Decimal? usedDose,
    required this.molecule,
    required this.administrationRoute,
    this.ester,
  })  : usedDose = usedDose ?? Decimal.zero,
        id = id ?? DateTime.now().millisecondsSinceEpoch;

  bool get isUsed => usedDose > Decimal.zero;
  Decimal get remainingDose => totalDose - usedDose;

  bool isValid() {
    return totalDose > Decimal.zero &&
        usedDose >= Decimal.zero &&
        usedDose <= totalDose &&
        name != '' &&
        concentration > Decimal.zero;
  }

  bool canUseDose(Decimal doseToUse) {
    return usedDose + doseToUse <= totalDose;
  }

  double getRatio() {
    return (remainingDose *
            totalDose.inverse.toDecimal(scaleOnInfinitePrecision: 10))
        .toDouble();
  }

  Decimal getAmount(Decimal dose) =>
      (dose.toRational() / concentration.toRational())
          .toDecimal(scaleOnInfinitePrecision: 3);

  Decimal getDose(Decimal amount) => amount * concentration;

  static String? Function(String?) usedAmountValidator(String totalAmount) {
    return (String? value) {
      return requiredPositiveDecimal(value) ??
          (validateTotalAmount(totalAmount) != null
              ? t.invalidTotalAmount
              : null) ??
          (value.toDecimalOrZero > totalAmount.toDecimal
              ? t.cannotExceedTotalCapacity
              : null);
    };
  }

  static String? Function(Ester?) esterValidator(
      Molecule? molecule, AdministrationRoute? administrationRoute) {
    return (Ester? value) {
      return (molecule == KnownMolecules.estradiol &&
              administrationRoute == AdministrationRoute.injection &&
              value == null)
          ? t.requiredField
          : null;
    };
  }

  // coverage:ignore-start
  static String? validateTotalAmount(String? value) =>
      requiredStrictlyPositiveDecimal(value);

  static String? validateConcentration(String? value) =>
      requiredStrictlyPositiveDecimal(value);

  static String? validateMolecule(Molecule? value) => requiredMolecule(value);

  static String? validateAdministrationRoute(AdministrationRoute? value) =>
      requiredAdministrationRoute(value);
  // coverage:ignore-end
}
