import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/theme/custom_theme_schemes.dart';
import 'package:mona/theme/default_color_schemes.dart';

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

  ColorScheme _fallbackScheme(Brightness brightness) {
    return brightness == Brightness.dark
        ? DefaultColorSchemes.dark
        : DefaultColorSchemes.light;
  }
}
