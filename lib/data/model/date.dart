import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool _isUtcMidnight(DateTime dt) =>
    dt.isUtc &&
    dt.hour == 0 &&
    dt.minute == 0 &&
    dt.second == 0 &&
    dt.millisecond == 0 &&
    dt.microsecond == 0;

int logicalDayStartHour = 4;

class Date {
  final DateTime value;

  Date({required int year, int month = 1, int day = 1})
      : value = DateTime.utc(year, month, day);

  Date.fromUtc(this.value) {
    if (!_isUtcMidnight(value)) {
      throw ArgumentError('Value must be UTC midnight');
    }
  }

  Date.fromDateTime(DateTime input) : value = _logicalDay(input);

  Date.today() : value = _logicalDay(clock.now());

  Date.fromString(String input) : value = DateTime.parse(input) {
    if (!_isUtcMidnight(value)) {
      throw ArgumentError(
        'Date string must be UTC midnight',
      );
    }
  }

  int get year => value.year;
  int get month => value.month;
  int get day => value.day;
  int get weekday => value.weekday;
  bool get isToday => this == Date.today();
  bool get isBeforeToday => isBefore(Date.today());
  bool get isAfterToday => isAfter(Date.today());
  int get daysAwayFromToday => differenceInDays(Date.today()).abs();

  int differenceInDays(Date other) =>
      value.difference(other.value).inDays.abs();

  bool isSameDayAs(Date other) =>
      value.year == other.value.year &&
      value.month == other.value.month &&
      value.day == other.value.day;

  bool isBefore(Date other) => value.isBefore(other.value);

  bool isAfter(Date other) => value.isAfter(other.value);

  Date add(Duration duration) => Date.fromUtc(value.add(duration));

  Date subtract(Duration duration) {
    return Date.fromUtc(value.subtract(duration));
  }

  Date addMonths(int months) =>
      Date(year: year, month: month + months, day: day);

  DateTime toUtcDateTime() => value;

  DateTime toDateTime() => DateTime(year, month, day, 12, 0);

  DateTime toDateTimeAt(TimeOfDay time) {
    Duration dayDifference = (time.hour < logicalDayStartHour)
        ? const Duration(days: 1)
        : Duration.zero;
    return DateTime(year, month, day, time.hour, time.minute)
        .add(dayDifference);
  }

  String format(DateFormat formatter) => formatter.format(value);

  @override
  String toString() {
    return value.toIso8601String();
  }

  // coverage:ignore-start
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Date && isSameDayAs(other);
  }

  @override
  int get hashCode => value.hashCode;

  // Applies the 4am rule: times before 4am belong to the previous day.
  static DateTime _logicalDay(DateTime input) {
    final dayDifference = input.hour < logicalDayStartHour ? 1 : 0;
    return DateTime.utc(input.year, input.month, input.day - dayDifference);
  }
  // coverage:ignore-end
}

extension DateTimeToDate on DateTime {
  Date get toDate => Date.fromDateTime(this);
}

extension StringToDate on String {
  Date get toDate => Date.fromString(this);
}
