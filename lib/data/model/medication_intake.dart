import 'package:clock/clock.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/custom_mappers.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/mapping_hooks.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/util/timezone_location.dart';
import 'package:mona/util/validators.dart';
import 'package:timezone/timezone.dart' as tz;

part 'medication_intake.mapper.dart';

@MappableClass(
  includeCustomMappers: [
    DecimalStringMapper(),
    TimeOfDayMapper(),
  ],
  generateMethods: GenerateMethods.all,
)
class MedicationIntake with MedicationIntakeMappable {
  final int id;
  final TimeOfDay? scheduledTime;
  final DateTime? takenDateTime;
  final String? takenTimeZone;
  final Decimal takenDose;
  final Decimal? wastedAmount; // mL
  final Decimal? deadSpace; // μL
  final int? scheduleId;
  bool get isTaken => takenDateTime != null;
  @MappableField(hook: JsonStringHook())
  final Molecule molecule;
  final AdministrationRoute administrationRoute;
  final Ester? ester;
  final int? medicationSupplyItemId;
  @MappableField(hook: JsonStringHook())
  final List<int> genericSupplyItemIds;
  final String? notes;
  @MappableField(hook: JsonStringHook())
  final List<Placement> placements;

  MedicationIntake({
    int? id,
    this.scheduledTime,
    required this.takenDose,
    this.wastedAmount,
    this.deadSpace,
    this.takenDateTime,
    this.takenTimeZone,
    this.scheduleId,
    required this.molecule,
    required this.administrationRoute,
    this.ester,
    this.medicationSupplyItemId,
    this.genericSupplyItemIds = const [],
    this.notes,
    this.placements = const [],
  }) : id = id ?? clock.now().millisecondsSinceEpoch {
    if (takenDateTime != null && !takenDateTime!.isUtc) {
      throw ArgumentError('takenDateTime must be UTC');
    }
    if (takenDateTime != null && takenTimeZone == null) {
      throw ArgumentError('takenTimeZone must be provided');
    }
  }

  DateTime? get takenLocalDateTime {
    if (takenDateTime == null) return null;

    final location = timeZoneLocation(takenTimeZone!);
    return tz.TZDateTime.from(takenDateTime!, location);
  }

  Date? get takenLocalDate {
    return takenLocalDateTime?.toDate;
  }

  // coverage:ignore-start
  static String? validateDose(String? value) =>
      requiredStrictlyPositiveDecimal(value);

  static String? validateWastedAmount(String? value) => positiveDecimal(value);

  static String? validateDeadSpace(String? value) => positiveDecimal(value);
  // coverage:ignore-end
}
