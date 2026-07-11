import 'package:flutter/material.dart';
import 'package:mona/data/model/medication_schedule.dart';

@immutable
sealed class PlannedNotification {
  final MedicationSchedule schedule;

  const PlannedNotification(this.schedule);

  DateTime get firstFire;
}

class PlannedOccurrence extends PlannedNotification {
  final DateTime dateTime;

  const PlannedOccurrence(super.schedule, {required this.dateTime});

  @override
  DateTime get firstFire => dateTime;
}

enum Periodicity { daily, weekly }

class PlannedRepeating extends PlannedNotification {
  final Periodicity periodicity;
  @override
  final DateTime firstFire;
  final TimeOfDay time;
  final int? dayOfWeek;

  const PlannedRepeating(
    super.schedule, {
    required this.periodicity,
    required this.firstFire,
    required this.time,
    this.dayOfWeek,
  }) : assert(
          (periodicity == Periodicity.weekly) == (dayOfWeek != null),
          'dayOfWeek must be set iff periodicity == weekly',
        );
}
