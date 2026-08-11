import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/util/string_parsing.dart';

class DecimalStringMapper extends SimpleMapper<Decimal> {
  const DecimalStringMapper();

  @override
  Decimal decode(Object value) {
    return (value as String).toDecimal;
  }

  @override
  Object? encode(Decimal self) {
    return self.toString();
  }
}

class DateStringMapper extends SimpleMapper<Date> {
  const DateStringMapper();

  @override
  Date decode(Object value) {
    return Date.fromString(value as String);
  }

  @override
  Object? encode(Date self) {
    return self.toString();
  }
}

class TimeOfDayMapper extends SimpleMapper<TimeOfDay> {
  const TimeOfDayMapper();

  @override
  TimeOfDay decode(Object value) {
    final parts = (value as String).split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  @override
  Object? encode(TimeOfDay self) {
    return '${self.hour}:${self.minute}';
  }
}
