import 'package:flutter/material.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';

@immutable
class IntakeSlot {
  final MedicationSchedule schedule;
  final TimeOfDay? time;
  final ScheduleStatus status;
  final MedicationIntake? intake;

  const IntakeSlot({
    required this.schedule,
    required this.status,
    this.time,
    this.intake,
  });
}
