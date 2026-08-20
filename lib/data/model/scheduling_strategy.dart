import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/custom_mappers.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:mona/util/validators.dart';

part 'scheduling_strategy.mapper.dart';

enum ScheduleStatus {
  overdue,
  todayOverdue,
  todayEarly,
  today,
  upcoming,
  taken,
  asNeeded,
}

enum SchedulingType { daily, intervalDays, weekly, monthly, asNeeded }

@MappableClass(discriminatorKey: 'type')
sealed class SchedulingStrategy with SchedulingStrategyMappable {
  const SchedulingStrategy();

  bool get isNotifiable;

  SchedulingType get type;
}

@MappableClass(
  discriminatorValue: 'intervalDays',
  includeCustomMappers: [TimeOfDayMapper()],
)
class IntervalDaysSchedule extends SchedulingStrategy
    with IntervalDaysScheduleMappable {
  final int intervalDays;
  final List<TimeOfDay> notificationTimes;

  const IntervalDaysSchedule({
    required this.intervalDays,
    this.notificationTimes = const [],
  });

  /// Returns the next scheduled injection date relative to today.
  ///
  /// - If the [startDate] is in the future or today, returns [startDate].
  /// - If today falls exactly on a scheduled injection date, returns today.
  /// - Otherwise, returns the next scheduled date after today.
  Date nextDate(Date startDate) {
    if (!startDate.isBeforeToday) {
      return startDate;
    }

    final daysSinceStart = startDate.daysAwayFromToday;

    if (daysSinceStart % intervalDays == 0) {
      return Date.today();
    }

    return Date.today()
        .add(Duration(days: intervalDays - (daysSinceStart % intervalDays)));
  }

  /// Returns the last scheduled injection date relative to today.
  ///
  /// - If the [startDate] is in the future or today, returns null.
  /// - If today falls exactly on a scheduled injection date, returns the
  ///   scheduled date before today.
  /// - Otherwise, returns the last scheduled date before today.
  Date? previousDate(Date startDate) {
    if (!startDate.isBeforeToday) {
      return null;
    }

    final daysSinceStart = startDate.daysAwayFromToday;

    if (daysSinceStart % intervalDays == 0) {
      return Date.today().subtract(Duration(days: intervalDays));
    }

    return Date.today().subtract(Duration(days: daysSinceStart % intervalDays));
  }

  List<Date> getNextDates(Date startDate, int count) {
    if (count < 0) {
      throw ArgumentError('Count must be a positive integer');
    }

    if (count == 0) {
      return [];
    }

    final dates = <Date>[];
    Date next = nextDate(startDate);

    for (int i = 0; i < count; i++) {
      dates.add(next);
      next = next.add(Duration(days: intervalDays));
    }
    return dates;
  }

  @override
  bool get isNotifiable => notificationTimes.isNotEmpty;

  @override
  SchedulingType get type => SchedulingType.intervalDays;

  bool _isScheduledForToday(Date startDate) {
    return nextDate(startDate).isToday;
  }

  bool _isLate(Date startDate, Date? lastTakenDate) {
    final prev = previousDate(startDate);
    if (prev == null) {
      return false;
    }

    return lastTakenDate == null || lastTakenDate.isBefore(prev);
  }

  bool _lastTakenLate(Date startDate, Date? lastTakenDate) {
    final prev = previousDate(startDate);
    if (lastTakenDate == null || prev == null) {
      return false;
    }
    return lastTakenDate.isAfter(prev);
  }

  bool _isTakenTodayOrLater(Date? lastTakenDate) {
    if (lastTakenDate == null) return false;

    return lastTakenDate.isToday || lastTakenDate.isAfterToday;
  }

  ScheduleStatus statusFor({
    required Date startDate,
    Date? lastTaken,
  }) {
    if (_isScheduledForToday(startDate)) {
      if (_isTakenTodayOrLater(lastTaken)) return ScheduleStatus.taken;
      if (_isLate(startDate, lastTaken)) return ScheduleStatus.todayOverdue;
      if (_lastTakenLate(startDate, lastTaken)) {
        return ScheduleStatus.todayEarly;
      }
      return ScheduleStatus.today;
    }

    if (_isLate(startDate, lastTaken)) return ScheduleStatus.overdue;

    return ScheduleStatus.upcoming;
  }

  static String? validateIntervalDays(String? value) =>
      requiredPositiveInt(value);
}

