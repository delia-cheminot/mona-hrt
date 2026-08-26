// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'blood_test.dart';

class BloodTestMapper extends ClassMapperBase<BloodTest> {
  BloodTestMapper._();

  static BloodTestMapper? _instance;
  static BloodTestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BloodTestMapper._());
      UnitValueMapper.ensureInitialized();
      EstradiolUnitMapper.ensureInitialized();
      TestosteroneUnitMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BloodTest';

  static int _$id(BloodTest v) => v.id;
  static const Field<BloodTest, int> _f$id = Field('id', _$id, opt: true);
  static DateTime _$dateTime(BloodTest v) => v.dateTime;
  static const Field<BloodTest, DateTime> _f$dateTime = Field(
    'dateTime',
    _$dateTime,
  );
  static String _$timeZone(BloodTest v) => v.timeZone;
  static const Field<BloodTest, String> _f$timeZone = Field(
    'timeZone',
    _$timeZone,
  );
  static UnitValue<EstradiolUnit>? _$estradiolLevels(BloodTest v) =>
      v.estradiolLevels;
  static const Field<BloodTest, UnitValue<EstradiolUnit>> _f$estradiolLevels =
      Field(
    'estradiolLevels',
    _$estradiolLevels,
    opt: true,
    hook: JsonStringHook(),
  );
  static UnitValue<TestosteroneUnit>? _$testosteroneLevels(BloodTest v) =>
      v.testosteroneLevels;
  static const Field<BloodTest, UnitValue<TestosteroneUnit>>
      _f$testosteroneLevels = Field(
    'testosteroneLevels',
    _$testosteroneLevels,
    opt: true,
    hook: JsonStringHook(),
  );

  @override
  final MappableFields<BloodTest> fields = const {
    #id: _f$id,
    #dateTime: _f$dateTime,
    #timeZone: _f$timeZone,
    #estradiolLevels: _f$estradiolLevels,
    #testosteroneLevels: _f$testosteroneLevels,
  };

  static BloodTest _instantiate(DecodingData data) {
    return BloodTest(
      id: data.dec(_f$id),
      dateTime: data.dec(_f$dateTime),
      timeZone: data.dec(_f$timeZone),
      estradiolLevels: data.dec(_f$estradiolLevels),
      testosteroneLevels: data.dec(_f$testosteroneLevels),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BloodTest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BloodTest>(map);
  }

  static BloodTest fromJson(String json) {
    return ensureInitialized().decodeJson<BloodTest>(json);
  }
}

mixin BloodTestMappable {
  String toJson() {
    return BloodTestMapper.ensureInitialized().encodeJson<BloodTest>(
      this as BloodTest,
    );
  }

  Map<String, dynamic> toMap() {
    return BloodTestMapper.ensureInitialized().encodeMap<BloodTest>(
      this as BloodTest,
    );
  }

  BloodTestCopyWith<BloodTest, BloodTest, BloodTest> get copyWith =>
      _BloodTestCopyWithImpl<BloodTest, BloodTest>(
        this as BloodTest,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return BloodTestMapper.ensureInitialized().stringifyValue(
      this as BloodTest,
    );
  }

  @override
  bool operator ==(Object other) {
    return BloodTestMapper.ensureInitialized().equalsValue(
      this as BloodTest,
      other,
    );
  }

  @override
  int get hashCode {
    return BloodTestMapper.ensureInitialized().hashValue(this as BloodTest);
  }
}

extension BloodTestValueCopy<$R, $Out> on ObjectCopyWith<$R, BloodTest, $Out> {
  BloodTestCopyWith<$R, BloodTest, $Out> get $asBloodTest =>
      $base.as((v, t, t2) => _BloodTestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class BloodTestCopyWith<$R, $In extends BloodTest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UnitValueCopyWith<$R, UnitValue<EstradiolUnit>, UnitValue<EstradiolUnit>,
      EstradiolUnit>? get estradiolLevels;
  UnitValueCopyWith<$R, UnitValue<TestosteroneUnit>,
      UnitValue<TestosteroneUnit>, TestosteroneUnit>? get testosteroneLevels;
  $R call({
    int? id,
    DateTime? dateTime,
    String? timeZone,
    UnitValue<EstradiolUnit>? estradiolLevels,
    UnitValue<TestosteroneUnit>? testosteroneLevels,
  });
  BloodTestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BloodTestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BloodTest, $Out>
    implements BloodTestCopyWith<$R, BloodTest, $Out> {
  _BloodTestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BloodTest> $mapper =
      BloodTestMapper.ensureInitialized();
  @override
  UnitValueCopyWith<$R, UnitValue<EstradiolUnit>, UnitValue<EstradiolUnit>,
          EstradiolUnit>?
      get estradiolLevels => $value.estradiolLevels?.copyWith
          .$chain((v) => call(estradiolLevels: v));
  @override
  UnitValueCopyWith<$R, UnitValue<TestosteroneUnit>,
          UnitValue<TestosteroneUnit>, TestosteroneUnit>?
      get testosteroneLevels => $value.testosteroneLevels?.copyWith.$chain(
            (v) => call(testosteroneLevels: v),
          );
  @override
  $R call({
    Object? id = $none,
    DateTime? dateTime,
    String? timeZone,
    Object? estradiolLevels = $none,
    Object? testosteroneLevels = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != $none) #id: id,
          if (dateTime != null) #dateTime: dateTime,
          if (timeZone != null) #timeZone: timeZone,
          if (estradiolLevels != $none) #estradiolLevels: estradiolLevels,
          if (testosteroneLevels != $none)
            #testosteroneLevels: testosteroneLevels,
        }),
      );
  @override
  BloodTest $make(CopyWithData data) => BloodTest(
        id: data.get(#id, or: $value.id),
        dateTime: data.get(#dateTime, or: $value.dateTime),
        timeZone: data.get(#timeZone, or: $value.timeZone),
        estradiolLevels: data.get(#estradiolLevels, or: $value.estradiolLevels),
        testosteroneLevels: data.get(
          #testosteroneLevels,
          or: $value.testosteroneLevels,
        ),
      );

  @override
  BloodTestCopyWith<$R2, BloodTest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _BloodTestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
