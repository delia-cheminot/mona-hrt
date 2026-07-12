// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'placement.dart';

class PlacementPresetMapper extends EnumMapper<PlacementPreset> {
  PlacementPresetMapper._();

  static PlacementPresetMapper? _instance;
  static PlacementPresetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlacementPresetMapper._());
    }
    return _instance!;
  }

  static PlacementPreset fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PlacementPreset decode(dynamic value) {
    switch (value) {
      case r'left':
        return PlacementPreset.left;
      case r'right':
        return PlacementPreset.right;
      case r'leftThigh':
        return PlacementPreset.leftThigh;
      case r'rightThigh':
        return PlacementPreset.rightThigh;
      case r'leftArm':
        return PlacementPreset.leftArm;
      case r'rightArm':
        return PlacementPreset.rightArm;
      case r'leftButtock':
        return PlacementPreset.leftButtock;
      case r'rightButtock':
        return PlacementPreset.rightButtock;
      case r'leftAbdomen':
        return PlacementPreset.leftAbdomen;
      case r'rightAbdomen':
        return PlacementPreset.rightAbdomen;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PlacementPreset self) {
    switch (self) {
      case PlacementPreset.left:
        return r'left';
      case PlacementPreset.right:
        return r'right';
      case PlacementPreset.leftThigh:
        return r'leftThigh';
      case PlacementPreset.rightThigh:
        return r'rightThigh';
      case PlacementPreset.leftArm:
        return r'leftArm';
      case PlacementPreset.rightArm:
        return r'rightArm';
      case PlacementPreset.leftButtock:
        return r'leftButtock';
      case PlacementPreset.rightButtock:
        return r'rightButtock';
      case PlacementPreset.leftAbdomen:
        return r'leftAbdomen';
      case PlacementPreset.rightAbdomen:
        return r'rightAbdomen';
    }
  }
}

extension PlacementPresetMapperExtension on PlacementPreset {
  String toValue() {
    PlacementPresetMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PlacementPreset>(this) as String;
  }
}

class PlacementMapper extends ClassMapperBase<Placement> {
  PlacementMapper._();

  static PlacementMapper? _instance;
  static PlacementMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlacementMapper._());
      PresetPlacementMapper.ensureInitialized();
      CustomPlacementMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Placement';

  @override
  final MappableFields<Placement> fields = const {};

  static Placement _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'Placement',
      'kind',
      '${data.value['kind']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Placement fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Placement>(map);
  }

  static Placement fromJson(String json) {
    return ensureInitialized().decodeJson<Placement>(json);
  }
}

mixin PlacementMappable {
  String toJson();
  Map<String, dynamic> toMap();
  PlacementCopyWith<Placement, Placement, Placement> get copyWith;
}

abstract class PlacementCopyWith<$R, $In extends Placement, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  PlacementCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class PresetPlacementMapper extends SubClassMapperBase<PresetPlacement> {
  PresetPlacementMapper._();

  static PresetPlacementMapper? _instance;
  static PresetPlacementMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PresetPlacementMapper._());
      PlacementMapper.ensureInitialized().addSubMapper(_instance!);
      PlacementPresetMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PresetPlacement';

  static PlacementPreset _$preset(PresetPlacement v) => v.preset;
  static const Field<PresetPlacement, PlacementPreset> _f$preset = Field(
    'preset',
    _$preset,
  );

  @override
  final MappableFields<PresetPlacement> fields = const {#preset: _f$preset};

  @override
  final String discriminatorKey = 'kind';
  @override
  final dynamic discriminatorValue = 'preset';
  @override
  late final ClassMapperBase superMapper = PlacementMapper.ensureInitialized();

  static PresetPlacement _instantiate(DecodingData data) {
    return PresetPlacement(data.dec(_f$preset));
  }

  @override
  final Function instantiate = _instantiate;

  static PresetPlacement fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PresetPlacement>(map);
  }

  static PresetPlacement fromJson(String json) {
    return ensureInitialized().decodeJson<PresetPlacement>(json);
  }
}

mixin PresetPlacementMappable {
  String toJson() {
    return PresetPlacementMapper.ensureInitialized()
        .encodeJson<PresetPlacement>(this as PresetPlacement);
  }

  Map<String, dynamic> toMap() {
    return PresetPlacementMapper.ensureInitialized().encodeMap<PresetPlacement>(
      this as PresetPlacement,
    );
  }

  PresetPlacementCopyWith<PresetPlacement, PresetPlacement, PresetPlacement>
      get copyWith =>
          _PresetPlacementCopyWithImpl<PresetPlacement, PresetPlacement>(
            this as PresetPlacement,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return PresetPlacementMapper.ensureInitialized().stringifyValue(
      this as PresetPlacement,
    );
  }

  @override
  bool operator ==(Object other) {
    return PresetPlacementMapper.ensureInitialized().equalsValue(
      this as PresetPlacement,
      other,
    );
  }

  @override
  int get hashCode {
    return PresetPlacementMapper.ensureInitialized().hashValue(
      this as PresetPlacement,
    );
  }
}

