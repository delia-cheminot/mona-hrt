import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/custom_mappers.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/mapping_hooks.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/validators.dart';

part 'medication_schedule.mapper.dart';

@MappableClass(
  includeCustomMappers: [
    MoleculeJsonMapper(),
    AdministrationRouteNameMapper(),
    EsterNameMapper(),
    DecimalStringMapper(),
    DateStringMapper(),
  ],
  generateMethods: GenerateMethods.all,
)
class MedicationSchedule with MedicationScheduleMappable {
  final int id;
  final String name;
  final Decimal dose;
  final Date startDate;
  @MappableField(key: 'moleculeJson')
  final Molecule molecule;
  @MappableField(key: 'administrationRouteName')
  final AdministrationRoute administrationRoute;
  @MappableField(key: 'esterName')
  final Ester? ester;
  @MappableField(key: 'schedulingStrategy', hook: JsonStringHook())
  final SchedulingStrategy scheduling;

  MedicationSchedule({
    int? id,
    required this.name,
    required this.dose,
    required this.scheduling,
    Date? startDate,
    required this.molecule,
    required this.administrationRoute,
    this.ester,
  })  : id = id ?? DateTime.now().millisecondsSinceEpoch,
        startDate = startDate ?? Date.today();

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
  static String? validateName(String? value) => requiredString(value);

  static String? validateDose(String? value) =>
      requiredStrictlyPositiveDecimal(value);

  static String? validateStartDate(Date? value) => requiredDate(value);

  static String? validateMolecule(Molecule? value) => requiredMolecule(value);

  static String? validateAdministrationRoute(AdministrationRoute? value) =>
      requiredAdministrationRoute(value);
  // coverage:ignore-end
}
