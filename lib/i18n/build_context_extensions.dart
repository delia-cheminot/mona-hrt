import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String intlSafeLanguageTag(String tag) {
  return Intl.verifiedLocale(
        tag,
        DateFormat.localeExists,
        onFailure: (_) => 'en',
      ) ??
      'en';
}

extension BuildContextL10n on BuildContext {
  /// Current [Locale] for this context (same as [MaterialApp.locale] when set).
  Locale get locale => Localizations.maybeLocaleOf(this) ?? const Locale('en');

  /// Current [Locale] as a string (same as [MaterialApp.locale] when set).
  String get languageTag => locale.toLanguageTag();

  /// Language tag safe for use with `intl`, English fallback.
  String get intlLanguageTag => locale.intlLanguageTag;
}

extension LocaleIntl on Locale {
  /// Language tag safe for use with `intl`, English fallback.
  String get intlLanguageTag => intlSafeLanguageTag(toLanguageTag());
}
