import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/theme/custom_theme_schemes.dart';

/// Resolves [ThemeData] for light and dark from system dynamic colors and
/// [PreferencesService] (custom seed / toggles). Listens to prefs and notifies
/// so widgets using [context.watch] can rebuild.
class AppThemeProvider extends ChangeNotifier {
  AppThemeProvider(this._prefs) {
    _prefs.addListener(_onPrefsChanged);
  }

  final PreferencesService _prefs;

  void _onPrefsChanged() => notifyListeners();

  @override
  void dispose() {
    _prefs.removeListener(_onPrefsChanged);
    super.dispose();
  }

  static const _useMaterial3 = true;

  /// Builds the pair of themes for the current preferences and the latest
  /// system [ColorScheme]s from [DynamicColorBuilder] (null = use fallback).
  ({ThemeData theme, ThemeData darkTheme}) buildThemeData({
    required ColorScheme? systemLight,
    required ColorScheme? systemDark,
  }) {
    if (_prefs.customThemeEnabled) {
      final custom = _prefs.customTheme;
      final schemes = CustomThemeSchemes.fromSettings(custom);
      return (
        theme: ThemeData(
          useMaterial3: _useMaterial3,
          colorScheme: schemes.light,
        ),
        darkTheme: ThemeData(
          useMaterial3: _useMaterial3,
          colorScheme: schemes.dark,
        ),
      );
    }

    return (
      theme: ThemeData(
        useMaterial3: _useMaterial3,
        colorScheme: systemLight ?? _fallbackScheme(Brightness.light),
      ),
      darkTheme: ThemeData(
        useMaterial3: _useMaterial3,
        colorScheme: systemDark ?? _fallbackScheme(Brightness.dark),
      ),
    );
  }

  static const _fallbackSeedArgb = 0xFF4B1570;

  ColorScheme _fallbackScheme(Brightness brightness) {
    return CustomThemeSchemes.schemeFor(
      seedArgb: _fallbackSeedArgb,
      variant: DynamicSchemeVariant.vibrant,
      contrastLevel: 0.0,
      brightness: brightness,
    );
  }
}
