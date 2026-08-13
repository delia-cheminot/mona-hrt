import 'dart:math';

import 'package:mona/data/model/date.dart';
import 'package:mona/i18n/translations.g.dart';

enum HrtDurationUnit { days, weeks, months, years }

class HrtDuration {
  final HrtDurationUnit unit;
  final int value;

  const HrtDuration(this.unit, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HrtDuration && other.unit == unit && other.value == value;

  @override
  int get hashCode => Object.hash(unit, value);

  @override
  String toString() => 'HrtDuration($unit, $value)';
}

const int _weeksThresholdDays = 7;
const int _monthsThresholdDays = 90;

HrtDuration hrtDurationSince(Date start) {
  final now = Date.today();
  final days = start.differenceInDays(now);

  if (days < _weeksThresholdDays) {
    return HrtDuration(HrtDurationUnit.days, max(days, 1));
  }

  if (days < _monthsThresholdDays) {
    return HrtDuration(HrtDurationUnit.weeks, days ~/ 7);
  }

  final years = start.differenceInYears(now);
  if (years < 1) {
    return HrtDuration(HrtDurationUnit.months, start.differenceInMonths(now));
  }

  return HrtDuration(HrtDurationUnit.years, years);
}

String hrtDurationText(HrtDuration d) => switch (d.unit) {
      HrtDurationUnit.days => t.onHrtForDays(count: d.value),
      HrtDurationUnit.weeks => t.onHrtForWeeks(count: d.value),
      HrtDurationUnit.months => t.onHrtForMonths(count: d.value),
      HrtDurationUnit.years => t.onHrtForYears(count: d.value),
    };

String? hrtWidgetDurationText({
  required Date? firstTakenLocalDate,
  required bool intakeCounterEnabled,
}) =>
    firstTakenLocalDate == null || !intakeCounterEnabled
        ? null
        : hrtDurationText(hrtDurationSince(firstTakenLocalDate));
