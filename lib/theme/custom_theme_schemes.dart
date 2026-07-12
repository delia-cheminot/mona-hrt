import 'dart:math' show Random;
import 'package:flutter/material.dart';

import 'package:libmonet/material_color_utilities.dart' as monet;
import 'package:material_color_utilities/dislike/dislike_analyzer.dart';
import 'package:material_color_utilities/hct/hct.dart';

import 'custom_theme_settings.dart';

class CustomThemeSchemes {
  static ({ColorScheme light, ColorScheme dark}) fromSettings(
    CustomThemeSettings settings,
  ) {
    return (
      light: schemeFor(
        seedArgb: settings.seedArgb,
        variant: settings.variant,
        contrastLevel: settings.contrastLevel,
        brightness: Brightness.light,
      ),
      dark: schemeFor(
        seedArgb: settings.seedArgb,
        variant: settings.variant,
        contrastLevel: settings.contrastLevel,
        brightness: Brightness.dark,
      ),
    );
  }

  /// Adaptor for libmonet's [monet.DynamicScheme] to Flutter's [ColorScheme].
  static ColorScheme schemeFor({
    required int seedArgb,
    required DynamicSchemeVariant variant,
    required double contrastLevel,
    required Brightness brightness,
  }) {
    final scheme = monet.DynamicScheme.fromPalettesOrKeyColors(
      sourceColorHct: monet.Hct.fromInt(seedArgb),
      variant: _toMonetVariant(variant),
      contrastLevel: contrastLevel,
      isDark: brightness == Brightness.dark,
      specVersion: monet.SpecVersion.spec2025,
      platform: monet.Platform.phone,
    );
    return _toColorScheme(scheme, brightness);
  }

  static monet.Variant _toMonetVariant(DynamicSchemeVariant variant) {
    return monet.Variant.values.byName(variant.name);
  }

  static ColorScheme _toColorScheme(monet.DynamicScheme s, Brightness b) {
    Color c(int argb) => Color(argb);
    return ColorScheme(
      brightness: b,
      primary: c(s.primary),
      onPrimary: c(s.onPrimary),
      primaryContainer: c(s.primaryContainer),
      onPrimaryContainer: c(s.onPrimaryContainer),
      primaryFixed: c(s.primaryFixed),
      primaryFixedDim: c(s.primaryFixedDim),
      onPrimaryFixed: c(s.onPrimaryFixed),
      onPrimaryFixedVariant: c(s.onPrimaryFixedVariant),
      secondary: c(s.secondary),
      onSecondary: c(s.onSecondary),
      secondaryContainer: c(s.secondaryContainer),
      onSecondaryContainer: c(s.onSecondaryContainer),
      secondaryFixed: c(s.secondaryFixed),
      secondaryFixedDim: c(s.secondaryFixedDim),
      onSecondaryFixed: c(s.onSecondaryFixed),
      onSecondaryFixedVariant: c(s.onSecondaryFixedVariant),
      tertiary: c(s.tertiary),
      onTertiary: c(s.onTertiary),
      tertiaryContainer: c(s.tertiaryContainer),
      onTertiaryContainer: c(s.onTertiaryContainer),
      tertiaryFixed: c(s.tertiaryFixed),
      tertiaryFixedDim: c(s.tertiaryFixedDim),
      onTertiaryFixed: c(s.onTertiaryFixed),
      onTertiaryFixedVariant: c(s.onTertiaryFixedVariant),
      error: c(s.error),
      onError: c(s.onError),
      errorContainer: c(s.errorContainer),
      onErrorContainer: c(s.onErrorContainer),
      surface: c(s.surface),
      onSurface: c(s.onSurface),
      surfaceDim: c(s.surfaceDim),
      surfaceBright: c(s.surfaceBright),
      surfaceContainerLowest: c(s.surfaceContainerLowest),
      surfaceContainerLow: c(s.surfaceContainerLow),
      surfaceContainer: c(s.surfaceContainer),
      surfaceContainerHigh: c(s.surfaceContainerHigh),
      surfaceContainerHighest: c(s.surfaceContainerHighest),
      onSurfaceVariant: c(s.onSurfaceVariant),
      outline: c(s.outline),
      outlineVariant: c(s.outlineVariant),
      shadow: c(s.shadow),
      scrim: c(s.scrim),
      inverseSurface: c(s.inverseSurface),
      onInverseSurface: c(s.inverseOnSurface),
      inversePrimary: c(s.inversePrimary),
      surfaceTint: c(s.surfaceTint),
    );
  }

  static int randomSourceArgb([Random? random]) {
    final rng = random ?? Random();
    final r = rng.nextInt(256);
    final g = rng.nextInt(256);
    final b = rng.nextInt(256);
    const opaque = 0xFF000000;
    final argb = opaque | (r << 16) | (g << 8) | b;
    final hct = DislikeAnalyzer.fixIfDisliked(Hct.fromInt(argb));
    return hct.toInt();
  }
}
