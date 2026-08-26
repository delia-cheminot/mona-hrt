import 'package:dart_mappable/dart_mappable.dart';
import 'package:decimal/decimal.dart';
import 'package:mona/data/model/custom_mappers.dart';

part 'units.mapper.dart';

abstract interface class Unit<T> implements Enum {
  final String name;

  Unit(this.name);

  Decimal convert(Decimal value, T into);
}

@MappableEnum()
enum EstradiolUnit implements Unit<EstradiolUnit> {
  @MappableValue("pg/mL")
  // ignore: constant_identifier_names
  pg_mL("pg/mL"),
  @MappableValue("pmol/L")
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
}

@MappableEnum()
enum TestosteroneUnit implements Unit<TestosteroneUnit> {
  @MappableValue("ng/dL")
  // ignore: constant_identifier_names
  ng_dL("ng/dL"),
  @MappableValue("ng/mL")
  // ignore: constant_identifier_names
  ng_mL("ng/mL"),
  @MappableValue("nmol/L")
  // ignore: constant_identifier_names
  nmol_L("nmol/L");

  @override
  final String name;

  const TestosteroneUnit(this.name);

  static final Map<TestosteroneUnit, Decimal> _toNgDL = {
    TestosteroneUnit.ng_dL: Decimal.one,
    TestosteroneUnit.ng_mL: Decimal.fromInt(100),
    TestosteroneUnit.nmol_L: Decimal.parse("28.84"),
  };

  @override
  Decimal convert(Decimal value, TestosteroneUnit into) {
    if (this == into) return value;
    final valueInNgDL = value * _toNgDL[this]!;
    return (valueInNgDL / _toNgDL[into]!)
        .toDecimal(scaleOnInfinitePrecision: 2);
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
  pg_mL_ng_mL(
      estradiol: EstradiolUnit.pg_mL, testosterone: TestosteroneUnit.ng_mL),
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

@MappableClass(includeCustomMappers: [DecimalStringMapper()])
class UnitValue<U extends Unit> with UnitValueMappable<U> {
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
