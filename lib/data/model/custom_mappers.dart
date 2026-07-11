import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/util/string_parsing.dart';

class MoleculeJsonMapper extends SimpleMapper<Molecule> {
  const MoleculeJsonMapper();

  @override
  Molecule decode(Object value) {
    if (value is String) {
      return Molecule.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
      );
    }
    if (value is Map) {
      return Molecule.fromJson(Map<String, dynamic>.from(value));
    }
    throw FormatException(
        'Expected JSON for molecule, got ${value.runtimeType}');
  }

  @override
  Object? encode(Molecule self) {
    return jsonEncode(self.toJson());
  }
}

class AdministrationRouteNameMapper extends SimpleMapper<AdministrationRoute> {
  const AdministrationRouteNameMapper();

  @override
  AdministrationRoute decode(Object value) {
    return AdministrationRoute.fromName(value as String);
  }

  @override
  Object? encode(AdministrationRoute self) {
    return self.name;
  }
}

class EsterNameMapper extends SimpleMapper<Ester> {
  const EsterNameMapper();

  @override
  Ester decode(Object value) {
    return Ester.fromName(value as String)!;
  }

  @override
  Object? encode(Ester self) {
    return self.name;
  }
}

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

class NotificationTimesMapper extends SimpleMapper<List<TimeOfDay>> {
  const NotificationTimesMapper();

  @override
  List<TimeOfDay> decode(Object value) {
    final list = jsonDecode(value as String) as List;
    return list.map((e) {
      final parts = (e as String).split(':');
      return TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }).toList();
  }

  @override
  Object? encode(List<TimeOfDay> self) {
    return jsonEncode(
      self.map((t) => '${t.hour}:${t.minute}').toList(),
    );
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
