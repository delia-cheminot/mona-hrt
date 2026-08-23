import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mona/controllers/slots_builder.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';

import '../fixtures.dart';
import '../util/test_clock.dart';

@GenerateNiceMocks([
  MockSpec<MedicationIntakeProvider>(),
  MockSpec<MedicationScheduleProvider>(),
])
import 'slots_builder_test.mocks.dart';

void main() {
  late MockMedicationIntakeProvider intakes;
  late MockMedicationScheduleProvider schedules;
  late SlotsBuilder slotsBuilder;

  setUp(() {
    intakes = MockMedicationIntakeProvider();
    schedules = MockMedicationScheduleProvider();
    when(schedules.schedules).thenReturn([]);
    slotsBuilder = SlotsBuilder(intakes, schedules);
  });

  void withSchedules(List<MedicationSchedule> all) {
    when(schedules.schedules).thenReturn(all);
  }

  group('intakeSlots - IntervalDaysSchedule', () {
    test('returns exactly one slot', () {
      // Arrange
      final s = aMedicationSchedule(scheduling: anIntervalStrategy());
      withSchedules([s]);

      // Act
      final result = slotsBuilder.intakeSlots();

      // Assert
      expect(result, hasLength(1));
    });

    test('scheduled today, taken today -> taken with last intake attached', () {
      // Arrange
      final start = Date.today().subtract(const Duration(days: 14));
      final intake = aMedicationIntake();
      withSchedules([
        aMedicationSchedule(
            scheduling: anIntervalStrategy(intervalDays: 7), startDate: start)
      ]);
      when(intakes.getLastIntakeLocalDateForSchedule(any))
          .thenReturn(Date.today());
      when(intakes.getLastTakenIntakeForSchedule(any)).thenReturn(intake);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect([slot.status, slot.intake], [ScheduleStatus.taken, intake]);
    });
  });

  group('intakeSlots - DynamicIntervalSchedule', () {
    test('missed dose -> overdue status', () {
      // Arrange
      final start = Date.today().subtract(const Duration(days: 30));
      withSchedules([
        aMedicationSchedule(
          scheduling: aDynamicIntervalStrategy(intervalDays: 5),
          startDate: start,
        )
      ]);
      when(intakes.getLastIntakeLocalDateForSchedule(any))
          .thenReturn(Date.today().subtract(const Duration(days: 6)));

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.status, ScheduleStatus.overdue);
    });

    test('missed dose -> date is the past due date', () {
      // Arrange
      final start = Date.today().subtract(const Duration(days: 30));
      withSchedules([
        aMedicationSchedule(
          scheduling: aDynamicIntervalStrategy(intervalDays: 5),
          startDate: start,
        )
      ]);
      when(intakes.getLastIntakeLocalDateForSchedule(any))
          .thenReturn(Date.today().subtract(const Duration(days: 6)));

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.date, Date.today().subtract(const Duration(days: 1)));
    });

    test('taken recently -> date is lastTaken + interval', () {
      // Arrange
      final start = Date.today().subtract(const Duration(days: 30));
      withSchedules([
        aMedicationSchedule(
          scheduling: aDynamicIntervalStrategy(intervalDays: 5),
          startDate: start,
        )
      ]);
      when(intakes.getLastIntakeLocalDateForSchedule(any))
          .thenReturn(Date.today());

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.date, Date.today().add(const Duration(days: 5)));
    });

    test('never taken, startDate in the past -> date is the startDate', () {
      // Arrange
      final start = Date.today().subtract(const Duration(days: 1));
      withSchedules([
        aMedicationSchedule(
          scheduling: aDynamicIntervalStrategy(intervalDays: 4),
          startDate: start,
        )
      ]);
      when(intakes.getLastIntakeLocalDateForSchedule(any)).thenReturn(null);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.date, start);
    });

    test('never taken, startDate in the future -> date is the startDate', () {
      // Arrange
      final start = Date.today().add(const Duration(days: 3));
      withSchedules([
        aMedicationSchedule(
          scheduling: aDynamicIntervalStrategy(intervalDays: 5),
          startDate: start,
        )
      ]);
      when(intakes.getLastIntakeLocalDateForSchedule(any)).thenReturn(null);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.date, start);
    });
  });

  group('intakeSlots - DailySchedule', () {
    test('emits one slot per intakeTime', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: aDailyStrategy(
                intakeTimes: const [morning, afternoon, evening]))
      ]);
      when(intakes.getTakenIntakesForScheduleOn(any, Date.today()))
          .thenReturn(<MedicationIntake>[]);

      // Act
      final result = slotsBuilder.intakeSlots();

      // Assert
      expect(result.map((o) => o.time), [morning, afternoon, evening]);
    });

    test('matched intake -> taken with intake attached', () {
      // Arrange
      final morningIntake = aMedicationIntake(time: morning);
      withSchedules([
        aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [morning, afternoon]),
            startDate: Date.today().subtract(const Duration(days: 14)))
      ]);
      when(intakes.getTakenIntakesForScheduleOn(any, Date.today()))
          .thenReturn([morningIntake]);

      // Act
      final result = slotsBuilder.intakeSlots();

      // Assert
      final morningSlot = result.singleWhere((o) => o.time == morning);
      expect([morningSlot.status, morningSlot.intake],
          [ScheduleStatus.taken, morningIntake]);
    });

    test('startDate in the future -> all slots are upcoming', () {
      // Arrange
      withSchedules([
        aMedicationSchedule(
            scheduling: aDailyStrategy(intakeTimes: const [morning, afternoon]),
            startDate: Date.today().add(const Duration(days: 5)))
      ]);
      when(intakes.getTakenIntakesForScheduleOn(any, Date.today()))
          .thenReturn(<MedicationIntake>[]);

      // Act
      final result = slotsBuilder.intakeSlots();

      // Assert
      expect(
          result.map((o) => o.status), everyElement(ScheduleStatus.upcoming));
    });
  });

  group('intakeSlots - WeeklySchedule', () {
    test('returns exactly one slot', () {
      // Arrange
      withFixedClock(() {
        // Arrange
        withSchedules([aMedicationSchedule(scheduling: aWeeklyStrategy())]);

        // Act
        final result = slotsBuilder.intakeSlots();

        // Assert
        expect(result, hasLength(1));
      });
    });

    test('scheduled today, taken today -> taken with last intake attached', () {
      withFixedClock(() {
        // Arrange
        final start = Date.today().subtract(const Duration(days: 14));
        final intake = aMedicationIntake();
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(daysOfWeek: const [1]),
              startDate: start)
        ]);
        when(intakes.getLastIntakeLocalDateForSchedule(any))
            .thenReturn(Date.today());
        when(intakes.getLastTakenIntakeForSchedule(any)).thenReturn(intake);

        // Act
        final slot = slotsBuilder.intakeSlots().single;

        // Assert
        expect([slot.status, slot.intake], [ScheduleStatus.taken, intake]);
      });
    });

    test('not scheduled today, never taken on a past scheduled day -> overdue',
        () {
      withFixedClock(() {
        // Arrange
        final start = Date.today().subtract(const Duration(days: 14));
        withSchedules([
          aMedicationSchedule(
              scheduling: aWeeklyStrategy(daysOfWeek: const [5]),
              startDate: start)
        ]);
        // Act
        final slot = slotsBuilder.intakeSlots().single;

        // Assert
        expect(slot.status, ScheduleStatus.overdue);
      });
    });
  });

  group('intakeSlots - MonthlySchedule', () {
    test('returns exactly one slot', () {
      withFixedClock(() {
        // Arrange
        final s = aMedicationSchedule(scheduling: aMonthlyStrategy());
        withSchedules([s]);

        // Act
        final result = slotsBuilder.intakeSlots();

        // Assert
        expect(result, hasLength(1));
      });
    });

    test('scheduled today, taken today -> taken with last intake attached', () {
      withFixedClock(at: DateTime(2026, 6, 21, 12, 0), () {
        // Arrange
        final start = Date(year: 2026, month: 4, day: 21);
        final intake = aMedicationIntake();
        withSchedules([
          aMedicationSchedule(
              scheduling: aMonthlyStrategy(dayOfMonth: 21), startDate: start)
        ]);
        when(intakes.getLastIntakeLocalDateForSchedule(any))
            .thenReturn(Date.today());
        when(intakes.getLastTakenIntakeForSchedule(any)).thenReturn(intake);

        // Act
        final slot = slotsBuilder.intakeSlots().single;

        // Assert
        expect([slot.status, slot.intake], [ScheduleStatus.taken, intake]);
      });
    });
  });

  group('intakeSlots - AsNeededSchedule', () {
    test('status is asNeeded', () {
      // Arrange
      withSchedules([aMedicationSchedule(scheduling: anAsNeededStrategy())]);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.status, ScheduleStatus.asNeeded);
    });

    test('not started yet -> status upcoming', () {
      // Arrange
      final start = Date.today().add(const Duration(days: 5));
      withSchedules([
        aMedicationSchedule(scheduling: anAsNeededStrategy(), startDate: start)
      ]);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.status, ScheduleStatus.upcoming);
    });

    test('startDate in the past -> date is today', () {
      // Arrange
      final start = Date.today().subtract(const Duration(days: 10));
      withSchedules([
        aMedicationSchedule(scheduling: anAsNeededStrategy(), startDate: start)
      ]);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.date, Date.today());
    });

    test('startDate in the future -> date is the startDate', () {
      // Arrange
      final start = Date.today().add(const Duration(days: 5));
      withSchedules([
        aMedicationSchedule(scheduling: anAsNeededStrategy(), startDate: start)
      ]);

      // Act
      final slot = slotsBuilder.intakeSlots().single;

      // Assert
      expect(slot.date, start);
    });
  });
}
