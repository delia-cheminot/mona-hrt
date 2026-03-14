import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/util/date_helpers.dart';

void main() {
  group('MedicationSchedule', () {
    group('MedicationSchedule model', () {
      test('toMap and fromMap should preserve values', () {
        final schedule = MedicationSchedule(
          id: 1,
          name: 'Test Med',
          dose: Decimal.parse('10.5'),
          intervalDays: 7,
          startDate: DateTime.now(),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
          ester: Ester.cypionate,
          notificationTimes: List.from([
            TimeOfDay(hour: 12, minute: 30),
            TimeOfDay(hour: 18, minute: 30)
          ]),
        );

        final map = schedule.toMap();
        final fromMap = MedicationSchedule.fromMap(map);

        expect(
          fromMap,
          isA<MedicationSchedule>()
              .having((s) => s.id, 'id', schedule.id)
              .having((s) => s.name, 'name', schedule.name)
              .having((s) => s.dose, 'dose', schedule.dose)
              .having(
                  (s) => s.intervalDays, 'intervalDays', schedule.intervalDays)
              .having((s) => s.startDate, 'startDate', schedule.startDate)
              .having((s) => s.molecule, 'molecule', schedule.molecule)
              .having((s) => s.administrationRoute, 'administrationRoute',
                  schedule.administrationRoute)
              .having((s) => s.ester, 'ester', schedule.ester)
              .having((s) => s.notificationTimes, 'notificationTimes',
                  schedule.notificationTimes),
        );
      });

      test('validateName works correctly', () {
        expect(
          [
            MedicationSchedule.validateName(null),
            MedicationSchedule.validateName(''),
            MedicationSchedule.validateName('Valid'),
          ],
          [
            isNotNull,
            isNotNull,
            isNull,
          ],
        );
      });

      test('validateDose works correctly', () {
        expect(
          [
            MedicationSchedule.validateDose(null),
            MedicationSchedule.validateDose(''),
            MedicationSchedule.validateDose('0'),
            MedicationSchedule.validateDose('-1'),
            MedicationSchedule.validateDose('abc'),
            MedicationSchedule.validateDose('2.5'),
          ],
          [
            isNotNull,
            isNotNull,
            isNotNull,
            isNotNull,
            isNotNull,
            isNull,
          ],
        );
      });

      test('validateIntervalDays works correctly', () {
        expect(
          [
            MedicationSchedule.validateIntervalDays(null),
            MedicationSchedule.validateIntervalDays(''),
            MedicationSchedule.validateIntervalDays('0'),
            MedicationSchedule.validateIntervalDays('-2'),
            MedicationSchedule.validateIntervalDays('abc'),
            MedicationSchedule.validateIntervalDays('7'),
          ],
          [
            isNotNull,
            isNotNull,
            isNotNull,
            isNotNull,
            isNotNull,
            isNull,
          ],
        );
      });

      test('validateStartDate works correctly', () {
        // Arrange
        final cases = [
          {'value': null, 'expected': isNotNull},
          {'value': DateTime.now(), 'expected': isNull},
        ];

        // Act
        final results = cases
            .map((c) =>
                MedicationSchedule.validateStartDate(c['value'] as DateTime?))
            .toList();
        final expected = cases.map((c) => c['expected'] as Matcher).toList();

        // Assert
        expect(results, expected);
      });

      test('validateMolecule works correctly', () {
        // Arrange
        final cases = [
          {'value': null, 'expected': isNotNull},
          {'value': KnownMolecules.decapeptyl, 'expected': isNull},
        ];

        // Act
        final results = cases
            .map((c) =>
                MedicationSchedule.validateMolecule(c['value'] as Molecule?))
            .toList();
        final expected = cases.map((c) => c['expected'] as Matcher).toList();

        // Assert
        expect(results, expected);
      });

      test('validateAdministrationRoute works correctly', () {
        // Arrange
        final cases = [
          {'value': null, 'expected': isNotNull},
          {'value': AdministrationRoute.implant, 'expected': isNull},
        ];

        // Act
        final results = cases
            .map((c) => MedicationSchedule.validateAdministrationRoute(
                c['value'] as AdministrationRoute?))
            .toList();
        final expected = cases.map((c) => c['expected'] as Matcher).toList();

        // Assert
        expect(results, expected);
      });

      test('validateEster works correctly', () {
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
          final validator = MedicationSchedule.esterValidator(
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

    DateTime d(int y, int m, int day) => DateTime(y, m, day);

    group('getNextDate', () {
      test('startDate > today -> returns startDate', () {
        final today = d(2025, 1, 10);
        final start = d(2025, 1, 15);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.getNextDate(referenceDate: today), start);
      });

      test('startDate == today -> returns startDate', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: today,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.getNextDate(referenceDate: today), today);
      });

      test(
          'today falls outside a scheduled date -> returns the next scheduled date',
          () {
        final today = d(2025, 1, 5);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final expectedNext = d(2025, 1, 8);
        expect(s.getNextDate(referenceDate: today), expectedNext);
      });

      test('today falls exactly on a scheduled date -> returns today', () {
        final today = d(2025, 1, 8);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final expectedNext = d(2025, 1, 8);
        expect(s.getNextDate(referenceDate: today), expectedNext);
      });

      test('intervalDays = 1 and startDate < today -> returns today', () {
        final today = d(2025, 1, 10);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 1,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final expectedNext = d(2025, 1, 10);
        expect(s.getNextDate(referenceDate: today), expectedNext);
      });
    });

    group('getLastDate', () {
      test('startDate > today -> returns null', () {
        final today = d(2025, 1, 10);
        final start = d(2025, 1, 15);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.getLastDate(referenceDate: today), isNull);
      });

      test('startDate == today -> returns null', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: today,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.getLastDate(referenceDate: today), isNull);
      });

      test(
          'today falls outside a scheduled date -> returns the most recent past scheduled date',
          () {
        final today = d(2025, 1, 5);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final expectedLast = d(2025, 1, 1);
        expect(s.getLastDate(referenceDate: today), expectedLast);
      });

      test(
          'today falls exactly on a scheduled date -> returns scheduled date before today',
          () {
        final today = d(2025, 1, 8);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.getLastDate(referenceDate: today), d(2025, 1, 1));
      });

      test(
          'intervalDays = 1 and startDate < today -> returns scheduled date before today',
          () {
        final today = d(2025, 1, 10);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 1,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.getLastDate(referenceDate: today), d(2025, 1, 9));
      });
    });

    group('Consistency checks between last and next date', () {
      test(
          'when startDate < today -> lastDate < nextDate and difference == intervalDays',
          () {
        final today = d(2025, 1, 5);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final last = s.getLastDate(referenceDate: today);
        final next = s.getNextDate(referenceDate: today);

        expect(next.difference(last!).inDays, s.intervalDays);
      });

      test(
          'difference == intervalDays when today is exactly on a scheduled date',
          () {
        final today = d(2025, 1, 8);
        final start = d(2025, 1, 1);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final last = s.getLastDate(referenceDate: today);
        final next = s.getNextDate(referenceDate: today);

        expect(next.difference(last!).inDays, s.intervalDays);
      });
    });

    group('getNextDates', () {
      DateTime d(int y, int m, int day) => DateTime(y, m, day);

      test('today is an intake date -> first returned date is today', () {
        final today = d(2025, 1, 8);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 3, referenceDate: today);

        expect(dates.first, today);
      });

      test(
          'today is not an intake date -> first returned date is next scheduled date',
          () {
        final today = d(2025, 1, 5);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 2, referenceDate: today);

        expect(dates.first, d(2025, 1, 8));
      });

      test('startDate is today -> first returned date is today', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: today,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 2, referenceDate: today);

        expect(dates.first, today);
      });

      test('startDate is in the future -> first returned date is startDate',
          () {
        final today = d(2025, 1, 10);
        final start = d(2025, 1, 15);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: start,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 2, referenceDate: today);

        expect(dates.first, start);
      });

      test('count = 1 -> returns exactly one date', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 1, referenceDate: today);

        expect(dates.length, 1);
      });

      test('count > 1 -> returns exactly count dates', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 4, referenceDate: today);

        expect(dates.length, 4);
      });

      test('returned dates are spaced by intervalDays', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 3, referenceDate: today);

        expect(dates[2].difference(dates[1]).inDays, 7);
      });

      test('count = 0 -> returns empty list', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final dates = s.getNextDates(count: 0, referenceDate: today);

        expect(dates, isEmpty);
      });

      test('count < 0 -> throws ArgumentError', () {
        final today = d(2025, 1, 10);
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: d(2025, 1, 1),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(
          () => s.getNextDates(count: -1, referenceDate: today),
          throwsArgumentError,
        );
      });
    });

    group('isScheduledForToday', () {
      test('returns true when today is a scheduled date', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday(),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isScheduledForToday(), isTrue);
      });

      test('returns false when next scheduled date is in future', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().add(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isScheduledForToday(), isFalse);
      });

      test('returns false when next scheduled date is in past', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().subtract(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isScheduledForToday(), isFalse);
      });
    });

    group('isLate', () {
      test('returns true when lastTaken is before lastDate', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().subtract(Duration(days: 14)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final lastTaken = s.getLastDate()!.subtract(Duration(days: 1));

        expect(s.isLate(lastTaken), isTrue);
      });

      test('returns false when lastTaken is on lastDate', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().subtract(Duration(days: 14)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final lastTaken = s.getLastDate()!;

        expect(s.isLate(lastTaken), isFalse);
      });

      test('returns false when lastTaken is after lastDate', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().subtract(Duration(days: 14)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final lastTaken = s.getLastDate()!.add(Duration(days: 1));

        expect(s.isLate(lastTaken), isFalse);
      });

      test('returns true when lastTaken is null but schedule is overdue', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().subtract(Duration(days: 14)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isLate(null), isTrue);
      });

      test(
          'returns false when lastTaken is null but treatment is scheduled for today',
          () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday(),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isLate(null), isFalse);
      });

      test(
          'returns false when lastTaken is null but next scheduled date is in the future',
          () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().add(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isLate(null), isFalse);
      });
    });

    group('isTakenTodayOrLater', () {
      test('returns false if no last taken', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().add(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        expect(s.isTakenTodayOrLater(null), false);
      });

      test('returns false if last taken date is before today', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().add(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final lastTakenDate = DateTime.now().subtract(const Duration(days: 1));

        expect(s.isTakenTodayOrLater(lastTakenDate), false);
      });

      test('returns true if last taken date is after today', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().add(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final lastTakenDate = DateTime.now().add(const Duration(days: 1));

        expect(s.isTakenTodayOrLater(lastTakenDate), true);
      });

      test('returns true if last taken date is today', () {
        final s = MedicationSchedule(
          name: 'A',
          dose: Decimal.one,
          intervalDays: 7,
          startDate: normalizedToday().add(Duration(days: 3)),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
          notificationTimes: List.empty(),
        );

        final lastTakenDate = DateTime.now();

        expect(s.isTakenTodayOrLater(lastTakenDate), true);
      });
    });
  });
}
