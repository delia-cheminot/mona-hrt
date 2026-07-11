import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';

MedicationSupplyItem makeMed({
  int id = 1,
  String name = 'Med',
  String totalDose = '100',
  String usedDose = '0',
  String concentration = '1',
  Molecule? molecule,
  AdministrationRoute route = AdministrationRoute.oral,
  Ester? ester,
}) {
  return MedicationSupplyItem(
    id: id,
    name: name,
    totalDose: Decimal.parse(totalDose),
    usedDose: Decimal.parse(usedDose),
    concentration: Decimal.parse(concentration),
    molecule: molecule ?? KnownMolecules.estradiol,
    administrationRoute: route,
    ester: ester,
  );
}

void main() {
  group('MedicationSupplyItem', () {
    group('toMap / fromMap', () {
      test('round-trips all fields', () {
        // Arrange
        final original = MedicationSupplyItem(
          id: 1,
          name: 'Test Item',
          totalDose: Decimal.parse('100'),
          usedDose: Decimal.parse('20'),
          concentration: Decimal.parse('10'),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
          ester: Ester.undecylate,
        );

        // Act
        final result = MedicationSupplyItemMapper.fromMap(original.toMap());

        // Assert
        expect(
          result,
          isA<MedicationSupplyItem>()
              .having((s) => s.id, 'id', original.id)
              .having((s) => s.name, 'name', original.name)
              .having((s) => s.totalDose, 'totalDose', original.totalDose)
              .having((s) => s.usedDose, 'usedDose', original.usedDose)
              .having((s) => s.concentration, 'concentration',
                  original.concentration)
              .having((s) => s.molecule, 'molecule', original.molecule)
              .having((s) => s.administrationRoute, 'administrationRoute',
                  original.administrationRoute)
              .having((s) => s.ester, 'ester', original.ester),
        );
      });

      test('round-trips a null ester', () {
        // Arrange
        final original = makeMed(ester: null);

        // Act
        final result = MedicationSupplyItemMapper.fromMap(original.toMap());

        // Assert
        expect(result.ester, isNull);
      });
    });

    group('remainingDose', () {
      test('returns totalDose minus usedDose', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '30');

        // Act
        final remaining = item.remainingDose;

        // Assert
        expect(remaining, Decimal.fromInt(70));
      });
    });

    group('isUsed', () {
      test('is true when usedDose is greater than zero', () {
        // Arrange
        final item = makeMed(usedDose: '1');

        // Act
        final result = item.isUsed;

        // Assert
        expect(result, isTrue);
      });

      test('is false when usedDose is zero', () {
        // Arrange
        final item = makeMed(usedDose: '0');

        // Act
        final result = item.isUsed;

        // Assert
        expect(result, isFalse);
      });
    });

    group('isValid', () {
      test('returns true for a fully valid item', () {
        // Arrange
        final item = makeMed(
          name: 'Valid',
          totalDose: '100',
          usedDose: '50',
          concentration: '10',
        );

        // Act
        final result = item.isValid();

        // Assert
        expect(result, isTrue);
      });

      test('returns false when name is empty', () {
        // Arrange
        final item = makeMed(name: '');

        // Act
        final result = item.isValid();

        // Assert
        expect(result, isFalse);
      });

      test('returns false when totalDose is zero', () {
        // Arrange
        final item = makeMed(totalDose: '0');

        // Act
        final result = item.isValid();

        // Assert
        expect(result, isFalse);
      });

      test('returns false when usedDose is negative', () {
        // Arrange
        final item = makeMed(totalDose: '10', usedDose: '-1');

        // Act
        final result = item.isValid();

        // Assert
        expect(result, isFalse);
      });

      test('returns false when usedDose exceeds totalDose', () {
        // Arrange
        final item = makeMed(totalDose: '10', usedDose: '11');

        // Act
        final result = item.isValid();

        // Assert
        expect(result, isFalse);
      });

      test('returns false when concentration is zero', () {
        // Arrange
        final item = makeMed(concentration: '0');

        // Act
        final result = item.isValid();

        // Assert
        expect(result, isFalse);
      });
    });

    group('canUseDose', () {
      test('returns true when the sum stays within totalDose', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '20');

        // Act
        final result = item.canUseDose(Decimal.fromInt(80));

        // Assert
        expect(result, isTrue);
      });

      test('returns true at exactly totalDose', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '0');

        // Act
        final result = item.canUseDose(Decimal.fromInt(100));

        // Assert
        expect(result, isTrue);
      });

      test('returns false when the sum exceeds totalDose', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '20');

        // Act
        final result = item.canUseDose(Decimal.fromInt(81));

        // Assert
        expect(result, isFalse);
      });
    });

    group('getRatio', () {
      test('returns 1.0 when nothing has been used', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '0');

        // Act
        final ratio = item.getRatio();

        // Assert
        expect(ratio, 1.0);
      });

      test('returns 0.0 when fully used', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '100');

        // Act
        final ratio = item.getRatio();

        // Assert
        expect(ratio, 0.0);
      });

      test('returns 0.5 when half used', () {
        // Arrange
        final item = makeMed(totalDose: '100', usedDose: '50');

        // Act
        final ratio = item.getRatio();

        // Assert
        expect(ratio, 0.5);
      });
    });

    group('getAmount', () {
      test('returns dose divided by concentration', () {
        // Arrange
        final item = makeMed(concentration: '2.5');

        // Act
        final amount = item.getAmount(Decimal.fromInt(10));

        // Assert
        expect(amount, Decimal.parse('4'));
      });

      test('returns zero for a zero dose', () {
        // Arrange
        final item = makeMed(concentration: '2.5');

        // Act
        final amount = item.getAmount(Decimal.zero);

        // Assert
        expect(amount, Decimal.zero);
      });
    });

    group('getDose', () {
      test('returns amount times concentration', () {
        // Arrange
        final item = makeMed(concentration: '2.5');

        // Act
        final dose = item.getDose(Decimal.parse('4'));

        // Assert
        expect(dose, Decimal.fromInt(10));
      });

      test('returns zero for a zero amount', () {
        // Arrange
        final item = makeMed(concentration: '2.5');

        // Act
        final dose = item.getDose(Decimal.zero);

        // Assert
        expect(dose, Decimal.zero);
      });
    });

    group('copyWith', () {
      test('replaces only the provided fields', () {
        // Arrange
        final original = makeMed(name: 'Original', totalDose: '100');

        // Act
        final result = original.copyWith(name: 'Updated');

        // Assert
        final expected = makeMed(name: 'Updated', totalDose: '100');
        expect(result, expected);
      });

      test('keeps existing values when no overrides are provided', () {
        // Arrange
        final original = makeMed(
          name: 'Original',
          totalDose: '100',
          usedDose: '20',
          concentration: '5',
          ester: Ester.valerate,
        );

        // Act
        final result = original.copyWith();

        // Assert
        expect(
          result,
          isA<MedicationSupplyItem>()
              .having((s) => s.id, 'id', original.id)
              .having((s) => s.name, 'name', original.name)
              .having((s) => s.totalDose, 'totalDose', original.totalDose)
              .having((s) => s.usedDose, 'usedDose', original.usedDose)
              .having((s) => s.concentration, 'concentration',
                  original.concentration)
              .having((s) => s.molecule, 'molecule', original.molecule)
              .having((s) => s.administrationRoute, 'administrationRoute',
                  original.administrationRoute)
              .having((s) => s.ester, 'ester', original.ester),
        );
      });

      test('overrides ester when a new value is provided', () {
        // Arrange
        final original = makeMed(ester: Ester.valerate);

        // Act
        final result = original.copyWith(ester: Ester.enanthate);

        // Assert
        expect(result.ester, Ester.enanthate);
      });

      test('clears ester when ester is null', () {
        // Arrange
        final original = makeMed(ester: Ester.valerate);

        // Act
        final result = original.copyWith(ester: null);

        // Assert
        expect(result.ester, isNull);
      });
    });

    group('validators', () {
      test('usedAmountValidator returns the expected matcher for each input',
          () {
        // Arrange
        const total = '100';
        final validator = MedicationSupplyItem.usedAmountValidator(total);
        final cases = [
          {'value': null, 'expected': isNotNull},
          {'value': '', 'expected': isNotNull},
          {'value': '-1', 'expected': isNotNull},
          {'value': '200', 'expected': isNotNull},
          {'value': '50', 'expected': isNull},
        ];

        // Act
        final results =
            cases.map((c) => validator(c['value'] as String?)).toList();
        final expected = cases.map((c) => c['expected'] as Matcher).toList();

        // Assert
        expect(results, expected);
      });

      test('esterValidator returns the expected matcher for each input', () {
        // Arrange
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

        // Act
        final results = cases.map((c) {
          final validator = MedicationSupplyItem.esterValidator(
            c['molecule'] as Molecule?,
            c['route'] as AdministrationRoute?,
          );
          return validator(c['value'] as Ester?);
        }).toList();
        final expected = cases.map((c) => c['expected'] as Matcher).toList();

        // Assert
        expect(results, expected);
      });
    });
  });
}
