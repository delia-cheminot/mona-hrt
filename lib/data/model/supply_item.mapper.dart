// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'supply_item.dart';

class SupplyItemMapper extends ClassMapperBase<SupplyItem> {
  SupplyItemMapper._();

  static SupplyItemMapper? _instance;
  static SupplyItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SupplyItemMapper._());
      MedicationSupplyItemMapper.ensureInitialized();
      GenericSupplyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SupplyItem';

  @override
  final MappableFields<SupplyItem> fields = const {};

  static SupplyItem _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'SupplyItem',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupplyItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupplyItem>(map);
  }

  static SupplyItem fromJson(String json) {
    return ensureInitialized().decodeJson<SupplyItem>(json);
  }
}

mixin SupplyItemMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SupplyItemCopyWith<SupplyItem, SupplyItem, SupplyItem> get copyWith;
}

abstract class SupplyItemCopyWith<$R, $In extends SupplyItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SupplyItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
