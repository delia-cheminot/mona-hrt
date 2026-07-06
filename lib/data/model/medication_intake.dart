import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/custom_mappers.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/util/timezone_location.dart';
import 'package:mona/util/validators.dart';
import 'package:timezone/timezone.dart' as tz;

part 'medication_intake.mapper.dart';

@MappableEnum(mode: ValuesMode.named)
enum InjectionSide {
  left,
  right,
}

@MappableClass(
  includeCustomMappers: [
    MoleculeJsonMapper(),
    AdministrationRouteNameMapper(),
    EsterNameMapper(),
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
  @MappableField(key: 'dose')
  final Decimal takenDose;
  final Decimal? wastedAmount; // mL
  final int? scheduleId;
  final InjectionSide? side;
  bool get isTaken => takenDateTime != null;
  @MappableField(key: 'moleculeJson')
  final Molecule molecule;
  @MappableField(key: 'administrationRouteName')
  final AdministrationRoute administrationRoute;
  @MappableField(key: 'esterName')
  final Ester? ester;
  final int? supplyItemId;
  final String? notes;

  MedicationIntake({
    int? id,
    this.scheduledTime,
    required this.takenDose,
    this.wastedAmount,
    this.takenDateTime,
    this.takenTimeZone,
    this.scheduleId,
    this.side,
    required this.molecule,
    required this.administrationRoute,
    this.ester,
    this.supplyItemId,
    this.notes,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch {
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
