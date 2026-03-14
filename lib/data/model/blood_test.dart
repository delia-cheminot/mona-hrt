import 'package:decimal/decimal.dart';
import 'package:mona/util/validators.dart';

class BloodTest {
  final int id;
  final DateTime date;
  final Decimal? estradiolLevels;
  final Decimal? testosteroneLevels;

  BloodTest({
    int? id,
    required this.date,
    this.estradiolLevels,
    this.testosteroneLevels,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  factory BloodTest.fromMap(Map<String, Object?> map) {
    return BloodTest(
      id: map['id'] as int?,
      date: DateTime.parse(map['date'] as String),
      estradiolLevels: map['estradiolLevels'] == null
          ? null
          : Decimal.parse(map['estradiolLevels'] as String),
      testosteroneLevels: map['testosteroneLevels'] == null
          ? null
          : Decimal.parse(map['testosteroneLevels'] as String),
    );
  }

  BloodTest copyWith({
    int? id,
    DateTime? date,
    Decimal? estradiolLevels,
    Decimal? testosteroneLevels,
  }) {
    return BloodTest(
      id: id ?? this.id,
      date: date ?? this.date,
      estradiolLevels: estradiolLevels ?? this.estradiolLevels,
      testosteroneLevels: testosteroneLevels ?? this.testosteroneLevels,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'estradiolLevels': estradiolLevels.toString(),
      'testosteroneLevels': testosteroneLevels.toString(),
    };
  }

  static String? validateDate(DateTime? value) => requiredDate(value);

  static String? validateLevel(String? value) => strictlyPositiveDecimal(value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BloodTest && (id == other.id);

  @override
  int get hashCode => id.hashCode;
}
