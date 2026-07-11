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
}
