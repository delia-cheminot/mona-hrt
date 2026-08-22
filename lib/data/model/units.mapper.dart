// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'units.dart';

class EstradiolUnitMapper extends EnumMapper<EstradiolUnit> {
  EstradiolUnitMapper._();

  static EstradiolUnitMapper? _instance;
  static EstradiolUnitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EstradiolUnitMapper._());
    }
    return _instance!;
  }

  static EstradiolUnit fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  EstradiolUnit decode(dynamic value) {
    switch (value) {
      case "pg/mL":
        return EstradiolUnit.pg_mL;
      case "pmol/L":
        return EstradiolUnit.pmol_L;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(EstradiolUnit self) {
    switch (self) {
      case EstradiolUnit.pg_mL:
        return "pg/mL";
      case EstradiolUnit.pmol_L:
        return "pmol/L";
    }
  }
}

extension EstradiolUnitMapperExtension on EstradiolUnit {
  dynamic toValue() {
    EstradiolUnitMapper.ensureInitialized();
    return MapperContainer.globals.toValue<EstradiolUnit>(this);
  }
}

class TestosteroneUnitMapper extends EnumMapper<TestosteroneUnit> {
  TestosteroneUnitMapper._();

  static TestosteroneUnitMapper? _instance;
  static TestosteroneUnitMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TestosteroneUnitMapper._());
    }
    return _instance!;
  }

  static TestosteroneUnit fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TestosteroneUnit decode(dynamic value) {
    switch (value) {
      case "ng/dL":
        return TestosteroneUnit.ng_dL;
      case "ng/mL":
        return TestosteroneUnit.ng_mL;
      case "nmol/L":
        return TestosteroneUnit.nmol_L;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TestosteroneUnit self) {
    switch (self) {
      case TestosteroneUnit.ng_dL:
        return "ng/dL";
      case TestosteroneUnit.ng_mL:
        return "ng/mL";
      case TestosteroneUnit.nmol_L:
        return "nmol/L";
    }
  }
}

extension TestosteroneUnitMapperExtension on TestosteroneUnit {
  dynamic toValue() {
    TestosteroneUnitMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TestosteroneUnit>(this);
  }
}

class UnitValueMapper extends ClassMapperBase<UnitValue> {
  UnitValueMapper._();

  static UnitValueMapper? _instance;
  static UnitValueMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Unit>(<T>(f) => f<Unit<T>>());
      MapperContainer.globals.use(_instance = UnitValueMapper._());
      MapperContainer.globals.useAll([DecimalStringMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'UnitValue';
  @override
  Function get typeFactory => <U extends Unit<dynamic>>(f) => f<UnitValue<U>>();

  static Decimal _$value(UnitValue v) => v.value;
  static const Field<UnitValue, Decimal> _f$value = Field('value', _$value);
  static Unit<dynamic> _$unit(UnitValue v) => v.unit;
  static dynamic _arg$unit<U extends Unit<dynamic>>(f) => f<U>();
  static const Field<UnitValue, Unit<dynamic>> _f$unit = Field(
    'unit',
    _$unit,
    arg: _arg$unit,
  );

  @override
  final MappableFields<UnitValue> fields = const {
    #value: _f$value,
    #unit: _f$unit,
  };

  static UnitValue<U> _instantiate<U extends Unit<dynamic>>(DecodingData data) {
    return UnitValue(data.dec(_f$value), data.dec(_f$unit));
  }

  @override
  final Function instantiate = _instantiate;

  static UnitValue<U> fromMap<U extends Unit<dynamic>>(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<UnitValue<U>>(map);
  }

  static UnitValue<U> fromJson<U extends Unit<dynamic>>(String json) {
    return ensureInitialized().decodeJson<UnitValue<U>>(json);
  }
}

mixin UnitValueMappable<U extends Unit<dynamic>> {
  String toJson() {
    return UnitValueMapper.ensureInitialized().encodeJson<UnitValue<U>>(
      this as UnitValue<U>,
    );
  }

  Map<String, dynamic> toMap() {
    return UnitValueMapper.ensureInitialized().encodeMap<UnitValue<U>>(
      this as UnitValue<U>,
    );
  }

  UnitValueCopyWith<UnitValue<U>, UnitValue<U>, UnitValue<U>, U> get copyWith =>
      _UnitValueCopyWithImpl<UnitValue<U>, UnitValue<U>, U>(
        this as UnitValue<U>,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UnitValueMapper.ensureInitialized().stringifyValue(
      this as UnitValue<U>,
    );
  }

  @override
  bool operator ==(Object other) {
    return UnitValueMapper.ensureInitialized().equalsValue(
      this as UnitValue<U>,
      other,
    );
  }

  @override
  int get hashCode {
    return UnitValueMapper.ensureInitialized().hashValue(this as UnitValue<U>);
  }
}

extension UnitValueValueCopy<$R, $Out, U extends Unit<dynamic>>
    on ObjectCopyWith<$R, UnitValue<U>, $Out> {
  UnitValueCopyWith<$R, UnitValue<U>, $Out, U> get $asUnitValue =>
      $base.as((v, t, t2) => _UnitValueCopyWithImpl<$R, $Out, U>(v, t, t2));
}

abstract class UnitValueCopyWith<$R, $In extends UnitValue<U>, $Out,
    U extends Unit<dynamic>> implements ClassCopyWith<$R, $In, $Out> {
  $R call({Decimal? value, U? unit});
  UnitValueCopyWith<$R2, $In, $Out2, U> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UnitValueCopyWithImpl<$R, $Out, U extends Unit<dynamic>>
    extends ClassCopyWithBase<$R, UnitValue<U>, $Out>
    implements UnitValueCopyWith<$R, UnitValue<U>, $Out, U> {
  _UnitValueCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UnitValue> $mapper =
      UnitValueMapper.ensureInitialized();
  @override
  $R call({Decimal? value, U? unit}) => $apply(
        FieldCopyWithData({
          if (value != null) #value: value,
          if (unit != null) #unit: unit,
        }),
      );
  @override
  UnitValue<U> $make(CopyWithData data) => UnitValue(
        data.get(#value, or: $value.value),
        data.get(#unit, or: $value.unit),
      );

  @override
  UnitValueCopyWith<$R2, UnitValue<U>, $Out2, U> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _UnitValueCopyWithImpl<$R2, $Out2, U>($value, $cast, t);
}