@MappableClass(
  discriminatorValue: 'dynamicInterval',
  includeCustomMappers: [TimeOfDayMapper()],
)
class DynamicIntervalSchedule extends SchedulingStrategy
    with DynamicIntervalScheduleMappable {
  final int intervalDays;
  final List<TimeOfDay> notificationTimes;

  const DynamicIntervalSchedule({
    required this.intervalDays,
    this.notificationTimes = const [],
  }) : assert(intervalDays > 0, 'intervalDays must be positive');

  Date intakeDate(Date startDate, Date? lastTaken) {
    if (lastTaken == null) return startDate;
    return lastTaken.add(Duration(days: intervalDays));
  }

  @override
  bool get isNotifiable => notificationTimes.isNotEmpty;

  @override
  SchedulingType get type => SchedulingType.intervalDays;

  ScheduleStatus statusFor({
    required Date startDate,
    Date? lastTaken,
  }) {
    if (lastTaken != null && (lastTaken.isToday || lastTaken.isAfterToday)) {
      return ScheduleStatus.taken;
    }

    final date = intakeDate(startDate, lastTaken);
    if (date.isToday) return ScheduleStatus.today;
    if (date.isBeforeToday) return ScheduleStatus.overdue;

    return ScheduleStatus.upcoming;
  }

  static String? validateIntervalDays(String? value) =>
      requiredPositiveInt(value);
}

@MappableClass(
  discriminatorValue: 'daily',
  includeCustomMappers: [TimeOfDayMapper()],
)
class DailySchedule extends SchedulingStrategy with DailyScheduleMappable {
  final List<TimeOfDay> intakeTimes;
  final bool notify;

  const DailySchedule({
    required this.intakeTimes,
    this.notify = true,
  });

  /// Returns the next scheduled intake date relative to today.
  ///
  /// - If the [startDate] is in the future, returns [startDate].
  /// - Otherwise, returns today (a daily schedule fires every day once it
  ///   has started).
  Date nextDate(Date startDate) {
    if (startDate.isAfterToday) return startDate;
    return Date.today();
  }

  /// A daily schedule has no meaningful "previous" intake date.
  Date? previousDate(Date startDate) => null;

  ScheduleStatus statusFor({
    required Date startDate,
    MedicationIntake? matchedIntake,
  }) {
    if (startDate.isAfterToday) return ScheduleStatus.upcoming;
    if (matchedIntake != null) return ScheduleStatus.taken;
    return ScheduleStatus.today;
  }

  @override
  bool get isNotifiable => notify && intakeTimes.isNotEmpty;

  @override
  SchedulingType get type => SchedulingType.daily;

  static String? validateIntakeTimes(List<TimeOfDay> value) =>
      requiredList(value);
}

@MappableClass(
  discriminatorValue: 'weekly',
  includeCustomMappers: [TimeOfDayMapper()],
)
class WeeklySchedule extends SchedulingStrategy with WeeklyScheduleMappable {
  final List<int> daysOfWeek;
  final List<TimeOfDay> notificationTimes;

  const WeeklySchedule({
    required this.daysOfWeek,
    this.notificationTimes = const [],
  });

  /// Returns the next scheduled date relative to today, restricted to weekdays
  /// in [daysOfWeek].
  ///
  /// - If [startDate] is in the future or today, search starts from
  ///   [startDate] (the schedule has not begun before then).
  /// - Otherwise, search starts from today.
  Date nextDate(Date startDate) {
    Date candidate = startDate.isAfterToday ? startDate : Date.today();
    for (int i = 0; i < 7; i++) {
      if (daysOfWeek.contains(candidate.weekday)) {
        return candidate;
      }
      candidate = candidate.add(const Duration(days: 1));
    }
    return candidate;
  }

  /// Returns the next date matching [weekday] (ISO 1=Monday..7=Sunday) on or
  /// after the schedule's effective start date.
  Date nextDateOn(int weekday, Date startDate) {
    Date candidate = startDate.isAfterToday ? startDate : Date.today();
    for (int i = 0; i < 7; i++) {
      if (candidate.weekday == weekday) return candidate;
      candidate = candidate.add(const Duration(days: 1));
    }
    return candidate;
  }

  /// Returns the most recent scheduled date strictly before today, restricted
  /// to weekdays in [daysOfWeek] and never before [startDate].
  ///
  /// Returns null if [startDate] is today or in the future, or if no scheduled
  /// weekday exists in the window `[startDate, today)`.
  Date? previousDate(Date startDate) {
    if (!startDate.isBeforeToday) {
      return null;
    }
    Date candidate = Date.today().subtract(const Duration(days: 1));
    for (int i = 0; i < 7; i++) {
      if (daysOfWeek.contains(candidate.weekday)) {
        return candidate.isBefore(startDate) ? null : candidate;
      }
      candidate = candidate.subtract(const Duration(days: 1));
    }
    return null;
  }

  @override
  bool get isNotifiable => notificationTimes.isNotEmpty;

  @override
  SchedulingType get type => SchedulingType.weekly;

  bool _isScheduledForToday(Date startDate) => nextDate(startDate).isToday;

  bool _isLate(Date startDate, Date? lastTakenDate) {
    final prev = previousDate(startDate);
    if (prev == null) return false;
    return lastTakenDate == null || lastTakenDate.isBefore(prev);
  }

  bool _lastTakenLate(Date startDate, Date? lastTakenDate) {
    final prev = previousDate(startDate);
    if (lastTakenDate == null || prev == null) return false;
    return lastTakenDate.isAfter(prev);
  }

