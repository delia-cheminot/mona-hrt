import 'package:dart_mappable/dart_mappable.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/mapping_hooks.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/util/timezone_location.dart';
import 'package:mona/util/validators.dart';
import 'package:timezone/timezone.dart' as tz;

part 'blood_test.mapper.dart';

@MappableClass(
  generateMethods: GenerateMethods.all,
)
class BloodTest with BloodTestMappable {
  final int id;
  final DateTime dateTime;
  final String timeZone;
  @MappableField(hook: JsonStringHook())
  final UnitValue<EstradiolUnit>? estradiolLevels;
  @MappableField(hook: JsonStringHook())
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

  DateTime get localDateTime {
    final location = timeZoneLocation(timeZone);
    return tz.TZDateTime.from(dateTime, location);
  }

  Date get localDate => localDateTime.toDate;

  // coverage:ignore-start
  static String? validateDate(DateTime? value) => requiredDateTime(value);

  static String? validateLevel(String? value) => positiveDecimal(value);
  // coverage:ignore-end
}
