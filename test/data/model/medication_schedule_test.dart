import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';

void main() {
  group('MedicationSchedule', () {
    test('validateEster works correctly', () {
      final cases = [
        {
          'molecule': null,
          'route': null,
          'value': null,
          'expected': isNull,
        },
        {
          'molecule': KnownMolecules.estradiol,
          'route': AdministrationRoute.injection,
          'value': null,
          'expected': isNotNull,
        },
        {
          'molecule': KnownMolecules.estradiol,
          'route': AdministrationRoute.injection,
          'value': Ester.enanthate,
          'expected': isNull,
        },
        {
          'molecule': KnownMolecules.estradiol,
          'route': AdministrationRoute.oral,
          'value': Ester.enanthate,
          'expected': isNull,
        },
        {
          'molecule': KnownMolecules.estradiol,
          'route': AdministrationRoute.oral,
          'value': null,
          'expected': isNull,
        },
      ];

      final results = cases.map((c) {
        final validator = MedicationSchedule.esterValidator(
          c['molecule'] as Molecule?,
          c['route'] as AdministrationRoute?,
        );
        return validator(c['value'] as Ester?);
      }).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      expect(results, expected);
    });
  });
}
