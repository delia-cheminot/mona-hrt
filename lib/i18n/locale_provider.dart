import 'package:flutter/material.dart';
import 'package:intl/locale.dart' as intl;
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  final PreferencesService _prefs;

  LocaleProvider(this._prefs) {
    _loadLocale();
  }

  Locale get locale => _locale;

  List<Locale> get supportedLocales => AppLocaleUtils.supportedLocales;

  void setLocale(Locale newLocale) {
    final tag = newLocale.toLanguageTag();
    final matched = _matchToSupported(newLocale);

    if (_locale == matched && _prefs.savedLanguageTag == tag) return;

    _locale = matched;
    _prefs.setSavedLanguageTag(tag);
    _syncSlang();
    notifyListeners();
  }

  Future<void> setFollowSystemLocale() async {
    await _prefs.setSavedLanguageTag(null);
    final before = _locale;
    _loadLocale();
    if (_locale != before) {
      notifyListeners();
    }
  }

  void _syncSlang() {
    LocaleSettings.setLocaleSync(
      AppLocaleUtils.parse(_locale.toLanguageTag()),
    );
  }

  Locale _matchToSupported(Locale source) {
    for (final l in supportedLocales) {
      if (l.languageCode != source.languageCode) continue;
      if (l.countryCode == source.countryCode) return l;
    }
    return supportedLocales.firstWhere(
      (l) => l.languageCode == source.languageCode,
      orElse: () => const Locale('en'),
    );
  }

  void _loadLocale() {
    Locale? result;

    final savedTag = _prefs.savedLanguageTag;
    if (savedTag != null) {
      final parsed = intl.Locale.tryParse(savedTag);
      if (parsed != null) {
        result = Locale.fromSubtags(
          languageCode: parsed.languageCode,
          scriptCode: parsed.scriptCode,
          countryCode: parsed.countryCode,
        );
      }
    }

    result ??= WidgetsBinding.instance.platformDispatcher.locale;

    _locale = _matchToSupported(result);
    _syncSlang();
  }
}
