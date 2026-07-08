import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:mona/util/timezone_location.dart';
import 'package:mona/util/validators.dart';
import 'package:timezone/timezone.dart' as tz;

class BloodTest {
  final int id;
  final DateTime dateTime;
  final String timeZone;
  final UnitValue<EstradiolUnit>? estradiolLevels;
  final UnitValue<TestosteroneUnit>? testosteroneLevels;

  BloodTest({
    int? id,
    required this.dateTime,
    required this.timeZone,
    this.estradiolLevels,
    this.testosteroneLevels,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch {
    if (!dateTime.isUtc) {
      throw ArgumentError('dateTime must be UTC');
    }
  }

  factory BloodTest.fromMap(Map<String, Object?> map) {
    final estradiolLevels = (map['estradiolLevels'] as String?).toDecimalOrNull;
    final estradiolUnitName = map['estradiolUnit'] as String?;
    final estradiolUnit = estradiolUnitName != null
        ? EstradiolUnit.parse(estradiolUnitName)
        : null;
    final testosteroneLevels =
        (map['testosteroneLevels'] as String?).toDecimalOrNull;
    final testosteroneUnitName = map['testosteroneUnit'] as String?;
    final testosteroneUnit = testosteroneUnitName != null
        ? TestosteroneUnit.parse(testosteroneUnitName)
        : null;

    return BloodTest(
        id: map['id'] as int?,
        dateTime: (map['dateTime'] as String).toDateTime,
        timeZone: map['timeZone'] as String,
        estradiolLevels: estradiolLevels != null
            ? UnitValue(estradiolLevels, estradiolUnit!)
            : null,
        testosteroneLevels: testosteroneLevels != null
            ? UnitValue(testosteroneLevels, testosteroneUnit!)
            : null);
  }

  DateTime get localDateTime {
    final location = timeZoneLocation(timeZone);
    return tz.TZDateTime.from(dateTime, location);
  }

  Date get localDate => localDateTime.toDate;

  BloodTest copyWith({
    int? id,
    DateTime? dateTime,
    String? timeZone,
    UnitValue<EstradiolUnit>? estradiolLevels,
    UnitValue<TestosteroneUnit>? testosteroneLevels,
  }) {
    return BloodTest(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      timeZone: timeZone ?? this.timeZone,
      estradiolLevels: estradiolLevels ?? this.estradiolLevels,
      testosteroneLevels: testosteroneLevels ?? this.testosteroneLevels,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'dateTime': dateTime.toIso8601String(),
      'timeZone': timeZone,
      'estradiolLevels': estradiolLevels?.value.toString(),
      'estradiolUnit': estradiolLevels?.unit.toString(),
      'testosteroneLevels': testosteroneLevels?.value.toString(),
      'testosteroneUnit': testosteroneLevels?.unit.toString(),
    };
  }

  // coverage:ignore-start
  static String? validateDate(DateTime? value) => requiredDateTime(value);

  static String? validateLevel(String? value) => positiveDecimal(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BloodTest && (id == other.id);

  @override
  int get hashCode => id.hashCode;
// coverage:ignore-end
}
