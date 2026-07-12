import 'package:flutter/material.dart';

@immutable
class CustomThemeSettings {
  const CustomThemeSettings({
    this.seedArgb = defaultSeedArgb,
    this.variant = DynamicSchemeVariant.tonalSpot,
    this.contrastLevel = 0.0,
  });

  static const int defaultSeedArgb = 0xFF673AB7;

  static const String jsonKeySeedArgb = 'seedArgb';
  static const String jsonKeyVariant = 'variant';
  static const String jsonKeyContrast = 'contrastLevel';

  static const double contrastStandard = 0.0;
  static const double contrastMedium = 0.5;
  static const double contrastHigh = 1.0;

  final int seedArgb;
  final DynamicSchemeVariant variant;
  final double contrastLevel;

  factory CustomThemeSettings.fromJson(Map<String, dynamic> json) {
    final seedArgb = json[jsonKeySeedArgb] as int;
    final variant =
        DynamicSchemeVariant.values.byName(json[jsonKeyVariant] as String);
    final contrastLevel = (json[jsonKeyContrast] as num).toDouble();

    return CustomThemeSettings(
      seedArgb: seedArgb,
      variant: variant,
      contrastLevel: contrastLevel,
    );
  }

  Map<String, dynamic> toJson() => {
        jsonKeySeedArgb: seedArgb,
        jsonKeyVariant: variant.name,
        jsonKeyContrast: contrastLevel,
      };

  CustomThemeSettings copyWith({
    int? seedArgb,
    DynamicSchemeVariant? variant,
    double? contrastLevel,
  }) {
    return CustomThemeSettings(
      seedArgb: seedArgb ?? this.seedArgb,
      variant: variant ?? this.variant,
      contrastLevel: contrastLevel ?? this.contrastLevel,
    );
  }
}
