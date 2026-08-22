import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import '../../fixtures.dart';
import 'generic_repository_mock.dart';

void main() {
  late BloodTestProvider provider;
  late GenericRepositoryMock<BloodTest> repo;

  setUpAll(() {
    tz.initializeTimeZones();
  });

  setUp(() {
    repo = GenericRepositoryMock<BloodTest>(
      withId: (i, id) => BloodTest(
        id: id,
        dateTime: i.dateTime,
        timeZone: i.timeZone,
        estradiolLevels: i.estradiolLevels,
        testosteroneLevels: i.testosteroneLevels,
      ),
    );
  });

  group('BloodTestProvider Tests', () {
    test('initialization loads bloodtests', () async {
      // Arrange
      await repo.insert(BloodTest(
        id: 1,
        dateTime: DateTime.utc(2025, 3, 14, 6, 7),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('167.1'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('1.67'), TestosteroneUnit.ng_dL),
      ));

      // Act
      provider = BloodTestProvider(repository: repo);
      await Future.doWhile(() async {
        if (provider.isLoading) {
          await Future.delayed(Duration(milliseconds: 10));
          return true;
        }
        return false;
      });

      // Assert
      expect(provider.bloodtestsSortedDesc.length, repo.items.length);
    });

    test('add inserts a new test', () async {
      // Arrange
      final newDate = DateTime.utc(2025, 1, 1, 1, 1);
      final newEstradiolLevels =
          UnitValue(Decimal.parse('111.1'), EstradiolUnit.pg_mL);
      final newTestosteroneLevels =
          UnitValue(Decimal.parse('1.1'), TestosteroneUnit.ng_dL);
      provider = BloodTestProvider(repository: repo);

      // Act
      await provider.add(BloodTest(
        dateTime: newDate,
        timeZone: 'Etc/UTC',
        estradiolLevels: newEstradiolLevels,
        testosteroneLevels: newTestosteroneLevels,
      ));

      // Assert
      expect(
        provider.bloodtestsSortedDesc.any((i) =>
            i.dateTime == newDate &&
            i.estradiolLevels == newEstradiolLevels &&
            i.testosteroneLevels == newTestosteroneLevels),
        true,
      );
    });

    test('updateBloodTest updates an existing test', () async {
      // Arrange
      repo.insert(BloodTest(
        id: 1,
        dateTime: DateTime.utc(2025, 3, 14, 6, 7),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('167.1'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('1.67'), TestosteroneUnit.ng_dL),
      ));
      provider = BloodTestProvider(repository: repo);
      final bloodtestToUpdate = repo.items.first;
      final updatedBloodTest = BloodTest(
        id: bloodtestToUpdate.id,
        dateTime: DateTime.utc(2025, 2, 2, 2, 2),
        timeZone: 'Etc/UTC',
        estradiolLevels: bloodtestToUpdate.estradiolLevels,
        testosteroneLevels: bloodtestToUpdate.testosteroneLevels,
      );

      // Act
      await provider.updateBloodTest(updatedBloodTest);

      // Assert
      final fetchedBloodTests = provider.bloodtestsSortedDesc
          .firstWhere((i) => i.id == bloodtestToUpdate.id);
      expect(fetchedBloodTests.dateTime, DateTime.utc(2025, 2, 2, 2, 2));
    });

    test('deleteBloodTestFromId removes the test', () async {
      // Arrange
      repo.insert(BloodTest(
        id: 1,
        dateTime: DateTime.utc(2025, 3, 14, 6, 7),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('167.1'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('1.67'), TestosteroneUnit.ng_dL),
      ));
      provider = BloodTestProvider(repository: repo);

      // Act
      await provider.deleteBloodTestFromId(1);

      // Assert
      expect(provider.bloodtestsSortedDesc.length, 0);
    });

    test('deleteBloodTest removes the test by object', () async {
      // Arrange
      final bloodtestToDelete = BloodTest(
        id: 1,
        dateTime: DateTime.utc(2025, 3, 14, 6, 7),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('167.1'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('1.67'), TestosteroneUnit.ng_dL),
      );

      repo.insert(bloodtestToDelete);
      provider = BloodTestProvider(repository: repo);

      // Act
      await provider.deleteBloodTest(bloodtestToDelete);

      // Assert
      expect(provider.bloodtestsSortedDesc.length, 0);
    });

    test('bloodtestsSortedDesc returns test sorted descending', () async {
      provider = BloodTestProvider(repository: repo);
      provider.add(BloodTest(
        id: 666,
        dateTime: DateTime.utc(2025, 5, 4, 3, 0),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('234.5'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('2.34'), TestosteroneUnit.ng_dL),
      ));
      provider.add(BloodTest(
        id: 667, // ekip
        dateTime: DateTime.utc(2025, 6, 7, 8, 9),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('292.9'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('2.43'), TestosteroneUnit.ng_dL),
      ));
      provider.add(BloodTest(
        id: 668,
        dateTime: DateTime.utc(2025, 3, 2, 1, 0),
        timeZone: 'Etc/UTC',
        estradiolLevels: UnitValue(Decimal.parse('261.2'), EstradiolUnit.pg_mL),
        testosteroneLevels:
            UnitValue(Decimal.parse('3.3'), TestosteroneUnit.ng_dL),
      ));

      final sorted = provider.bloodtestsSortedDesc;

      expect(
        sorted.asMap().entries.every((entry) {
          final i = entry.key;
          final bloodtest = entry.value;
          if (i < sorted.length - 1) {
            final next = sorted[i + 1];
            if (bloodtest.dateTime.isBefore(next.dateTime)) {
              return false;
            }
          }
          return true;
        }),
        true,
      );
    });

    group('estradiolTestsSortedDesc', () {
      test('excludes tests without estradiol levels', () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            id: 1,
            dateTime: DateTime.utc(2025, 5, 4),
            estradiolLevel: Decimal.parse('100.0')));
        await provider.add(aBloodTest(
            id: 2,
            dateTime: DateTime.utc(2025, 5, 5),
            testosteroneLevel: Decimal.parse('1.0')));

        // Act
        final result = provider.estradiolTestsSortedDesc;

        // Assert
        expect(result.map((t) => t.id), [1]);
      });

      test('returns tests sorted descending by date', () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            id: 1,
            dateTime: DateTime.utc(2025, 5, 4),
            estradiolLevel: Decimal.parse('100.0')));
        await provider.add(aBloodTest(
            id: 2,
            dateTime: DateTime.utc(2025, 6, 7),
            estradiolLevel: Decimal.parse('200.0')));
        await provider.add(aBloodTest(
            id: 3,
            dateTime: DateTime.utc(2025, 3, 2),
            estradiolLevel: Decimal.parse('150.0')));

        // Act
        final result = provider.estradiolTestsSortedDesc;

        // Assert
        expect(result.map((t) => t.id), [2, 1, 3]);
      });
    });

    group('testosteroneTestsSortedDesc', () {
      test('excludes tests without testosterone levels', () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            id: 1,
            dateTime: DateTime.utc(2025, 5, 4),
            testosteroneLevel: Decimal.parse('1.0')));
        await provider.add(aBloodTest(
            id: 2,
            dateTime: DateTime.utc(2025, 5, 5),
            estradiolLevel: Decimal.parse('100.0')));

        // Act
        final result = provider.testosteroneTestsSortedDesc;

        // Assert
        expect(result.map((t) => t.id), [1]);
      });

      test('returns tests sorted descending by date', () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            id: 1,
            dateTime: DateTime.utc(2025, 5, 4),
            testosteroneLevel: Decimal.parse('1.0')));
        await provider.add(aBloodTest(
            id: 2,
            dateTime: DateTime.utc(2025, 6, 7),
            testosteroneLevel: Decimal.parse('2.0')));
        await provider.add(aBloodTest(
            id: 3,
            dateTime: DateTime.utc(2025, 3, 2),
            testosteroneLevel: Decimal.parse('1.5')));

        // Act
        final result = provider.testosteroneTestsSortedDesc;

        // Assert
        expect(result.map((t) => t.id), [2, 1, 3]);
      });
    });

    group('getBloodTestsForGraph', () {
      test('returns empty list when no bloodtests', () {
        // Arrange
        provider = BloodTestProvider(repository: repo);

        // Act
        final result = provider.getBloodTestsForGraph(
            DateTime.utc(2025, 5, 4), EstradiolUnit.pg_mL);

        // Assert
        expect(result, isEmpty);
      });

      test('excludes bloodtests without estradiolLevels', () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 5, 4, 3, 0),
            estradiolLevel: Decimal.parse('234.5')));
        await provider
            .add(aBloodTest(dateTime: DateTime.utc(2025, 5, 5))); // no level

        // Act
        final result = provider.getBloodTestsForGraph(
            DateTime.utc(2025, 5, 4), EstradiolUnit.pg_mL);

        // Assert
        expect(result.map((t) => t.level), [234.5]);
      });

      test('excludes bloodtests strictly before the baseline instant',
          () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 5, 3, 12, 0),
            estradiolLevel: Decimal.parse('100.0')));
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 5, 5, 12, 0),
            estradiolLevel: Decimal.parse('200.0')));

        // Act
        final result = provider.getBloodTestsForGraph(
            DateTime.utc(2025, 5, 4), EstradiolUnit.pg_mL);

        // Assert
        expect(result.map((t) => t.level), [200.0]);
      });

      test('computes a fractional-day offset from the exact baseline instant',
          () async {
        // Arrange: 2 days, 2 hours, 59 minutes after the baseline ->
        // ~2.1243 days.
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 5, 6, 23, 59),
            estradiolLevel: Decimal.parse('12.3')));

        // Act
        final result = provider.getBloodTestsForGraph(
            DateTime.utc(2025, 5, 4, 21, 0), EstradiolUnit.pg_mL);

        // Assert
        expect(result.single.offset, closeTo(2.1243, 1e-4));
      });
    });

    group('latestEstradiolLevel', () {
      test('returns null when no estradiol tests', () {
        // Arrange
        provider = BloodTestProvider(repository: repo);

        // Act
        final result = provider.latestEstradiolLevel(EstradiolUnit.pg_mL);

        // Assert
        expect(result, isNull);
      });

      test('returns most recent level converted to the requested unit',
          () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 5, 4),
            estradiolLevel: Decimal.parse('100')));
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 6, 7),
            estradiolLevel: Decimal.parse('200')));

        // Act
        final result = provider.latestEstradiolLevel(EstradiolUnit.pmol_L);

        // Assert
        expect(
          result,
          UnitValue(Decimal.parse('734.20'), EstradiolUnit.pmol_L),
        );
      });
    });

    group('latestTestosteroneLevel', () {
      test('returns null when no testosterone tests', () {
        // Arrange
        provider = BloodTestProvider(repository: repo);

        // Act
        final result = provider.latestTestosteroneLevel(TestosteroneUnit.ng_dL);

        // Assert
        expect(result, isNull);
      });

      test('returns most recent level converted to the requested unit',
          () async {
        // Arrange
        provider = BloodTestProvider(repository: repo);
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 5, 4),
            testosteroneLevel: Decimal.parse('100')));
        await provider.add(aBloodTest(
            dateTime: DateTime.utc(2025, 6, 7),
            testosteroneLevel: Decimal.parse('250')));

        // Act
        final result =
            provider.latestTestosteroneLevel(TestosteroneUnit.nmol_L);

        // Assert
        expect(
          result,
          UnitValue(Decimal.parse('8.66'), TestosteroneUnit.nmol_L),
        );
      });
    });
  });
}
