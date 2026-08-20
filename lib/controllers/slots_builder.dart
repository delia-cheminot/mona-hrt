import 'package:collection/collection.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/intake_slot.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';

class SlotsBuilder {
  final MedicationIntakeProvider _medicationIntakeProvider;
  final MedicationScheduleProvider _medicationScheduleProvider;

  const SlotsBuilder(
      this._medicationIntakeProvider, this._medicationScheduleProvider);

  List<IntakeSlot> intakeSlots() {
    final slots = <IntakeSlot>[];

    for (final schedule in _medicationScheduleProvider.schedules) {
      switch (schedule.scheduling) {
        case IntervalDaysSchedule scheduling:
          slots.add(_interval(schedule, scheduling));
        case DynamicIntervalSchedule scheduling:
          slots.add(_dynamicInterval(schedule, scheduling));
        case DailySchedule scheduling:
          slots.addAll(_daily(schedule, scheduling));
        case WeeklySchedule scheduling:
          slots.add(_weekly(schedule, scheduling));
        case MonthlySchedule scheduling:
          slots.add(_monthly(schedule, scheduling));
        case AsNeededSchedule scheduling:
          slots.add(_asNeeded(schedule, scheduling));
      }
    }

    return slots;
  }

  IntakeSlot _interval(
    MedicationSchedule schedule,
    IntervalDaysSchedule scheduling,
  ) {
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final lastIntake =
        _medicationIntakeProvider.getLastTakenIntakeForSchedule(schedule.id);

    final status = scheduling.statusFor(
      startDate: schedule.startDate,
      lastTaken: lastTaken,
    );
    return IntakeSlot(
      schedule: schedule,
      status: status,
      date: status == ScheduleStatus.overdue
          ? scheduling.previousDate(schedule.startDate)!
          : scheduling.nextDate(schedule.startDate),
      intake: status == ScheduleStatus.taken ? lastIntake : null,
    );
  }

  IntakeSlot _dynamicInterval(
    MedicationSchedule schedule,
    DynamicIntervalSchedule scheduling,
  ) {
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final lastIntake =
        _medicationIntakeProvider.getLastTakenIntakeForSchedule(schedule.id);

    final status = scheduling.statusFor(
      startDate: schedule.startDate,
      lastTaken: lastTaken,
    );
    return IntakeSlot(
      schedule: schedule,
      status: status,
      date: scheduling.intakeDate(schedule.startDate, lastTaken),
      intake: status == ScheduleStatus.taken ? lastIntake : null,
    );
  }

  IntakeSlot _monthly(
    MedicationSchedule schedule,
    MonthlySchedule scheduling,
  ) {
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final lastIntake =
        _medicationIntakeProvider.getLastTakenIntakeForSchedule(schedule.id);

    final status = scheduling.statusFor(
      startDate: schedule.startDate,
      lastTaken: lastTaken,
    );
    return IntakeSlot(
      schedule: schedule,
      status: status,
      date: status == ScheduleStatus.overdue
          ? scheduling.previousDate(schedule.startDate)!
          : scheduling.nextDate(schedule.startDate),
      intake: status == ScheduleStatus.taken ? lastIntake : null,
    );
  }

  List<IntakeSlot> _daily(
    MedicationSchedule schedule,
    DailySchedule scheduling,
  ) {
    final today = Date.today();
    final takenToday = _medicationIntakeProvider.getTakenIntakesForScheduleOn(
        schedule.id, today);

    return [
      for (final time in scheduling.intakeTimes)
        () {
          final match =
              takenToday.firstWhereOrNull((it) => it.scheduledTime == time);
          return IntakeSlot(
            schedule: schedule,
            time: time,
            status: scheduling.statusFor(
              startDate: schedule.startDate,
              matchedIntake: match,
            ),
            date: scheduling.nextDate(schedule.startDate),
            intake: match,
          );
        }(),
    ];
  }

  IntakeSlot _weekly(
    MedicationSchedule schedule,
    WeeklySchedule scheduling,
  ) {
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final lastIntake =
        _medicationIntakeProvider.getLastTakenIntakeForSchedule(schedule.id);

    final status = scheduling.statusFor(
      startDate: schedule.startDate,
      date: Date.today(),
      lastTaken: lastTaken,
    );
    return IntakeSlot(
      schedule: schedule,
      status: status,
      date: status == ScheduleStatus.overdue
          ? scheduling.previousDate(schedule.startDate)!
          : scheduling.nextDate(schedule.startDate),
      intake: status == ScheduleStatus.taken ? lastIntake : null,
    );
  }

  IntakeSlot _asNeeded(
    MedicationSchedule schedule,
    AsNeededSchedule scheduling,
  ) {
    return IntakeSlot(
      schedule: schedule,
      status: scheduling.statusFor(startDate: schedule.startDate),
      date: scheduling.nextDate(schedule.startDate),
    );
  }
}
