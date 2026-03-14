import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/util/date_helpers.dart';
import 'package:mona/util/validators.dart';

class MedicationSchedule {
  final int id;
  final String name;
  final Decimal dose;
  final int intervalDays;
  final DateTime startDate;
  final Molecule molecule;
  final AdministrationRoute administrationRoute;
  final Ester? ester;
  List<TimeOfDay> notificationTimes;

  MedicationSchedule({
    int? id,
    required this.name,
    required this.dose,
    required this.intervalDays,
    DateTime? startDate,
    required this.molecule,
    required this.administrationRoute,
    this.ester,
    required this.notificationTimes,
  })  : id = id ?? DateTime.now().millisecondsSinceEpoch,
        startDate = normalizeDate(startDate ?? DateTime.now());

  factory MedicationSchedule.fromMap(Map<String, Object?> map) {
    return MedicationSchedule(
      id: map['id'] as int,
      name: map['name'] as String,
      dose: Decimal.parse(map['dose'] as String),
      intervalDays: map['intervalDays'] as int,
      startDate: DateTime.parse(map['startDate'] as String),
      molecule: Molecule.fromJson(jsonDecode(map['moleculeJson'] as String)),
      administrationRoute: AdministrationRoute.fromName(
          map['administrationRouteName'] as String),
      ester: Ester.fromName(map['esterName'] as String?),
      notificationTimes: _decodeTimes(map['notificationTimes'] as String),
    );
  }

  /// Returns the next scheduled injection date relative to [referenceDate] (or today if null).
  ///
  /// - If the [startDate] is in the future or today, returns [startDate].
  /// - If today falls exactly on a scheduled injection date, returns today.
  /// - Otherwise, returns the next scheduled date after today.
  DateTime getNextDate({DateTime? referenceDate}) {
    final today = normalizeDate(referenceDate ?? DateTime.now());

    if (!startDate.isBefore(today)) {
      return startDate;
    }

    final daysSinceStart = today.difference(startDate).inDays;

    if (daysSinceStart % intervalDays == 0) {
      return today;
    }

    final intervalsPassed = (daysSinceStart / intervalDays).ceil();
    return startDate.add(
      Duration(days: intervalsPassed * intervalDays),
    );
  }

  /// Returns the last scheduled injection date relative to [referenceDate] (or today if null).
  ///
  /// - If the [startDate] is in the future or today, returns null.
  /// - If today falls exactly on a scheduled injection date, returns the scheduled date before today.
  /// - Otherwise, returns the last scheduled date before today.
  DateTime? getLastDate({DateTime? referenceDate}) {
    final today = normalizeDate(referenceDate ?? DateTime.now());

    if (!startDate.isBefore(today)) {
      return null;
    }

    final daysSinceStart = today.difference(startDate).inDays;

    if (daysSinceStart % intervalDays == 0) {
      return startDate.add(
        Duration(days: (daysSinceStart - intervalDays)),
      );
    }

    final intervalsPassed = (daysSinceStart / intervalDays).floor();
    return startDate.add(
      Duration(days: intervalsPassed * intervalDays),
    );
  }

  List<DateTime> getNextDates({int count = 1, DateTime? referenceDate}) {
    if (count < 0) {
      throw ArgumentError('Count must be a positive integer');
    }

    if (count == 0) {
      return [];
    }

    final dates = <DateTime>[];
    DateTime nextDate = getNextDate(referenceDate: referenceDate);

    for (int i = 0; i < count; i++) {
      dates.add(nextDate);
      nextDate = nextDate.add(Duration(days: intervalDays));
    }
    return dates;
  }

  bool isScheduledForToday() {
    return getNextDate() == normalizedToday();
  }

  bool isLate(DateTime? lastTakenDate) {
    final lastDate = getLastDate();

    if (lastDate == null || !lastDate.isBefore(normalizedToday())) return false;

    return lastTakenDate == null || lastTakenDate.isBefore(lastDate);
  }

  bool isTakenTodayOrLater(DateTime? lastTakenDate) {
    if (lastTakenDate == null) return false;

    final date = normalizeDate(lastTakenDate);
    final today = normalizedToday();

    return date.isAtSameMomentAs(today) || date.isAfter(today);
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'dose': dose.toString(),
      'intervalDays': intervalDays,
      'startDate': startDate.toIso8601String(),
      'moleculeJson': jsonEncode(molecule.toJson()),
      'administrationRouteName': administrationRoute.name,
      'esterName': ester?.name,
      'notificationTimes': _encodeTimes(notificationTimes),
    };
  }

  MedicationSchedule copyWith({
    int? id,
    String? name,
    Decimal? dose,
    int? intervalDays,
    DateTime? startDate,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Ester? ester,
    bool clearEster = false,
    List<TimeOfDay>? notificationTimes,
  }) {
    return MedicationSchedule(
      id: id ?? this.id,
      name: name ?? this.name,
      dose: dose ?? this.dose,
      intervalDays: intervalDays ?? this.intervalDays,
      startDate: startDate ?? this.startDate,
      molecule: molecule ?? this.molecule,
      administrationRoute: administrationRoute ?? this.administrationRoute,
      ester: clearEster ? null : (ester ?? this.ester),
      notificationTimes: notificationTimes ?? this.notificationTimes,
    );
  }

  static String? validateName(String? value) => requiredString(value);

  static String? validateDose(String? value) =>
      requiredStrictlyPositiveDecimal(value);

  static String? validateIntervalDays(String? value) =>
      requiredPositiveInt(value);

  static String? validateStartDate(DateTime? value) => requiredDate(value);

  static String? validateMolecule(Molecule? value) => requiredMolecule(value);

  static String? validateAdministrationRoute(AdministrationRoute? value) =>
      requiredAdministrationRoute(value);

  static String? Function(Ester?) esterValidator(
      Molecule? molecule, AdministrationRoute? administrationRoute) {
    return (Ester? value) {
      return (molecule == KnownMolecules.estradiol &&
              administrationRoute == AdministrationRoute.injection &&
              value == null)
          ? 'Required field'
          : null;
    };
  }

  static String _encodeTimes(List<TimeOfDay> times) {
    return jsonEncode(
      times.map((t) => "${t.hour}:${t.minute}").toList(),
    );
  }

  static List<TimeOfDay> _decodeTimes(String json) {
    final List list = jsonDecode(json);

    return list.map((e) {
      final parts = e.split(":");
      return TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }).toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MedicationSchedule && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return "$dose mg ${molecule.name} "
        "${ester != null ? "${ester!.name} " : ""}"
        "${administrationRoute.name} every $intervalDays days";
  }
}
