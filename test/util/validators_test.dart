import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/util/validators.dart';

void main() {
  group('validators', () {
    test('requiredString works correctly', () {
      // Arrange
      final cases = [
        {'value': null, 'expected': isNotNull},
        {'value': '', 'expected': isNotNull},
        {'value': 'hello', 'expected': isNull},
        {'value': '   ', 'expected': isNotNull},
      ];

      // Act
      final results =
          cases.map((c) => requiredString(c['value'] as String?)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredDate works correctly', () {
      // Arrange
      final cases = [
        {'value': null, 'expected': isNotNull},
        {'value': DateTime(2026, 6, 1, 12, 0), 'expected': isNull},
      ];

      // Act
      final results =
          cases.map((c) => requiredDateTime(c['value'] as DateTime?)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredMolecule works correctly', () {
      // Arrange
      final cases = [
        {'value': null, 'expected': isNotNull},
        {'value': KnownMolecules.bicalutamide, 'expected': isNull},
      ];

      // Act
      final results =
          cases.map((c) => requiredMolecule(c['value'] as Molecule?)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredAdministrationRoute works correctly', () {
      // Arrange
      final cases = [
        {'value': null, 'expected': isNotNull},
        {'value': AdministrationRoute.suppository, 'expected': isNull},
      ];

      // Act
      final results = cases
          .map((c) => requiredAdministrationRoute(
                c['value'] as AdministrationRoute?,
              ))
          .toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('strictlyPositiveDecimal works correctly', () {
      // Arrange
      final cases = [
        // null / empty
        {'value': null, 'expected': isNull},
        {'value': '', 'expected': isNull},

        // invalid format
        {'value': 'abc', 'expected': isNotNull},
        {'value': '1..2', 'expected': isNotNull},

        // zero & negative
        {'value': '0', 'expected': isNotNull},
        {'value': '0.0', 'expected': isNotNull},
        {'value': '-1', 'expected': isNotNull},
        {'value': '-0.1', 'expected': isNotNull},

        // valid positives
        {'value': '1', 'expected': isNull},
        {'value': '.1', 'expected': isNull},
        {'value': '10.5', 'expected': isNull},

        // comma support
        {'value': '1,5', 'expected': isNull},
        {'value': ',01', 'expected': isNull},

        // tricky edge cases
        {'value': ' 1', 'expected': isNull},
        {'value': '1 ', 'expected': isNull},
      ];

      // Act
      final results = cases
          .map((c) => strictlyPositiveDecimal(c['value'] as String?))
          .toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('positiveDecimal works correctly', () {
      // Arrange
      final cases = [
        // null / empty
        {'value': null, 'expected': isNull},
        {'value': '', 'expected': isNull},

        // invalid format
        {'value': 'abc', 'expected': isNotNull},
        {'value': '1..2', 'expected': isNotNull},

        // negative
        {'value': '-1', 'expected': isNotNull},
        {'value': '-0.1', 'expected': isNotNull},

        // valid positives & zero
        {'value': '1', 'expected': isNull},
        {'value': '.1', 'expected': isNull},
        {'value': '10.5', 'expected': isNull},
        {'value': '0', 'expected': isNull},
        {'value': '0.0', 'expected': isNull},

        // comma support
        {'value': '1,5', 'expected': isNull},
        {'value': ',01', 'expected': isNull},

        // tricky edge cases
        {'value': ' 1', 'expected': isNull},
        {'value': '1 ', 'expected': isNull},
      ];

      // Act
      final results =
          cases.map((c) => positiveDecimal(c['value'] as String?)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('positiveInt works correctly', () {
      // Arrange
      final cases = [
        // null / empty
        {'value': null, 'expected': isNull},
        {'value': '', 'expected': isNull},

        // invalid format
        {'value': 'abc', 'expected': isNotNull},
        {'value': '1..2', 'expected': isNotNull},

        // negative & zero
        {'value': '-1', 'expected': isNotNull},
        {'value': '-0.1', 'expected': isNotNull},
        {'value': '0', 'expected': isNotNull},
        {'value': '0.0', 'expected': isNotNull},

        // decimals
        {'value': '.1', 'expected': isNotNull},
        {'value': '10.5', 'expected': isNotNull},

        // ints
        {'value': '1', 'expected': isNull},
        {'value': '4', 'expected': isNull},

        // tricky edge cases
        {'value': ' 1', 'expected': isNull},
        {'value': '1 ', 'expected': isNull},
      ];

      // Act
      final results =
          cases.map((c) => positiveInt(c['value'] as String?)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredStrictlyPositiveDecimal works correctly', () {
      // Arrange
      final cases = [
        // null / empty
        {'value': null, 'expected': isNotNull},
        {'value': '', 'expected': isNotNull},

        // invalid format
        {'value': 'abc', 'expected': isNotNull},
        {'value': '1..2', 'expected': isNotNull},

        // zero & negative
        {'value': '0', 'expected': isNotNull},
        {'value': '0.0', 'expected': isNotNull},
        {'value': '-1', 'expected': isNotNull},
        {'value': '-0.1', 'expected': isNotNull},

        // valid positives
        {'value': '1', 'expected': isNull},
        {'value': '.1', 'expected': isNull},
        {'value': '10.5', 'expected': isNull},

        // comma support
        {'value': '1,5', 'expected': isNull},
        {'value': ',01', 'expected': isNull},

        // tricky edge cases
        {'value': ' 1', 'expected': isNull},
        {'value': '1 ', 'expected': isNull},
      ];

      // Act
      final results = cases
          .map((c) => requiredStrictlyPositiveDecimal(c['value'] as String?))
          .toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredPositiveDecimal works correctly', () {
      // Arrange
      final cases = [
        // null / empty
        {'value': null, 'expected': isNotNull},
        {'value': '', 'expected': isNotNull},

        // invalid format
        {'value': 'abc', 'expected': isNotNull},
        {'value': '1..2', 'expected': isNotNull},

        // negative
        {'value': '-1', 'expected': isNotNull},
        {'value': '-0.1', 'expected': isNotNull},

        // valid positives & zero
        {'value': '1', 'expected': isNull},
        {'value': '.1', 'expected': isNull},
        {'value': '10.5', 'expected': isNull},
        {'value': '0', 'expected': isNull},
        {'value': '0.0', 'expected': isNull},

        // comma support
        {'value': '1,5', 'expected': isNull},
        {'value': ',01', 'expected': isNull},

        // tricky edge cases
        {'value': ' 1', 'expected': isNull},
        {'value': '1 ', 'expected': isNull},
      ];

      // Act
      final results = cases
          .map((c) => requiredPositiveDecimal(c['value'] as String?))
          .toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredPositiveInt works correctly', () {
      // Arrange
      final cases = [
        // null / empty
        {'value': null, 'expected': isNotNull},
        {'value': '', 'expected': isNotNull},

        // invalid format
        {'value': 'abc', 'expected': isNotNull},
        {'value': '1..2', 'expected': isNotNull},

        // negative & zero
        {'value': '-1', 'expected': isNotNull},
        {'value': '-0.1', 'expected': isNotNull},
        {'value': '0', 'expected': isNotNull},
        {'value': '0.0', 'expected': isNotNull},

        // decimals
        {'value': '.1', 'expected': isNotNull},
        {'value': '10.5', 'expected': isNotNull},

        // ints
        {'value': '1', 'expected': isNull},
        {'value': '4', 'expected': isNull},

        // tricky edge cases
        {'value': ' 1', 'expected': isNull},
        {'value': '1 ', 'expected': isNull},
      ];

      // Act
      final results =
          cases.map((c) => requiredPositiveInt(c['value'] as String?)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });

    test('requiredList works correctly', () {
      // Arrange
      final cases = [
        {'value': <int>[], 'expected': isNotNull},
        {
          'value': const [4],
          'expected': isNull,
        },
        {
          'value': const [6, 7],
          'expected': isNull,
        },
      ];

      // Act
      final results =
          cases.map((c) => requiredList(c['value'] as List<int>)).toList();
      final expected = cases.map((c) => c['expected'] as Matcher).toList();

      // Assert
      expect(results, expected);
    });
  });
}
