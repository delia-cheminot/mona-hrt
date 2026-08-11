// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ester.dart';

class EsterMapper extends EnumMapper<Ester> {
  EsterMapper._();

  static EsterMapper? _instance;
  static EsterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EsterMapper._());
    }
    return _instance!;
  }

  static Ester fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Ester decode(dynamic value) {
    switch (value) {
      case r'enanthate':
        return Ester.enanthate;
      case r'valerate':
        return Ester.valerate;
      case r'cypionate':
        return Ester.cypionate;
      case r'undecylate':
        return Ester.undecylate;
      case r'benzoate':
        return Ester.benzoate;
      case r'cypionateSuspension':
        return Ester.cypionateSuspension;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Ester self) {
    switch (self) {
      case Ester.enanthate:
        return r'enanthate';
      case Ester.valerate:
        return r'valerate';
      case Ester.cypionate:
        return r'cypionate';
      case Ester.undecylate:
        return r'undecylate';
      case Ester.benzoate:
        return r'benzoate';
      case Ester.cypionateSuspension:
        return r'cypionateSuspension';
    }
  }
}

extension EsterMapperExtension on Ester {
  String toValue() {
    EsterMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Ester>(this) as String;
  }
}
