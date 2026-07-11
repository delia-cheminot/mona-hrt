import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mona/controllers/notification_planner.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/planned_notification.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';

import '../fixtures.dart';
import '../util/test_clock.dart';

@GenerateNiceMocks([
  MockSpec<MedicationIntakeProvider>(),
  MockSpec<MedicationScheduleProvider>(),
])
import 'notification_planner_test.mocks.dart';

void main() {
  late MockMedicationIntakeProvider intakesProvider;
  late MockMedicationScheduleProvider schedulesProvider;
  late NotificationPlanner planner;

  setUp(() {
    intakesProvider = MockMedicationIntakeProvider();
    schedulesProvider = MockMedicationScheduleProvider();
    when(schedulesProvider.schedules).thenReturn([]);
    planner = NotificationPlanner(intakesProvider, schedulesProvider);
  });

  void withSchedules(List<MedicationSchedule> all) {
    when(schedulesProvider.schedules).thenReturn(all);
  }

  group('planNotifications - IntervalDaysSchedule', () {
    test('empty notificationTimes -> no plans', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: anIntervalStrategy(notificationTimes: const []))
        ]);

        // Act
        final plans = planner.planNotifications(daysAhead: 30);

        // Assert
        expect(plans, isEmpty);
      });
    });

    test('emits one PlannedOccurrence per (scheduled date, notificationTime)',
        () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: anIntervalStrategy(
                notificationTimes: const [morning, afternoon]),
            startDate: Date.today().subtract(const Duration(days: 7)),
          )
        ]);
        when(intakesProvider.getLastIntakeLocalDateForSchedule(any))
            .thenReturn(null);

        // Act
        final plans = planner.planNotifications(daysAhead: 3);

        // today morning is filtered
        expect(plans.whereType<PlannedOccurrence>().length, 5);
      });
    });

    test('skips notifications in the past', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: anIntervalStrategy(
                  notificationTimes: const [morning, afternoon]))
        ]);

        // Act
        final plans =
            planner.planNotifications(daysAhead: 1).cast<PlannedOccurrence>();

        // Assert
        expect(plans, hasLength(1)); // afternoon is kept
      });
    });

    test('skips today when status is taken', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling:
                anIntervalStrategy(notificationTimes: const [afternoon]),
            startDate: Date.today().subtract(const Duration(days: 7)),
          )
        ]);
        when(intakesProvider.getLastIntakeLocalDateForSchedule(any))
            .thenReturn(Date.today());

        // Act
        final plans = planner.planNotifications(daysAhead: 1);

        // Assert
        expect(plans, isEmpty);
      });
    });
  });

  group('planNotifications - DailySchedule', () {
    test('notify=false -> no plans', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: aDailyStrategy(notify: false),
          )
        ]);

        // Act
        final plans = planner.planNotifications(daysAhead: 30);

        // Assert
        expect(plans, isEmpty);
      });
    });

    test('emits one PlannedRepeating(daily) per intake time', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [morning, afternoon]),
          )
        ]);

        // Act
        final plans =
            planner.planNotifications(daysAhead: 30).cast<PlannedRepeating>();

        // Assert
        expect(plans.where((p) => p.periodicity == Periodicity.daily),
            hasLength(2));
      });
    });

    test('firstFire = today @ time when time is in the future and not taken',
        () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [afternoon]),
          )
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire, Date.today().toDateTimeAt(afternoon));
      });
    });

    test('firstFire bumps by 1 day when today @ time is already past', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [morning]),
          )
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire,
            Date.today().add(const Duration(days: 1)).toDateTimeAt(morning));
      });
    });

    test('firstFire bumps by 1 day when this slot is already taken today', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [afternoon]),
          )
        ]);
        when(intakesProvider.getTakenIntakesForScheduleOn(any, Date.today()))
            .thenReturn([aMedicationIntake(time: afternoon)]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire,
            Date.today().add(const Duration(days: 1)).toDateTimeAt(afternoon));
      });
    });

    test('taken intake for a different slot does not advance this slot', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [morning, afternoon]),
          )
        ]);
        when(intakesProvider.getTakenIntakesForScheduleOn(any, Date.today()))
            .thenReturn([aMedicationIntake(time: morning)]);

        // Act
        final plans =
            planner.planNotifications(daysAhead: 30).cast<PlannedRepeating>();

        // Assert
        expect(plans.singleWhere((p) => p.time == afternoon).firstFire,
            Date.today().toDateTimeAt(afternoon));
      });
    });

    test('firstFire = startDate when startDate is in the future', () {
      withFixedClock(() {
        // Arrange
        final start = Date.today().add(const Duration(days: 5));
        withSchedules([
          aMedicationSchedule(scheduling: aDailyStrategy(), startDate: start)
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(Date.fromDateTime(plan.firstFire), start);
      });
    });
  });

  group('daysAhead', () {
    test('single interval schedule with one time gets the full budget', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(notificationTimes: const [morning])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 64);

      // Assert
      expect(daysAhead, 64);
    });

    test('single interval schedule with two times halves the budget', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(
                notificationTimes: const [morning, afternoon])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 64);

      // Assert
      expect(daysAhead, 32);
    });

    test('budget is shared across all interval schedules', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(notificationTimes: const [morning])),
        aMedicationSchedule(
            scheduling: anIntervalStrategy(
                notificationTimes: const [morning, afternoon])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 64);

      // Assert
      expect(daysAhead, 21); // 64 ~/ (1 + 2)
    });

    test('daily schedules with notify reserve one slot per intake time', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(notificationTimes: const [morning])),
        aMedicationSchedule(
            scheduling:
                aDailyStrategy(intakeTimes: const [morning, afternoon])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 64);

      // Assert
      expect(daysAhead, 62); // 64 - 2
    });

    test('daily schedules with notify=false reserve nothing', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(notificationTimes: const [morning])),
        aMedicationSchedule(
            scheduling: aDailyStrategy(
                intakeTimes: const [morning, afternoon], notify: false)),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 64);

      // Assert
      expect(daysAhead, 64);
    });

    test('weekly schedules reserve daysOfWeek x notificationTimes slots', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(notificationTimes: const [morning])),
        aMedicationSchedule(
            scheduling: aWeeklyStrategy(
                daysOfWeek: const [1, 3, 5],
                notificationTimes: const [morning, afternoon])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 64);

      // Assert
      expect(daysAhead, 58); // 64 - 6
    });

    test(
        'returns 1 when daily/weekly reservations exhaust the budget but interval schedules exist',
        () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(notificationTimes: const [morning])),
        aMedicationSchedule(
            scheduling: aWeeklyStrategy(
                daysOfWeek: const [1, 2, 3, 4, 5, 6, 7],
                notificationTimes: const [morning, afternoon])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 14);

      // Assert
      expect(daysAhead, 1);
    });

    test('returns 1 when remaining budget is smaller than perOccurrence', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(
                notificationTimes: const [morning, afternoon, morning])),
      ]);

      // Act
      final daysAhead = planner.daysAhead(maxScheduled: 2);

      // Assert
      expect(daysAhead, 1); // 2 ~/ 3 = 0 -> clamped to 1.
    });
  });

  group('planNotifications - WeeklySchedule', () {
    test('empty notificationTimes -> no plans', () {
      withFixedClock(() {
        // Arrange
        withSchedules([aMedicationSchedule(scheduling: aWeeklyStrategy())]);

        // Act
        final plans = planner.planNotifications(daysAhead: 30);

        // Assert
        expect(plans, isEmpty);
      });
    });

    test('emits daysOfWeek x notificationTimes cross product', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(
                  daysOfWeek: const [1, 3, 5],
                  notificationTimes: const [morning, afternoon]))
        ]);

        // Act
        final plans =
            planner.planNotifications(daysAhead: 30).cast<PlannedRepeating>();

        // Assert
        expect(plans.where((p) => p.periodicity == Periodicity.weekly),
            hasLength(6));
      });
    });

    test('firstFire on today when today matches and time is in the future', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(
                  daysOfWeek: const [1], notificationTimes: const [afternoon]))
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire, Date.today().toDateTimeAt(afternoon));
      });
    });

    test('firstFire bumps by 7 days when today matches but time is past', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(
                  daysOfWeek: const [1], notificationTimes: const [morning]))
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire,
            Date.today().add(const Duration(days: 7)).toDateTimeAt(morning));
      });
    });

    test('firstFire bumps by 7 days when any taken intake exists today', () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(
                  daysOfWeek: const [1], notificationTimes: const [afternoon]))
        ]);
        when(intakesProvider.getTakenIntakesForScheduleOn(any, Date.today()))
            .thenReturn([aMedicationIntake(time: morning)]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire,
            Date.today().add(const Duration(days: 7)).toDateTimeAt(afternoon));
      });
    });

    test(
        'firstFire walks to the next matching weekday when today does not match',
        () {
      withFixedClock(() {
        // Arrange
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(
                  daysOfWeek: const [3], notificationTimes: const [afternoon]))
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire,
            Date.today().add(const Duration(days: 2)).toDateTimeAt(afternoon));
      });
    });

    test('firstFire from startDate when startDate is in the future', () {
      withFixedClock(() {
        // Arrange
        final start = Date.today().add(const Duration(days: 2));
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(
                  daysOfWeek: const [3], notificationTimes: const [afternoon]),
              startDate: start)
        ]);

        // Act
        final plan = planner
            .planNotifications(daysAhead: 30)
            .cast<PlannedRepeating>()
            .single;

        // Assert
        expect(plan.firstFire, start.toDateTimeAt(afternoon));
      });
    });
  });
}
