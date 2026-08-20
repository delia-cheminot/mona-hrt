import 'package:clock/clock.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/planned_notification.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';

class NotificationPlanner {
  final MedicationIntakeProvider _medicationIntakeProvider;
  final MedicationScheduleProvider _medicationScheduleProvider;

  const NotificationPlanner(
      this._medicationIntakeProvider, this._medicationScheduleProvider);

  List<PlannedNotification> planNotifications({required int daysAhead}) => [
        for (final schedule in _medicationScheduleProvider.schedules)
          if (schedule.scheduling.isNotifiable)
            ...switch (schedule.scheduling) {
              IntervalDaysSchedule scheduling =>
                _intervalPlans(schedule, scheduling, daysAhead),
              DynamicIntervalSchedule scheduling =>
                _dynamicIntervalPlans(schedule, scheduling),
              DailySchedule scheduling => _dailyPlans(schedule, scheduling),
              WeeklySchedule scheduling => _weeklyPlans(schedule, scheduling),
              MonthlySchedule scheduling =>
                _monthlyPlans(schedule, scheduling, daysAhead),
              AsNeededSchedule _ => [],
            },
      ];

  int daysAhead({required int maxScheduled}) {
    int reserved = 0;
    int perOccurrence = 0;

    for (final schedule in _medicationScheduleProvider.schedules) {
      switch (schedule.scheduling) {
        case IntervalDaysSchedule scheduling:
          perOccurrence += scheduling.notificationTimes.length;
        case DynamicIntervalSchedule scheduling:
          reserved += scheduling.notificationTimes.length;
        case DailySchedule scheduling:
          if (scheduling.notify) reserved += scheduling.intakeTimes.length;
        case WeeklySchedule scheduling:
          reserved += scheduling.daysOfWeek.length *
              scheduling.notificationTimes.length;
        case MonthlySchedule scheduling:
          perOccurrence += scheduling.notificationTimes.length;
        case AsNeededSchedule _:
          continue;
      }
    }

    if (perOccurrence == 0) return 0;
    final fit = (maxScheduled - reserved) ~/ perOccurrence;
    return fit < 1 ? 1 : fit;
  }

  List<PlannedNotification> _intervalPlans(
    MedicationSchedule schedule,
    IntervalDaysSchedule scheduling,
    int days,
  ) {
    final now = clock.now();
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final takenToday = lastTaken != null && !lastTaken.isBefore(Date.today());
    final dates = scheduling.getNextDates(schedule.startDate, days);

    final plans = <PlannedNotification>[];
    for (final date in dates) {
      if (date.isToday && takenToday) continue;

      for (final time in scheduling.notificationTimes) {
        final dateTime = date.toDateTimeAt(time);
        if (!dateTime.isAfter(now)) continue;
        plans.add(PlannedOccurrence(schedule, dateTime: dateTime));
      }
    }

    return plans;
  }

  List<PlannedNotification> _dynamicIntervalPlans(
    MedicationSchedule schedule,
    DynamicIntervalSchedule scheduling,
  ) {
    final now = clock.now();
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final date = scheduling.intakeDate(schedule.startDate, lastTaken);

    final plans = <PlannedNotification>[];
    for (final time in scheduling.notificationTimes) {
      final dateTime = date.toDateTimeAt(time);
      if (!dateTime.isAfter(now)) continue;
      plans.add(PlannedOccurrence(schedule, dateTime: dateTime));
    }

    return plans;
  }

  List<PlannedNotification> _monthlyPlans(
    MedicationSchedule schedule,
    MonthlySchedule scheduling,
    int count,
  ) {
    final now = clock.now();
    final lastTaken = _medicationIntakeProvider
        .getLastIntakeLocalDateForSchedule(schedule.id);
    final takenToday = lastTaken != null && !lastTaken.isBefore(Date.today());
    final dates = scheduling.getNextDates(schedule.startDate, count);

    final plans = <PlannedNotification>[];
    for (final date in dates) {
      if (date.isToday && takenToday) continue;

      for (final time in scheduling.notificationTimes) {
        final dateTime = date.toDateTimeAt(time);
        if (!dateTime.isAfter(now)) continue;
        plans.add(PlannedOccurrence(schedule, dateTime: dateTime));
      }
    }

    return plans;
  }

  List<PlannedNotification> _dailyPlans(
    MedicationSchedule schedule,
    DailySchedule scheduling,
  ) {
    final today = Date.today();
    final now = clock.now();
    final start = schedule.startDate.isAfterToday ? schedule.startDate : today;
    final takenDateTimesToday = _medicationIntakeProvider
        .getTakenIntakesForScheduleOn(schedule.id, today)
        .where((intake) => intake.scheduledTime != null)
        .map((intake) => Date.today().toDateTimeAt(intake.scheduledTime!))
        .toSet();

    return [
      for (final time in scheduling.intakeTimes)
        () {
          DateTime candidate = start.toDateTimeAt(time);
          if (!candidate.isAfter(now) ||
              takenDateTimesToday.contains(candidate)) {
            candidate = candidate.add(const Duration(days: 1));
          }
          return PlannedRepeating(
            schedule,
            periodicity: Periodicity.daily,
            firstFire: candidate,
          );
        }(),
    ];
  }

  List<PlannedNotification> _weeklyPlans(
    MedicationSchedule schedule,
    WeeklySchedule scheduling,
  ) {
    final today = Date.today();
    final now = clock.now();
    final takenToday = _medicationIntakeProvider
        .getTakenIntakesForScheduleOn(schedule.id, today)
        .isNotEmpty;

    return [
      for (final dayOfWeek in scheduling.daysOfWeek)
        for (final time in scheduling.notificationTimes)
          () {
            final nextDate =
                scheduling.nextDateOn(dayOfWeek, schedule.startDate);
            DateTime candidate = nextDate.toDateTimeAt(time);
            if (nextDate.isToday && (!candidate.isAfter(now) || takenToday)) {
              candidate = candidate.add(const Duration(days: 7));
            }
            return PlannedRepeating(
              schedule,
              periodicity: Periodicity.weekly,
              firstFire: candidate,
              dayOfWeek: dayOfWeek,
            );
          }(),
    ];
  }
}
