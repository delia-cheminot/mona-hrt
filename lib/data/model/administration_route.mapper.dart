// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'administration_route.dart';

class AdministrationRouteMapper extends EnumMapper<AdministrationRoute> {
  AdministrationRouteMapper._();

  static AdministrationRouteMapper? _instance;
  static AdministrationRouteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdministrationRouteMapper._());
    }
    return _instance!;
  }

  static AdministrationRoute fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AdministrationRoute decode(dynamic value) {
    switch (value) {
      case r'injection':
        return AdministrationRoute.injection;
      case r'oral':
        return AdministrationRoute.oral;
      case r'sublingual':
        return AdministrationRoute.sublingual;
      case r'patch':
        return AdministrationRoute.patch;
      case r'gel':
        return AdministrationRoute.gel;
      case r'implant':
        return AdministrationRoute.implant;
      case r'suppository':
        return AdministrationRoute.suppository;
      case r'transdermalSpray':
        return AdministrationRoute.transdermalSpray;
      case r'transdermalDrops':
        return AdministrationRoute.transdermalDrops;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AdministrationRoute self) {
    switch (self) {
      case AdministrationRoute.injection:
        return r'injection';
      case AdministrationRoute.oral:
        return r'oral';
      case AdministrationRoute.sublingual:
        return r'sublingual';
      case AdministrationRoute.patch:
        return r'patch';
      case AdministrationRoute.gel:
        return r'gel';
      case AdministrationRoute.implant:
        return r'implant';
      case AdministrationRoute.suppository:
        return r'suppository';
      case AdministrationRoute.transdermalSpray:
        return r'transdermalSpray';
      case AdministrationRoute.transdermalDrops:
        return r'transdermalDrops';
    }
  }
}

extension AdministrationRouteMapperExtension on AdministrationRoute {
  String toValue() {
    AdministrationRouteMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AdministrationRoute>(this) as String;
  }
}