extension PresetPlacementValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PresetPlacement, $Out> {
  PresetPlacementCopyWith<$R, PresetPlacement, $Out> get $asPresetPlacement =>
      $base.as((v, t, t2) => _PresetPlacementCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PresetPlacementCopyWith<$R, $In extends PresetPlacement, $Out>
    implements PlacementCopyWith<$R, $In, $Out> {
  @override
  $R call({PlacementPreset? preset});
  PresetPlacementCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PresetPlacementCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PresetPlacement, $Out>
    implements PresetPlacementCopyWith<$R, PresetPlacement, $Out> {
  _PresetPlacementCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PresetPlacement> $mapper =
      PresetPlacementMapper.ensureInitialized();
  @override
  $R call({PlacementPreset? preset}) =>
      $apply(FieldCopyWithData({if (preset != null) #preset: preset}));
  @override
  PresetPlacement $make(CopyWithData data) =>
      PresetPlacement(data.get(#preset, or: $value.preset));

  @override
  PresetPlacementCopyWith<$R2, PresetPlacement, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _PresetPlacementCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class CustomPlacementMapper extends SubClassMapperBase<CustomPlacement> {
  CustomPlacementMapper._();

  static CustomPlacementMapper? _instance;
  static CustomPlacementMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomPlacementMapper._());
      PlacementMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'CustomPlacement';

  static String _$label(CustomPlacement v) => v.label;
  static const Field<CustomPlacement, String> _f$label = Field(
    'label',
    _$label,
  );

  @override
  final MappableFields<CustomPlacement> fields = const {#label: _f$label};

  @override
  final String discriminatorKey = 'kind';
  @override
  final dynamic discriminatorValue = 'custom';
  @override
  late final ClassMapperBase superMapper = PlacementMapper.ensureInitialized();

  static CustomPlacement _instantiate(DecodingData data) {
    return CustomPlacement(data.dec(_f$label));
  }

  @override
  final Function instantiate = _instantiate;

  static CustomPlacement fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomPlacement>(map);
  }

  static CustomPlacement fromJson(String json) {
    return ensureInitialized().decodeJson<CustomPlacement>(json);
  }
}

mixin CustomPlacementMappable {
  String toJson() {
    return CustomPlacementMapper.ensureInitialized()
        .encodeJson<CustomPlacement>(this as CustomPlacement);
  }

  Map<String, dynamic> toMap() {
    return CustomPlacementMapper.ensureInitialized().encodeMap<CustomPlacement>(
      this as CustomPlacement,
    );
  }

  CustomPlacementCopyWith<CustomPlacement, CustomPlacement, CustomPlacement>
      get copyWith =>
          _CustomPlacementCopyWithImpl<CustomPlacement, CustomPlacement>(
            this as CustomPlacement,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return CustomPlacementMapper.ensureInitialized().stringifyValue(
      this as CustomPlacement,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomPlacementMapper.ensureInitialized().equalsValue(
      this as CustomPlacement,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomPlacementMapper.ensureInitialized().hashValue(
      this as CustomPlacement,
    );
  }
}

extension CustomPlacementValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomPlacement, $Out> {
  CustomPlacementCopyWith<$R, CustomPlacement, $Out> get $asCustomPlacement =>
      $base.as((v, t, t2) => _CustomPlacementCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CustomPlacementCopyWith<$R, $In extends CustomPlacement, $Out>
    implements PlacementCopyWith<$R, $In, $Out> {
  @override
  $R call({String? label});
  CustomPlacementCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CustomPlacementCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomPlacement, $Out>
    implements CustomPlacementCopyWith<$R, CustomPlacement, $Out> {
  _CustomPlacementCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomPlacement> $mapper =
      CustomPlacementMapper.ensureInitialized();
  @override
  $R call({String? label}) =>
      $apply(FieldCopyWithData({if (label != null) #label: label}));
  @override
  CustomPlacement $make(CopyWithData data) =>
      CustomPlacement(data.get(#label, or: $value.label));

  @override
  CustomPlacementCopyWith<$R2, CustomPlacement, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _CustomPlacementCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