  bool _isTakenTodayOrLater(Date? lastTakenDate) {
    if (lastTakenDate == null) return false;
    return lastTakenDate.isToday || lastTakenDate.isAfterToday;
  }

  ScheduleStatus statusFor({
    required Date startDate,
    required Date date,
    Date? lastTaken,
  }) {
    if (!date.isToday) return ScheduleStatus.upcoming;

    if (_isScheduledForToday(startDate)) {
      if (_isTakenTodayOrLater(lastTaken)) return ScheduleStatus.taken;
      if (_isLate(startDate, lastTaken)) return ScheduleStatus.todayOverdue;
      if (_lastTakenLate(startDate, lastTaken)) {
        return ScheduleStatus.todayEarly;
      }
      return ScheduleStatus.today;
    }

    if (_isLate(startDate, lastTaken)) return ScheduleStatus.overdue;

    return ScheduleStatus.upcoming;
  }

  static String? validateDaysOfWeek(List<int> value) => requiredList(value);
}

@MappableClass(
  discriminatorValue: 'monthly',
  includeCustomMappers: [TimeOfDayMapper()],
)
class MonthlySchedule extends SchedulingStrategy with MonthlyScheduleMappable {
  final int dayOfMonth;
  final int intervalMonths;
  final List<TimeOfDay> notificationTimes;

  const MonthlySchedule({
    required this.dayOfMonth,
    this.intervalMonths = 1,
    this.notificationTimes = const [],
  });

  Date _firstOccurrence(Date startDate) {
    final candidate =
        Date(year: startDate.year, month: startDate.month, day: dayOfMonth);
    return candidate.isBefore(startDate) ? candidate.addMonths(1) : candidate;
  }

  Date nextDate(Date startDate) {
    final today = Date.today();
    Date occurrence = _firstOccurrence(startDate);
    while (occurrence.isBefore(today)) {
      occurrence = occurrence.addMonths(intervalMonths);
    }
    return occurrence;
  }

  Date? previousDate(Date startDate) {
    final first = _firstOccurrence(startDate);
    final previous = nextDate(startDate).addMonths(-intervalMonths);
    return previous.isBefore(first) ? null : previous;
  }

  List<Date> getNextDates(Date startDate, int count) {
    if (count < 0) {
      throw ArgumentError('Count must be a positive integer');
    }
    if (count == 0) {
      return [];
    }

    final dates = <Date>[];
    Date next = nextDate(startDate);
    for (int i = 0; i < count; i++) {
      dates.add(next);
      next = next.addMonths(intervalMonths);
    }
    return dates;
  }

  @override
  bool get isNotifiable => notificationTimes.isNotEmpty;

  @override
  SchedulingType get type => SchedulingType.monthly;

  bool _isScheduledForToday(Date startDate) => nextDate(startDate).isToday;

  bool _isLate(Date startDate, Date? lastTakenDate) {
    final prev = previousDate(startDate);
    if (prev == null) return false;
    return lastTakenDate == null || lastTakenDate.isBefore(prev);
  }

  bool _lastTakenLate(Date startDate, Date? lastTakenDate) {
    final prev = previousDate(startDate);
    if (lastTakenDate == null || prev == null) return false;
    return lastTakenDate.isAfter(prev);
  }

  bool _isTakenTodayOrLater(Date? lastTakenDate) {
    if (lastTakenDate == null) return false;
    return lastTakenDate.isToday || lastTakenDate.isAfterToday;
  }

  ScheduleStatus statusFor({
    required Date startDate,
    Date? lastTaken,
  }) {
    if (_isScheduledForToday(startDate)) {
      if (_isTakenTodayOrLater(lastTaken)) return ScheduleStatus.taken;
      if (_isLate(startDate, lastTaken)) return ScheduleStatus.todayOverdue;
      if (_lastTakenLate(startDate, lastTaken)) {
        return ScheduleStatus.todayEarly;
      }
      return ScheduleStatus.today;
    }

    if (_isLate(startDate, lastTaken)) return ScheduleStatus.overdue;

    return ScheduleStatus.upcoming;
  }

  static String? validateDayOfMonth(String? value) =>
      requiredPositiveInt(value) ??
      (value!.toInt > 28 ? t.mustBeBetween1And28 : null);

  static String? validateIntervalMonths(String? value) =>
      requiredPositiveInt(value);
}

@MappableClass(
  discriminatorValue: 'asNeeded',
)
class AsNeededSchedule extends SchedulingStrategy
    with AsNeededScheduleMappable {
  const AsNeededSchedule();

  Date nextDate(Date startDate) {
    return startDate.isAfterToday ? startDate : Date.today();
  }

  ScheduleStatus statusFor({
    required Date startDate,
    Date? lastTaken,
  }) {
    return nextDate(startDate).isToday
        ? ScheduleStatus.asNeeded
        : ScheduleStatus.upcoming;
  }

  @override
  bool get isNotifiable => false;

  @override
  SchedulingType get type => SchedulingType.asNeeded;
}
