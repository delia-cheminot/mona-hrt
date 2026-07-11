import 'package:decimal/decimal.dart';

abstract interface class Unit<T> implements Enum {
  final String name;

  Unit(this.name);

  Decimal convert(Decimal value, T into);
}

enum EstradiolUnit implements Unit<EstradiolUnit> {
  // ignore: constant_identifier_names
  pg_mL("pg/mL"),
  // ignore: constant_identifier_names
  pmol_L("pmol/L");

  @override
  final String name;

  const EstradiolUnit(this.name);

  static Decimal _factor = Decimal.parse('3.671');

  @override
  Decimal convert(Decimal value, EstradiolUnit into) {
    if (into == this) return value;
    return switch (into) {
      EstradiolUnit.pg_mL =>
        (value / _factor).toDecimal(scaleOnInfinitePrecision: 2),
      EstradiolUnit.pmol_L => value * _factor
    };
  }

  @override
  String toString() {
    return name;
  }

  factory EstradiolUnit.parse(String value) {
    try {
      return EstradiolUnit.values.firstWhere((unit) => unit.name == value);
    } on StateError {
      throw ArgumentError("failed to parse $value");
    }
  }
}

enum TestosteroneUnit implements Unit<TestosteroneUnit> {
  // ignore: constant_identifier_names
  ng_dL("ng/dL"),
  // ignore: constant_identifier_names
  nmol_L("nmol/L");

  @override
  final String name;

  const TestosteroneUnit(this.name);

  factory TestosteroneUnit.parse(String value) {
    try {
      return TestosteroneUnit.values.firstWhere((unit) => unit.name == value);
    } on StateError {
      throw ArgumentError("failed to parse $value");
    }
  }

  static Decimal _factor = Decimal.parse('28.84');

  @override
  Decimal convert(Decimal value, TestosteroneUnit into) {
    if (into == this) return value;
    return switch (into) {
      TestosteroneUnit.ng_dL => value * _factor,
      TestosteroneUnit.nmol_L =>
        (value / _factor).toDecimal(scaleOnInfinitePrecision: 2)
    };
  }

  @override
  String toString() {
    return name;
  }
}

enum Units {
  // ignore: constant_identifier_names
  pg_mL_ng_dL(
      estradiol: EstradiolUnit.pg_mL, testosterone: TestosteroneUnit.ng_dL),
  // ignore: constant_identifier_names
  pmol_L_nmol_L(
      estradiol: EstradiolUnit.pmol_L, testosterone: TestosteroneUnit.nmol_L);

  final EstradiolUnit estradiol;
  final TestosteroneUnit testosterone;

  const Units({required this.estradiol, required this.testosterone});

  String get name {
    return "${estradiol.name} & ${testosterone.name}";
  }

  @override
  String toString() {
    return name;
  }
}

class UnitValue<U extends Unit> {
  final Decimal value;
  final U unit;

  UnitValue(this.value, this.unit);

  Decimal inUnit(U unit) {
    return this.unit.convert(value, unit);
  }

  @override
  String toString() {
    return "$value $unit";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitValue &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          unit == other.unit;

  @override
  int get hashCode => Object.hash(value, unit);
}
