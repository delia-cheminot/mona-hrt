import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import '../../fixtures.dart';
import 'generic_repository_mock.dart';

void main() {
  late MedicationIntakeProvider provider;
  late GenericRepositoryMock<MedicationIntake> repo;

  setUpAll(() {
    tz.initializeTimeZones();
  });

  setUp(() {
    repo = GenericRepositoryMock<MedicationIntake>(
      withId: (i, id) => MedicationIntake(
          id: id,
          takenDose: i.takenDose,
          takenDateTime: i.takenDateTime,
          takenTimeZone: i.takenTimeZone,
          scheduleId: i.scheduleId,
          molecule: i.molecule,
          administrationRoute: i.administrationRoute,
          ester: i.ester),
    );
    provider = MedicationIntakeProvider(repository: repo);
    repo.insert(MedicationIntake(
      id: 1,
      takenDose: Decimal.parse('10.5'),
      takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
      takenTimeZone: 'Etc/UTC',
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.gel,
    ));
    repo.insert(MedicationIntake(
      id: 2,
      takenDose: Decimal.parse('5.0'),
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.gel,
    ));
  });

  group('MedicationIntakeProvider Tests', () {
    test('initialization loads intakes', () async {
      await provider.fetchIntakes();
      expect(provider.intakes.length, repo.items.length);
    });

    test('add inserts a new item', () async {
      // Arrange
      final newDose = Decimal.parse('2.5');

      // Act
      await provider.add(MedicationIntake(
        takenDose: newDose,
        takenDateTime: DateTime.utc(2025, 9, 13, 8, 10),
        takenTimeZone: 'Etc/UTC',
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      ));

      // Assert
      expect(
        provider.intakes.any((i) => i.takenDose == newDose),
        true,
      );
    });

    test('updateIntake updates an existing item', () async {
      // Arrange
      final intakeToUpdate = repo.items.first;
      final updatedIntake = MedicationIntake(
        id: intakeToUpdate.id,
        takenDose: Decimal.parse('99.9'),
        takenDateTime: intakeToUpdate.takenDateTime,
        takenTimeZone: 'Etc/UTC',
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      );

      // Act
      await provider.updateIntake(updatedIntake);

      // Assert
      final fetchedIntake =
          provider.intakes.firstWhere((i) => i.id == intakeToUpdate.id);
      expect(fetchedIntake.takenDose, Decimal.parse('99.9'));
    });

    test('deleteIntakeFromId removes the item', () async {
      // Act
      await provider.deleteIntakeFromId(1);

      // Assert
      expect(
        [provider.intakes.length, provider.intakes.first.id],
        [1, 2],
      );
    });

    test('deleteIntake removes the item by object', () async {
      // Arrange
      final intakeToDelete = repo.items.first;

      // Act
      await provider.deleteIntake(intakeToDelete);

      // Assert
      expect(
        [provider.intakes.length, provider.intakes.first.id],
        [1, 2],
      );
    });

    test('takenIntakes and notTakenIntakes return correct subsets', () async {
      await provider.fetchIntakes();
      expect(
        [provider.takenIntakes, provider.notTakenIntakes],
        [
          repo.items.where((i) => i.isTaken).toList(),
          repo.items.where((i) => !i.isTaken).toList()
        ],
      );
    });

    test('takenIntakesSortedDesc returns taken intakes sorted descending',
        () async {
      await provider.fetchIntakes();
      provider.add(MedicationIntake(
        id: 100,
        takenDose: Decimal.parse('1.0'),
        takenDateTime: DateTime.utc(2025, 9, 14, 8, 10),
        takenTimeZone: 'Etc/UTC',
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      ));
      provider.add(MedicationIntake(
        id: 101,
        takenDose: Decimal.parse('1.0'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      ));
      provider.add(MedicationIntake(
        id: 102,
        takenDose: Decimal.parse('1.0'),
        takenDateTime: DateTime.utc(2025, 9, 16, 8, 10),
        takenTimeZone: 'Etc/UTC',
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.gel,
      ));

      final sorted = provider.takenIntakesSortedDesc;

      expect(
        sorted.asMap().entries.every((entry) {
          final i = entry.key;
          final intake = entry.value;
          if (!intake.isTaken) return false;
          if (i < sorted.length - 1) {
            final next = sorted[i + 1];
            if (intake.takenDateTime!.isBefore(next.takenDateTime!)) {
              return false;
            }
          }
          return true;
        }),
        true,
      );

      provider.deleteIntakeFromId(100);
      provider.deleteIntakeFromId(101);
      provider.deleteIntakeFromId(102);
    });

    group('getTakenIntakesForSchedule', () {
      test('returns only taken intakes for the given schedule', () async {
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 100,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 200,
          scheduleId: 200,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();

        expect(provider.getTakenIntakesForSchedule(100).length, 1);
      });

      test('returns empty list if no taken intakes for schedule', () async {
        await provider.fetchIntakes();

        expect(provider.getTakenIntakesForSchedule(3), isEmpty);
      });
    });

    group('getLastIntakeDateFromList', () {
      test('returns null if the list is empty', () {
        final result = provider.getLastIntakeLocalDateFromList([]);
        expect(result, isNull);
      });

      test('returns the only takenDateTime if list has one intake', () {
        final intake = MedicationIntake(
          id: 1,
          scheduleId: 1,
          takenDose: Decimal.parse('10.5'),
          takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        );

        final result = provider.getLastIntakeLocalDateFromList([intake]);
        expect(result, intake.takenLocalDate);
      });

      test('returns the latest takenDateTime if list has multiple intakes', () {
        final intake1 = MedicationIntake(
          id: 1,
          scheduleId: 1,
          takenDose: Decimal.parse('10.5'),
          takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        );

        final intake2 = MedicationIntake(
          id: 2,
          scheduleId: 1,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: DateTime.utc(2025, 9, 12, 20, 10),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        );

        final intake3 = MedicationIntake(
          id: 3,
          scheduleId: 1,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 5),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        );

        final result = provider
            .getLastIntakeLocalDateFromList([intake1, intake2, intake3]);
        expect(result, intake3.takenLocalDate);
      });

      test('handles intakes with same takenDateTime correctly', () {
        final dt = DateTime.utc(2025, 9, 12, 8, 0);
        final intake1 = MedicationIntake(
          id: 1,
          scheduleId: 1,
          takenDose: Decimal.parse('10.5'),
          takenDateTime: dt,
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        );

        final intake2 = MedicationIntake(
          id: 2,
          scheduleId: 1,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: dt,
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        );

        final result =
            provider.getLastIntakeLocalDateFromList([intake1, intake2]);
        expect(result, intake1.takenLocalDate);
      });
    });

    group('getTakenIntakesForScheduleOn', () {
      test('returns only taken intakes for the given schedule on given date',
          () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 42,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 101,
          scheduleId: 42,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 20, 30),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 102,
          scheduleId: 42,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: DateTime.utc(2025, 9, 14, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 103,
          scheduleId: 99,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();
        final targetDate = Date(year: 2025, month: 9, day: 13);

        // Act
        final result = provider.getTakenIntakesForScheduleOn(42, targetDate);

        // Assert
        expect(result.map((i) => i.id).toList(), [100, 101]);
      });

      test('returns empty list when no intakes match the date', () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 42,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();
        final otherDate = Date(year: 2025, month: 9, day: 14);

        // Act
        final result = provider.getTakenIntakesForScheduleOn(42, otherDate);

        // Assert
        expect(result, isEmpty);
      });

      test('returns empty list when no intakes match the schedule', () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 42,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();
        final targetDate = Date(year: 2025, month: 9, day: 13);

        // Act
        final result = provider.getTakenIntakesForScheduleOn(999, targetDate);

        // Assert
        expect(result, isEmpty);
      });
    });

    group('getLastTakenIntakeForSchedule', () {
      test('returns null when no taken intakes exist for schedule', () async {
        // Arrange
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenIntakeForSchedule(999);

        // Assert
        expect(result, isNull);
      });

      test('returns the only intake when schedule has a single taken intake',
          () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 42,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenIntakeForSchedule(42);

        // Assert
        expect(result?.id, 100);
      });

      test('returns the latest taken intake among multiple for the schedule',
          () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 42,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 101,
          scheduleId: 42,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: DateTime.utc(2025, 9, 14, 20, 30),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 102,
          scheduleId: 42,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 13, 9, 0),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenIntakeForSchedule(42);

        // Assert
        expect(result?.id, 101);
      });

      test('ignores intakes belonging to other schedules', () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          scheduleId: 42,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        repo.insert(MedicationIntake(
          id: 200,
          scheduleId: 99,
          takenDose: Decimal.parse('5.0'),
          takenDateTime: DateTime.utc(2025, 9, 20, 20, 30),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenIntakeForSchedule(42);

        // Assert
        expect(result?.id, 100);
      });
    });

    group('getLastTakenInjectionIntake', () {
      test('returns null when no taken intakes exist', () async {
        // Arrange
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenInjectionIntake();

        // Assert
        expect(result, isNull);
      });

      test('returns null when no injection intakes exist', () async {
        // Arrange (default setUp inserts only gel intakes)
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenInjectionIntake();

        // Assert
        expect(result, isNull);
      });

      test('returns the only injection intake', () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 13, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        ));
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenInjectionIntake();

        // Assert
        expect(result?.id, 100);
      });

      test('returns the latest injection among multiple injection intakes',
          () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        ));
        repo.insert(MedicationIntake(
          id: 101,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 14, 20, 30),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        ));
        repo.insert(MedicationIntake(
          id: 102,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 13, 9, 0),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        ));
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenInjectionIntake();

        // Assert
        expect(result?.id, 101);
      });

      test('ignores non-injection intakes even if they are more recent',
          () async {
        // Arrange
        repo.insert(MedicationIntake(
          id: 100,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 12, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        ));
        repo.insert(MedicationIntake(
          id: 200,
          takenDose: Decimal.parse('10.0'),
          takenDateTime: DateTime.utc(2025, 9, 20, 8, 15),
          takenTimeZone: 'Etc/UTC',
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.gel,
        ));
        await provider.fetchIntakes();

        // Act
        final result = provider.getLastTakenInjectionIntake();

        // Assert
        expect(result?.id, 100);
      });
    });

    group('graph intake pipeline', () {
      test('getFirstGraphIntakeInstant returns the earliest UTC instant',
          () async {
        repo.insert(anInjection(
            id: 10, takenDateTime: DateTime.utc(2025, 6, 2, 20, 0)));
        repo.insert(anInjection(
            id: 11, takenDateTime: DateTime.utc(2025, 6, 1, 8, 30)));
        await provider.fetchIntakes();

        expect(provider.getFirstGraphIntakeInstant(),
            DateTime.utc(2025, 6, 1, 8, 30));
      });

      test('getFirstGraphIntakeInstant is null when no plottable intakes',
          () async {
        // setUp only inserts gel intakes, which are not plottable.
        await provider.fetchIntakes();

        expect(provider.getFirstGraphIntakeInstant(), isNull);
      });

      test('getGraphStartInstant is at midnight in the local timezone',
          () async {
        repo.insert(anInjection(
            id: 10, takenDateTime: DateTime.utc(2025, 6, 1, 8, 30)));
        await provider.fetchIntakes();

        final start = provider.getGraphLocalStart()!;

        expect([start.hour, start.minute, start.second, start.millisecond],
            everyElement(0));
      });

      test('getGraphStartInstant lands on the first intake local day',
          () async {
        repo.insert(anInjection(
            id: 10, takenDateTime: DateTime.utc(2025, 6, 2, 20, 0)));
        repo.insert(anInjection(
            id: 11, takenDateTime: DateTime.utc(2025, 6, 1, 8, 30)));
        await provider.fetchIntakes();

        final start = provider.getGraphLocalStart()!;
        final firstLocal = provider.getFirstGraphIntakeInstant()!.toLocal();

        expect([start.year, start.month, start.day],
            [firstLocal.year, firstLocal.month, firstLocal.day]);
      });

      test('getGraphStartInstant never sits after the first intake', () async {
        repo.insert(anInjection(
            id: 10, takenDateTime: DateTime.utc(2025, 6, 1, 8, 30)));
        await provider.fetchIntakes();

        final start = provider.getGraphLocalStart()!;

        expect(start.isAfter(provider.getFirstGraphIntakeInstant()!), isFalse);
      });

      test('getGraphStartInstant is null when no plottable intakes', () async {
        await provider.fetchIntakes();

        expect(provider.getGraphLocalStart(), isNull);
      });

      test('excludes non-injection intakes from the graph', () async {
        repo.insert(
            anInjection(id: 10, takenDateTime: DateTime.utc(2025, 6, 1, 8, 0)));
        await provider.fetchIntakes(); // setUp already added gel intakes

        final baseline = provider.getFirstGraphIntakeInstant()!;

        expect(provider.getIntakesForGraph(baseline).length, 1);
      });

      test('the baseline injection has offset zero', () async {
        repo.insert(anInjection(
            id: 10, takenDateTime: DateTime.utc(2025, 6, 1, 23, 39)));
        await provider.fetchIntakes();

        final baseline = provider.getFirstGraphIntakeInstant()!;

        expect(provider.getIntakesForGraph(baseline).single.time,
            closeTo(0.0, 1e-9));
      });

      test('a later injection gets its exact fractional offset', () async {
        // 12h after the baseline -> 0.5 days, not a snapped whole number.
        repo.insert(anInjection(
            id: 10, takenDateTime: DateTime.utc(2025, 6, 1, 23, 39)));
        repo.insert(anInjection(
            id: 11, takenDateTime: DateTime.utc(2025, 6, 2, 11, 39)));
        await provider.fetchIntakes();

        final baseline = provider.getFirstGraphIntakeInstant()!;

        expect(
            provider.getIntakesForGraph(baseline)[1].time, closeTo(0.5, 1e-9));
      });

      test('getGraphSpan is the offset of the last intake from the baseline',
          () async {
        repo.insert(
            anInjection(id: 10, takenDateTime: DateTime.utc(2025, 6, 1, 6, 0)));
        repo.insert(anInjection(
            id: 11, takenDateTime: DateTime.utc(2025, 6, 3, 18, 0)));
        await provider.fetchIntakes();

        final baseline = provider.getFirstGraphIntakeInstant()!;

        // 2 days 12h -> 2.5 days.
        expect(provider.getGraphSpan(baseline), closeTo(2.5, 1e-9));
      });

      test('getGraphSpan is null when no plottable intakes', () async {
        await provider.fetchIntakes();

        expect(provider.getGraphSpan(DateTime.utc(2025, 6, 1)), isNull);
      });
    });
  });
}
