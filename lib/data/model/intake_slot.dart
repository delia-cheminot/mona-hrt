import 'package:flutter/material.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';

@immutable
class IntakeSlot {
  final MedicationSchedule schedule;
  final TimeOfDay? time;
  final ScheduleStatus status;
  final MedicationIntake? intake;
  final Date date;

  const IntakeSlot({
    required this.schedule,
    required this.status,
    required this.date,
    this.time,
    this.intake,
  });
}
