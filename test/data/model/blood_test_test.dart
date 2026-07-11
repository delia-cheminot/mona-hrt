import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/units.dart';

void main() {
  group('BloodTest', () {
    test('toMap and fromMap should preserve values', () {
      // Arrange
      final bloodtest = BloodTest(
        id: 1,
        dateTime: DateTime.utc(2025, 3, 14, 6, 7),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('167.1'), EstradiolUnit.pg_mL),
        testosteroneLevels: null,
      );

      // Act
      final map = bloodtest.toMap();
      final fromMap = BloodTest.fromMap(map);

      // Assert
      expect(
        fromMap,
        isA<BloodTest>()
            .having((i) => i.id, 'id', bloodtest.id)
            .having((i) => i.dateTime, 'date', bloodtest.dateTime)
            .having((i) => i.timeZone, 'timeZone', bloodtest.timeZone)
            .having((i) => i.estradiolLevels, 'estradiolLevels',
                bloodtest.estradiolLevels)
            .having((i) => i.testosteroneLevels, 'testosteroneLevels',
                bloodtest.testosteroneLevels),
      );
    });

    test('copyWith overrides only provided fields', () {
      // Arrange
      final original = BloodTest(
        id: 1,
        dateTime: DateTime.utc(2024, 1, 1),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('167.1'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('1.67'), TestosteroneUnit.ng_dL),
      );
      final newDate = DateTime.utc(2025, 1, 1);

      // Act
      final result = original.copyWith(dateTime: newDate);

      // Assert
      expect(
        result,
        BloodTest(
          id: original.id,
          dateTime: newDate,
          timeZone: 'Etc/UTC',
          estradiolLevels: original.estradiolLevels,
          testosteroneLevels: original.testosteroneLevels,
        ),
      );
    });

    test('copyWith does not mutate original object', () {
      // Arrange
      final original = BloodTest(
        id: 1,
        dateTime: DateTime.utc(2024, 1, 1),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('10'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('20'), TestosteroneUnit.ng_dL),
      );

      // Act
      original.copyWith(id: 2);

      // Assert
      expect(original.id, 1);
    });

    test('constructor throws if dateTime is not UTC', () {
      // Arrange
      final localDateTime = DateTime(2024, 1, 1);

      // Act & Assert
      expect(
        () => BloodTest(
          id: 1,
          dateTime: localDateTime,
          timeZone: 'Etc/UTC',
        ),
        throwsArgumentError,
      );
    });
  });
}
