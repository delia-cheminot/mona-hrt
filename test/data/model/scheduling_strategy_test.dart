import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/scheduling_strategy.dart';

import '../../fixtures.dart';
import '../../util/test_clock.dart';

void main() {
  group('SchedulingStrategy', () {
    group('IntervalDaysSchedule.nextDate', () {
      test('startDate > today -> returns startDate', () {
        // Arrange
        final start = Date.today().add(Duration(days: 5));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, start);
      });

      test('startDate == today -> returns startDate', () {
        // Arrange
        final today = Date.today();
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final next = s.nextDate(today);

        // Assert
        expect(next, today);
      });

      test(
          'today falls outside a scheduled date -> returns the next scheduled date',
          () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 4));
        final s = IntervalDaysSchedule(intervalDays: 7);
        final expectedNext = Date.today().add(Duration(days: 3));

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, expectedNext);
      });

      test('today falls exactly on a scheduled date -> returns today', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 7));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, Date.today());
      });

      test('intervalDays = 1 and startDate < today -> returns today', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 1);

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, Date.today());
      });
    });

    group('IntervalDaysSchedule.previousDate', () {
      test('startDate > today -> returns null', () {
        // Arrange
        final start = Date.today().add(Duration(days: 5));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final previous = s.previousDate(start);

        // Assert
        expect(previous, isNull);
      });

      test('startDate == today -> returns null', () {
        // Arrange
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final previous = s.previousDate(Date.today());

        // Assert
        expect(previous, isNull);
      });

      test(
          'today falls outside a scheduled date -> returns the most recent past scheduled date',
          () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 4));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final previous = s.previousDate(start);

        // Assert
        expect(previous, start);
      });

      test(
          'today falls exactly on a scheduled date -> returns scheduled date before today',
          () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 7));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final previous = s.previousDate(start);

        // Assert
        expect(previous, start);
      });

      test('intervalDays = 1 and startDate < today -> returns yesterday', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 1);

        // Act
        final previous = s.previousDate(start);

        // Assert
        expect(previous, Date.today().subtract(Duration(days: 1)));
      });
    });

    group('Consistency between previous and next date', () {
      test(
          'when startDate < today -> previous < next and difference == intervalDays',
          () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 4));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final next = s.nextDate(start);
        final previous = s.previousDate(start);

        // Assert
        expect(next.differenceInDays(previous!), s.intervalDays);
      });

      test(
          'difference == intervalDays when today is exactly on a scheduled date',
          () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 7));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final next = s.nextDate(start);
        final previous = s.previousDate(start);

        // Assert
        expect(next.differenceInDays(previous!), s.intervalDays);
      });
    });

    group('IntervalDaysSchedule.getNextDates', () {
      test('today is an intake date -> first returned date is today', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 7));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 3);

        // Assert
        expect(dates.first, Date.today());
      });

      test(
          'today is not an intake date -> first returned date is next scheduled date',
          () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 4));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 2);

        // Assert
        expect(dates.first, Date.today().add(Duration(days: 3)));
      });

      test('startDate is today -> first returned date is today', () {
        // Arrange
        final today = Date.today();
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(today, 2);

        // Assert
        expect(dates.first, today);
      });

      test('startDate is in the future -> first returned date is startDate',
          () {
        // Arrange
        final start = Date.today().add(Duration(days: 5));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 2);

        // Assert
        expect(dates.first, start);
      });

      test('count = 1 -> returns exactly one date', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 1);

        // Assert
        expect(dates.length, 1);
      });

      test('count > 1 -> returns exactly count dates', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 4);

        // Assert
        expect(dates.length, 4);
      });

      test('returned dates are spaced by intervalDays', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 3);

        // Assert
        expect(dates[2].differenceInDays(dates[1]), 7);
      });

      test('count = 0 -> returns empty list', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act
        final dates = s.getNextDates(start, 0);

        // Assert
        expect(dates, isEmpty);
      });

      test('count < 0 -> throws ArgumentError', () {
        // Arrange
        final start = Date.today().subtract(Duration(days: 9));
        final s = IntervalDaysSchedule(intervalDays: 7);

        // Act & Assert
        expect(() => s.getNextDates(start, -1), throwsArgumentError);
      });
    });

    group('IntervalDaysSchedule.statusFor', () {
      IntervalDaysSchedule scheduledForToday() =>
          IntervalDaysSchedule(intervalDays: 7);

      Date scheduledForTodayStart() =>
          Date.today().subtract(Duration(days: 14));

      group('date == today', () {
        test('scheduled for today, taken today -> taken', () {
          // Arrange
          final s = scheduledForToday();

          // Act
          final status = s.statusFor(
              startDate: scheduledForTodayStart(), lastTaken: Date.today());

          // Assert
          expect(status, ScheduleStatus.taken);
        });

        test('scheduled for today, taken in the future -> taken', () {
          // Arrange
          final s = scheduledForToday();

          // Act
          final status = s.statusFor(
              startDate: scheduledForTodayStart(),
              lastTaken: Date.today().add(Duration(days: 1)));

          // Assert
          expect(status, ScheduleStatus.taken);
        });

        test(
            'scheduled for today, last intake before previous scheduled date -> todayOverdue',
            () {
          // Arrange
          final s = scheduledForToday();
          final start = scheduledForTodayStart();
          final lastTaken = s.previousDate(start)!.subtract(Duration(days: 1));

          // Act
          final status = s.statusFor(startDate: start, lastTaken: lastTaken);

          // Assert
          expect(status, ScheduleStatus.todayOverdue);
        });

        test('scheduled for today, never taken -> todayOverdue', () {
          // Arrange
          final s = scheduledForToday();

          // Act
          final status = s.statusFor(startDate: scheduledForTodayStart());

          // Assert
          expect(status, ScheduleStatus.todayOverdue);
        });

        test(
            'scheduled for today, last intake strictly between previous scheduled date and today -> todayEarly',
            () {
          // Arrange
          final s = scheduledForToday();
          final start = scheduledForTodayStart();
          final lastTaken = s.previousDate(start)!.add(Duration(days: 1));

          // Act
          final status = s.statusFor(startDate: start, lastTaken: lastTaken);

          // Assert
          expect(status, ScheduleStatus.todayEarly);
        });

        test(
            'scheduled for today, last intake equals previous scheduled date -> today',
            () {
          // Arrange
          final s = scheduledForToday();
          final start = scheduledForTodayStart();

          // Act
          final status =
              s.statusFor(startDate: start, lastTaken: s.previousDate(start));

          // Assert
          expect(status, ScheduleStatus.today);
        });

        test(
            'scheduled for today with no previous date and never taken -> today',
            () {
          // Arrange
          final s = IntervalDaysSchedule(intervalDays: 7);

          // Act
          final previous = s.previousDate(Date.today());
          final status = s.statusFor(startDate: Date.today());

          // Assert
          expect(previous, isNull);
          expect(status, ScheduleStatus.today);
        });

        test('not scheduled for today, last intake is overdue -> overdue', () {
          // Arrange
          final s = IntervalDaysSchedule(intervalDays: 7);
          final start = Date.today().subtract(Duration(days: 10));
          final lastTaken = s.previousDate(start)!.subtract(Duration(days: 1));

          // Act
          final status = s.statusFor(startDate: start, lastTaken: lastTaken);

          // Assert
          expect(status, ScheduleStatus.overdue);
        });

        test('not scheduled for today, never taken and overdue -> overdue', () {
          // Arrange
          final s = IntervalDaysSchedule(intervalDays: 7);
          final start = Date.today().subtract(Duration(days: 10));

          // Act
          final status = s.statusFor(startDate: start);

          // Assert
          expect(status, ScheduleStatus.overdue);
        });

        test('not scheduled for today, start date in the future -> upcoming',
            () {
          // Arrange
          final s = IntervalDaysSchedule(intervalDays: 7);

          // Act
          final status =
              s.statusFor(startDate: Date.today().add(Duration(days: 5)));

          // Assert
          expect(status, ScheduleStatus.upcoming);
        });

        test(
            'not scheduled for today, last intake on or after previous scheduled date -> upcoming',
            () {
          // Arrange
          final s = IntervalDaysSchedule(intervalDays: 7);
          final start = Date.today().subtract(Duration(days: 10));

          // Act
          final status =
              s.statusFor(startDate: start, lastTaken: s.previousDate(start));

          // Assert
          expect(status, ScheduleStatus.upcoming);
        });

        test('taken takes priority over todayEarly', () {
          // Arrange
          final s = scheduledForToday();

          // Act
          final status = s.statusFor(
              startDate: scheduledForTodayStart(), lastTaken: Date.today());

          // Assert
          expect(status, ScheduleStatus.taken);
        });
      });
    });

    group('DynamicIntervalSchedule.intakeDate', () {
      test('never taken, startDate today -> the startDate (today)', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);

        // Act
        final date = s.intakeDate(Date.today(), null);

        // Assert
        expect(date, Date.today());
      });

      test('never taken, startDate in the past -> the startDate', () {
        // Arrange
        final start = Date.today().subtract(const Duration(days: 4));
        final s = DynamicIntervalSchedule(intervalDays: 5);

        // Act
        final date = s.intakeDate(start, null);

        // Assert
        expect(date, start);
      });

      test('never taken, startDate in the future -> the startDate', () {
        // Arrange
        final start = Date.today().add(const Duration(days: 3));
        final s = DynamicIntervalSchedule(intervalDays: 5);

        // Act
        final date = s.intakeDate(start, null);

        // Assert
        expect(date, start);
      });

      test('taken -> lastTaken + intervalDays', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final lastTaken = Date.today().subtract(const Duration(days: 4));

        // Act
        final date = s.intakeDate(Date.today(), lastTaken);

        // Assert
        expect(date, Date.today().add(const Duration(days: 1)));
      });

      test('taken today -> a full interval from the take', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final lastTaken = Date.today();

        // Act
        final date = s.intakeDate(Date.today(), lastTaken);

        // Assert
        expect(date, Date.today().add(const Duration(days: 5)));
      });
    });

    group('DynamicIntervalSchedule constructor', () {
      test('rejects a non-positive interval', () {
        // Arrange
        dynamicScheduleFactory() => DynamicIntervalSchedule(intervalDays: 0);

        // Act & Assert
        expect(dynamicScheduleFactory, throwsA(isA<AssertionError>()));
      });
    });

    group('DynamicIntervalSchedule.statusFor', () {
      test('taken today -> taken', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);

        // Act
        final status =
            s.statusFor(startDate: Date.today(), lastTaken: Date.today());

        // Assert
        expect(status, ScheduleStatus.taken);
      });

      test('next dose in the future -> upcoming', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final lastTaken = Date.today().subtract(const Duration(days: 1));

        // Act
        final status =
            s.statusFor(startDate: Date.today(), lastTaken: lastTaken);

        // Assert
        expect(status, ScheduleStatus.upcoming);
      });

      test('next dose today -> today', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final lastTaken = Date.today().subtract(const Duration(days: 5));

        // Act
        final status =
            s.statusFor(startDate: Date.today(), lastTaken: lastTaken);

        // Assert
        expect(status, ScheduleStatus.today);
      });

      test('missed dose -> overdue', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final lastTaken = Date.today().subtract(const Duration(days: 6));

        // Act
        final status =
            s.statusFor(startDate: Date.today(), lastTaken: lastTaken);

        // Assert
        expect(status, ScheduleStatus.overdue);
      });

      test('never taken, startDate in future -> upcoming', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);

        // Act
        final status =
            s.statusFor(startDate: Date.today().add(const Duration(days: 3)));

        // Assert
        expect(status, ScheduleStatus.upcoming);
      });

      test('never taken, startDate in the past -> overdue', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final start = Date.today().subtract(const Duration(days: 12));

        // Act
        final status = s.statusFor(startDate: start);

        // Assert
        expect(status, ScheduleStatus.overdue);
      });

      test('never returns todayEarly', () {
        // Arrange
        final s = DynamicIntervalSchedule(intervalDays: 5);
        final lastTaken = Date.today().subtract(const Duration(days: 5));

        // Act
        final status =
            s.statusFor(startDate: Date.today(), lastTaken: lastTaken);

        // Assert
        expect(status, isNot(ScheduleStatus.todayEarly));
      });
    });

    group('DailySchedule.nextDate', () {
      test('startDate > today -> returns startDate', () {
        // Arrange
        final start = Date.today().add(const Duration(days: 5));
        final s = aDailyStrategy(intakeTimes: const [morning]);

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, start);
      });

      test('startDate == today -> returns today', () {
        // Arrange
        final s = aDailyStrategy(intakeTimes: const [morning]);

        // Act
        final next = s.nextDate(Date.today());

        // Assert
        expect(next, Date.today());
      });

      test('startDate < today -> returns today', () {
        // Arrange
        final start = Date.today().subtract(const Duration(days: 4));
        final s = aDailyStrategy(intakeTimes: const [morning]);

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, Date.today());
      });
    });

    group('DailySchedule.statusFor', () {
      final s = aDailyStrategy(intakeTimes: const [morning]);

      test('matched intake -> taken', () {
        // Arrange
        final intake = aMedicationIntake();

        // Act
        final status =
            s.statusFor(startDate: Date.today(), matchedIntake: intake);

        // Assert
        expect(status, ScheduleStatus.taken);
      });

      test('no matched intake, startDate == today -> today', () {
        // Act
        final status = s.statusFor(startDate: Date.today());

        // Assert
        expect(status, ScheduleStatus.today);
      });

      test('no matched intake, startDate < today -> today', () {
        // Act
        final status = s.statusFor(
            startDate: Date.today().subtract(const Duration(days: 3)));

        // Assert
        expect(status, ScheduleStatus.today);
      });

      test('startDate in the future -> upcoming', () {
        // Act
        final status =
            s.statusFor(startDate: Date.today().add(const Duration(days: 5)));

        // Assert
        expect(status, ScheduleStatus.upcoming);
      });

      test('startDate in the future takes priority over matched intake', () {
        // Arrange
        final intake = aMedicationIntake();

        // Act
        final status = s.statusFor(
          startDate: Date.today().add(const Duration(days: 5)),
          matchedIntake: intake,
        );

        // Assert
        expect(status, ScheduleStatus.upcoming);
      });
    });

    group('WeeklySchedule.nextDate', () {
      test(
          'startDate > today and startDate.weekday in daysOfWeek -> returns startDate',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().add(const Duration(days: 2)); // Wed
          const s = WeeklySchedule(daysOfWeek: [3]);

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, start);
        });
      });

      test(
          'startDate > today and startDate.weekday not in daysOfWeek -> returns next scheduled day on or after startDate',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().add(const Duration(days: 2)); // Wed
          const s = WeeklySchedule(daysOfWeek: [5]); // Fri

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date.today().add(const Duration(days: 4)));
        });
      });

      test('startDate == today and today is scheduled -> returns today', () {
        withFixedClock(() {
          // Arrange
          const s = WeeklySchedule(daysOfWeek: [1]); // Mon

          // Act
          final next = s.nextDate(Date.today());

          // Assert
          expect(next, Date.today());
        });
      });

      test(
          'startDate == today and today is not scheduled -> returns next scheduled day after today',
          () {
        withFixedClock(() {
          // Arrange
          const s = WeeklySchedule(daysOfWeek: [3]); // Wed

          // Act
          final next = s.nextDate(Date.today());

          // Assert
          expect(next, Date.today().add(const Duration(days: 2)));
        });
      });

      test('startDate < today and today is scheduled -> returns today', () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().subtract(const Duration(days: 14));
          const s = WeeklySchedule(daysOfWeek: [1]); // Mon

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date.today());
        });
      });

      test(
          'startDate < today and today is not scheduled -> returns next scheduled day after today',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().subtract(const Duration(days: 14));
          const s = WeeklySchedule(daysOfWeek: [3]); // Wed

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date.today().add(const Duration(days: 2)));
        });
      });

      test('multiple daysOfWeek -> returns the earliest match', () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. Wed = +2, Fri = +4. Expect Wed.
          const s = WeeklySchedule(daysOfWeek: [3, 5]); // Wed, Fri

          // Act
          final next = s.nextDate(Date.today());

          // Assert
          expect(next, Date.today().add(const Duration(days: 2)));
        });
      });
    });

    group('WeeklySchedule.nextDateOn', () {
      const s = WeeklySchedule(daysOfWeek: [1]);

      test('weekday == today and startDate in past -> returns today', () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().subtract(const Duration(days: 14));

          // Act
          final next = s.nextDateOn(1, start); // testNow = Mon

          // Assert
          expect(next, Date.today());
        });
      });

      test('weekday is later this week -> returns that day this week', () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. Target Wed = +2.
          final start = Date.today().subtract(const Duration(days: 14));

          // Act
          final next = s.nextDateOn(3, start);

          // Assert
          expect(next, Date.today().add(const Duration(days: 2)));
        });
      });

      test('weekday already passed this week -> wraps to next week', () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. Target Sun = +6 (wraps Mon->Tue->...->Sun).
          final start = Date.today().subtract(const Duration(days: 14));

          // Act
          final next = s.nextDateOn(7, start);

          // Assert
          expect(next, Date.today().add(const Duration(days: 6)));
        });
      });

      test('startDate in the future and matches weekday -> returns startDate',
          () {
        withFixedClock(() {
          // Arrange
          // startDate Wed (+2). Target Wed = startDate.
          final start = Date.today().add(const Duration(days: 2));

          // Act
          final next = s.nextDateOn(3, start);

          // Assert
          expect(next, start);
        });
      });

      test(
          'startDate in the future, does not match weekday -> walks from startDate',
          () {
        withFixedClock(() {
          // Arrange
          // startDate Wed (+2). Target Fri = startDate + 2 = +4.
          final start = Date.today().add(const Duration(days: 2));

          // Act
          final next = s.nextDateOn(5, start);

          // Assert
          expect(next, Date.today().add(const Duration(days: 4)));
        });
      });

      test('ignores daysOfWeek - target weekday is honoured even if not in it',
          () {
        withFixedClock(() {
          // Arrange
          // Schedule says daysOfWeek=[Mon], but caller asks for Wed.
          const monOnly = WeeklySchedule(daysOfWeek: [1]);
          final start = Date.today().subtract(const Duration(days: 14));

          // Act
          final next = monOnly.nextDateOn(3, start);

          // Assert
          expect(next, Date.today().add(const Duration(days: 2)));
        });
      });
    });

    group('WeeklySchedule.previousDate', () {
      test('startDate > today -> returns null', () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().add(const Duration(days: 7));
          const s = WeeklySchedule(daysOfWeek: [1]);

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, isNull);
        });
      });

      test('startDate == today -> returns null', () {
        withFixedClock(() {
          // Arrange
          const s = WeeklySchedule(daysOfWeek: [1]);

          // Act
          final previous = s.previousDate(Date.today());

          // Assert
          expect(previous, isNull);
        });
      });

      test(
          'today is scheduled -> returns the most recent past scheduled day (a week earlier)',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date.today().subtract(const Duration(days: 14));
          const s = WeeklySchedule(daysOfWeek: [1]); // Mon

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, Date.today().subtract(const Duration(days: 7)));
        });
      });

      test(
          'today is not scheduled -> returns the most recent past scheduled day',
          () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. Last Fri = -3 (Mon -> Sun -> Sat -> Fri).
          final start = Date.today().subtract(const Duration(days: 14));
          const s = WeeklySchedule(daysOfWeek: [5]); // Fri

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, Date.today().subtract(const Duration(days: 3)));
        });
      });

      test(
          'no scheduled day exists between startDate and today -> returns null',
          () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. daysOfWeek = Wed. startDate = Sun (yesterday).
          // No Wed in [Sun, Mon).
          final start = Date.today().subtract(const Duration(days: 1));
          const s = WeeklySchedule(daysOfWeek: [3]);

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, isNull);
        });
      });

      test(
          'startDate itself is the most recent scheduled day -> returns startDate',
          () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. daysOfWeek = Sun. startDate = Sun (yesterday).
          final start = Date.today().subtract(const Duration(days: 1));
          const s = WeeklySchedule(daysOfWeek: [7]);

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, start);
        });
      });

      test('multiple daysOfWeek -> returns the most recent match', () {
        withFixedClock(() {
          // Arrange
          // testNow Mon. Last Fri = -3. Last Wed = -5. Expect Fri.
          final start = Date.today().subtract(const Duration(days: 14));
          const s = WeeklySchedule(daysOfWeek: [3, 5]); // Wed, Fri

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, Date.today().subtract(const Duration(days: 3)));
        });
      });
    });

    group('WeeklySchedule.statusFor', () {
      // Today's weekday is Mon (1) under testNow.
      WeeklySchedule scheduledForToday() =>
          const WeeklySchedule(daysOfWeek: [1]);

      Date scheduledForTodayStart() =>
          Date.today().subtract(const Duration(days: 14));

      group('date == today', () {
        test('scheduled for today, taken today -> taken', () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();

            // Act
            final status = s.statusFor(
                startDate: scheduledForTodayStart(),
                date: Date.today(),
                lastTaken: Date.today());

            // Assert
            expect(status, ScheduleStatus.taken);
          });
        });

        test('scheduled for today, taken in the future -> taken', () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();

            // Act
            final status = s.statusFor(
                startDate: scheduledForTodayStart(),
                date: Date.today(),
                lastTaken: Date.today().add(const Duration(days: 1)));

            // Assert
            expect(status, ScheduleStatus.taken);
          });
        });

        test(
            'scheduled for today, last intake before previous scheduled date -> todayOverdue',
            () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();
            final start = scheduledForTodayStart();
            final lastTaken =
                s.previousDate(start)!.subtract(const Duration(days: 1));

            // Act
            final status = s.statusFor(
                startDate: start, date: Date.today(), lastTaken: lastTaken);

            // Assert
            expect(status, ScheduleStatus.todayOverdue);
          });
        });

        test('scheduled for today, never taken -> todayOverdue', () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();

            // Act
            final status = s.statusFor(
                startDate: scheduledForTodayStart(), date: Date.today());

            // Assert
            expect(status, ScheduleStatus.todayOverdue);
          });
        });

        test(
            'scheduled for today, last intake strictly between previous scheduled date and today -> todayEarly',
            () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();
            final start = scheduledForTodayStart();
            final lastTaken =
                s.previousDate(start)!.add(const Duration(days: 1));

            // Act
            final status = s.statusFor(
                startDate: start, date: Date.today(), lastTaken: lastTaken);

            // Assert
            expect(status, ScheduleStatus.todayEarly);
          });
        });

        test(
            'scheduled for today, last intake equals previous scheduled date -> today',
            () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();
            final start = scheduledForTodayStart();

            // Act
            final status = s.statusFor(
                startDate: start,
                date: Date.today(),
                lastTaken: s.previousDate(start));

            // Assert
            expect(status, ScheduleStatus.today);
          });
        });

        test(
            'scheduled for today with no previous date and never taken -> today',
            () {
          withFixedClock(() {
            // Arrange
            const s = WeeklySchedule(daysOfWeek: [1]);

            // Act
            final previous = s.previousDate(Date.today());
            final status =
                s.statusFor(startDate: Date.today(), date: Date.today());

            // Assert
            expect(previous, isNull);
            expect(status, ScheduleStatus.today);
          });
        });

        test('not scheduled for today, last intake is overdue -> overdue', () {
          withFixedClock(() {
            // Arrange
            // Fri schedule. testNow Mon. previousDate = last Fri (-3).
            const s = WeeklySchedule(daysOfWeek: [5]);
            final start = Date.today().subtract(const Duration(days: 14));
            final lastTaken =
                s.previousDate(start)!.subtract(const Duration(days: 1));

            // Act
            final status = s.statusFor(
                startDate: start, date: Date.today(), lastTaken: lastTaken);

            // Assert
            expect(status, ScheduleStatus.overdue);
          });
        });

        test('not scheduled for today, never taken and overdue -> overdue', () {
          withFixedClock(() {
            // Arrange
            const s = WeeklySchedule(daysOfWeek: [5]); // Fri
            final start = Date.today().subtract(const Duration(days: 14));

            // Act
            final status = s.statusFor(startDate: start, date: Date.today());

            // Assert
            expect(status, ScheduleStatus.overdue);
          });
        });

        test('not scheduled for today, start date in the future -> upcoming',
            () {
          withFixedClock(() {
            // Arrange
            const s = WeeklySchedule(daysOfWeek: [5]);

            // Act
            final status = s.statusFor(
                startDate: Date.today().add(const Duration(days: 5)),
                date: Date.today());

            // Assert
            expect(status, ScheduleStatus.upcoming);
          });
        });

        test(
            'not scheduled for today, last intake on or after previous scheduled date -> upcoming',
            () {
          withFixedClock(() {
            // Arrange
            const s = WeeklySchedule(daysOfWeek: [5]);
            final start = Date.today().subtract(const Duration(days: 14));

            // Act
            final status = s.statusFor(
                startDate: start,
                date: Date.today(),
                lastTaken: s.previousDate(start));

            // Assert
            expect(status, ScheduleStatus.upcoming);
          });
        });

        test('taken takes priority over todayEarly', () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();

            // Act
            final status = s.statusFor(
                startDate: scheduledForTodayStart(),
                date: Date.today(),
                lastTaken: Date.today());

            // Assert
            expect(status, ScheduleStatus.taken);
          });
        });
      });

      group('date != today', () {
        test('future date -> upcoming regardless of overdue history', () {
          withFixedClock(() {
            // Arrange
            const s = WeeklySchedule(daysOfWeek: [1]);
            final start = Date.today().subtract(const Duration(days: 14));

            // Act
            final status = s.statusFor(
                startDate: start,
                date: Date.today().add(const Duration(days: 7)));

            // Assert
            expect(status, ScheduleStatus.upcoming);
          });
        });

        test('future date -> upcoming even when taken today', () {
          withFixedClock(() {
            // Arrange
            final s = scheduledForToday();

            // Act
            final status = s.statusFor(
                startDate: scheduledForTodayStart(),
                date: Date.today().add(const Duration(days: 7)),
                lastTaken: Date.today());

            // Assert
            expect(status, ScheduleStatus.upcoming);
          });
        });
      });
    });

    group('MonthlySchedule.nextDate', () {
      test(
          'startDate > today, day not yet passed -> first occurrence in start month',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date(year: 2026, month: 7, day: 1);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date(year: 2026, month: 7, day: 21));
        });
      });

      test('startDate day already passed -> first occurrence is next month',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date(year: 2026, month: 6, day: 25);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date(year: 2026, month: 7, day: 21));
        });
      });

      test(
          'startDate in the past -> walks forward by intervalMonths past today',
          () {
        withFixedClock(() {
          // testNow = 2026-06-01. First occurrence 2026-03-21, every 3 months.
          // Arrange
          final start = Date(year: 2026, month: 3, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date(year: 2026, month: 6, day: 21));
        });
      });

      test('today is exactly a scheduled date -> returns today', () {
        withFixedClock(at: DateTime(2026, 6, 21, 12, 0), () {
          // Arrange
          final start = Date(year: 2026, month: 3, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date(year: 2026, month: 6, day: 21));
        });
      });

      test('year rollover -> next occurrence crosses into the next year', () {
        withFixedClock(at: DateTime(2026, 12, 20, 12, 0), () {
          // Arrange
          final start = Date(year: 2026, month: 11, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final next = s.nextDate(start);

          // Assert
          expect(next, Date(year: 2027, month: 2, day: 21));
        });
      });
    });

    group('MonthlySchedule.previousDate', () {
      test('startDate >= today -> returns null', () {
        withFixedClock(() {
          // Arrange
          final start = Date(year: 2026, month: 7, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, isNull);
        });
      });

      test('startDate in the past -> most recent occurrence before today', () {
        withFixedClock(() {
          // testNow = 2026-06-01. Occurrences: Mar 21, Jun 21, ...
          // Arrange
          final start = Date(year: 2026, month: 3, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final previous = s.previousDate(start);

          // Assert
          expect(previous, Date(year: 2026, month: 3, day: 21));
        });
      });
    });

    group('MonthlySchedule consistency between previous and next', () {
      test('previous is one interval before next', () {
        withFixedClock(() {
          // testNow = 2026-06-01. Occurrences: Mar 21, Jun 21, Sep 21, ...
          // Arrange
          final start = Date(year: 2026, month: 3, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final next = s.nextDate(start);
          final previous = s.previousDate(start);

          // Assert
          expect([
            next,
            previous
          ], [
            Date(year: 2026, month: 6, day: 21),
            Date(year: 2026, month: 3, day: 21)
          ]);
        });
      });
    });

    group('MonthlySchedule.getNextDates', () {
      test('count 0 -> empty', () {
        withFixedClock(() {
          // Arrange
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final dates = s.getNextDates(Date(year: 2026, month: 3, day: 21), 0);

          // Assert
          expect(dates, isEmpty);
        });
      });

      test('negative count -> throws ArgumentError', () {
        withFixedClock(() {
          // Arrange
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act & Assert
          expect(
            () => s.getNextDates(Date(year: 2026, month: 3, day: 21), -1),
            throwsArgumentError,
          );
        });
      });

      test(
          'returns count dates spaced intervalMonths apart, starting at nextDate',
          () {
        withFixedClock(() {
          // Arrange
          final start = Date(year: 2026, month: 3, day: 21);
          final s = MonthlySchedule(dayOfMonth: 21, intervalMonths: 3);

          // Act
          final dates = s.getNextDates(start, 3);

          // Assert
          expect(dates, [
            Date(year: 2026, month: 6, day: 21),
            Date(year: 2026, month: 9, day: 21),
            Date(year: 2026, month: 12, day: 21),
          ]);
        });
      });
    });

    group('MonthlySchedule.statusFor', () {
      MonthlySchedule scheduledForToday() => MonthlySchedule(dayOfMonth: 21);
      Date scheduledForTodayStart() => Date(year: 2026, month: 4, day: 21);

      test('scheduled today, taken today -> taken', () {
        withFixedClock(at: DateTime(2026, 6, 21, 12, 0), () {
          // Arrange
          final s = scheduledForToday();

          // Act
          final status = s.statusFor(
              startDate: scheduledForTodayStart(), lastTaken: Date.today());

          // Assert
          expect(status, ScheduleStatus.taken);
        });
      });

      test('scheduled today, never taken -> todayOverdue', () {
        withFixedClock(at: DateTime(2026, 6, 21, 12, 0), () {
          // Arrange
          final s = scheduledForToday();

          // Act
          final status = s.statusFor(startDate: scheduledForTodayStart());

          // Assert
          expect(status, ScheduleStatus.todayOverdue);
        });
      });

      test(
          'scheduled today, last intake between previous and today -> todayEarly',
          () {
        withFixedClock(at: DateTime(2026, 6, 21, 12, 0), () {
          // Arrange
          final s = scheduledForToday();
          final start = scheduledForTodayStart();
          final lastTaken = s.previousDate(start)!.add(const Duration(days: 1));

          // Act
          final status = s.statusFor(startDate: start, lastTaken: lastTaken);

          // Assert
          expect(status, ScheduleStatus.todayEarly);
        });
      });

      test(
          'scheduled today, last intake equals previous scheduled date -> today',
          () {
        withFixedClock(at: DateTime(2026, 6, 21, 12, 0), () {
          // Arrange
          final s = scheduledForToday();
          final start = scheduledForTodayStart();

          // Act
          final status =
              s.statusFor(startDate: start, lastTaken: s.previousDate(start));

          // Assert
          expect(status, ScheduleStatus.today);
        });
      });

      test('not scheduled today, overdue -> overdue', () {
        withFixedClock(() {
          // testNow = 2026-06-01, not the 21st. First occ 2026-03-21.
          // Arrange
          final s = MonthlySchedule(dayOfMonth: 21);
          final start = Date(year: 2026, month: 3, day: 21);

          // Act
          final status = s.statusFor(startDate: start);

          // Assert
          expect(status, ScheduleStatus.overdue);
        });
      });

      test('not scheduled today, start in the future -> upcoming', () {
        withFixedClock(() {
          // Arrange
          final s = MonthlySchedule(dayOfMonth: 21);

          // Act
          final status =
              s.statusFor(startDate: Date(year: 2026, month: 8, day: 21));

          // Assert
          expect(status, ScheduleStatus.upcoming);
        });
      });
    });

    group('MonthlySchedule.isNotifiable', () {
      test('no notification times -> not notifiable', () {
        // Arrange
        final s = MonthlySchedule(dayOfMonth: 21);

        // Act & Assert
        expect(s.isNotifiable, isFalse);
      });

      test('has notification times -> notifiable', () {
        // Arrange
        final s =
            MonthlySchedule(dayOfMonth: 21, notificationTimes: const [morning]);

        // Act & Assert
        expect(s.isNotifiable, isTrue);
      });
    });

    group('MonthlySchedule validators', () {
      test('day of month within 1..28 is valid', () {
        // Act & Assert
        expect(MonthlySchedule.validateDayOfMonth('21'), isNull);
      });

      test('day of month above 28 is invalid', () {
        // Act & Assert
        expect(MonthlySchedule.validateDayOfMonth('31'), isNotNull);
      });

      test('day of month of 0 is invalid', () {
        // Act & Assert
        expect(MonthlySchedule.validateDayOfMonth('0'), isNotNull);
      });

      test('interval months must be positive', () {
        // Act & Assert
        expect(MonthlySchedule.validateIntervalMonths('0'), isNotNull);
      });
    });

    group('AsNeededSchedule.nextDate', () {
      test('startDate > today -> returns startDate', () {
        // Arrange
        final start = Date.today().add(const Duration(days: 5));
        const s = AsNeededSchedule();

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, start);
      });

      test('startDate == today -> returns today', () {
        // Arrange
        const s = AsNeededSchedule();

        // Act
        final next = s.nextDate(Date.today());

        // Assert
        expect(next, Date.today());
      });

      test('startDate < today -> returns today', () {
        // Arrange
        final start = Date.today().subtract(const Duration(days: 4));
        const s = AsNeededSchedule();

        // Act
        final next = s.nextDate(start);

        // Assert
        expect(next, Date.today());
      });
    });

    group('AsNeededSchedule.statusFor', () {
      test('startDate in the past -> asNeeded', () {
        // Arrange
        final start = Date.today().subtract(const Duration(days: 10));
        const s = AsNeededSchedule();

        // Act
        final status = s.statusFor(startDate: start);

        // Assert
        expect(status, ScheduleStatus.asNeeded);
      });

      test('startDate == today -> asNeeded', () {
        // Arrange
        const s = AsNeededSchedule();

        // Act
        final status = s.statusFor(startDate: Date.today());

        // Assert
        expect(status, ScheduleStatus.asNeeded);
      });

      test('startDate in the future -> upcoming', () {
        // Arrange
        final start = Date.today().add(const Duration(days: 5));
        const s = AsNeededSchedule();

        // Act
        final status = s.statusFor(startDate: start);

        // Assert
        expect(status, ScheduleStatus.upcoming);
      });
    });

    group('AsNeededSchedule.isNotifiable', () {
      test('is never notifiable', () {
        // Arrange
        const s = AsNeededSchedule();

        // Act & Assert
        expect(s.isNotifiable, isFalse);
      });
    });
  });
}
