/// Generated file. Do not edit.
///
/// Source: lib/i18n/generated
/// To regenerate, run: `dart run slang`
///
/// Locales: 19
/// Strings: 4893 (257 per locale)

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'translations_de.g.dart' as l_de;
import 'translations_es.g.dart' as l_es;
import 'translations_et.g.dart' as l_et;
import 'translations_fr.g.dart' as l_fr;
import 'translations_gl.g.dart' as l_gl;
import 'translations_is.g.dart' as l_is;
import 'translations_ko.g.dart' as l_ko;
import 'translations_nl.g.dart' as l_nl;
import 'translations_pl.g.dart' as l_pl;
import 'translations_pt.g.dart' as l_pt;
import 'translations_ru.g.dart' as l_ru;
import 'translations_sk.g.dart' as l_sk;
import 'translations_sv.g.dart' as l_sv;
import 'translations_th.g.dart' as l_th;
import 'translations_tok.g.dart' as l_tok;
import 'translations_uk.g.dart' as l_uk;
import 'translations_en_GB.g.dart' as l_en_GB;
import 'translations_pt_BR.g.dart' as l_pt_BR;
part 'translations_en.g.dart';

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en'),
  de(languageCode: 'de'),
  es(languageCode: 'es'),
  et(languageCode: 'et'),
  fr(languageCode: 'fr'),
  gl(languageCode: 'gl'),
  icelandic(languageCode: 'is'),
  ko(languageCode: 'ko'),
  nl(languageCode: 'nl'),
  pl(languageCode: 'pl'),
  pt(languageCode: 'pt'),
  ru(languageCode: 'ru'),
  sk(languageCode: 'sk'),
  sv(languageCode: 'sv'),
  th(languageCode: 'th'),
  tok(languageCode: 'tok'),
  uk(languageCode: 'uk'),
  enGb(languageCode: 'en', countryCode: 'GB'),
  ptBr(languageCode: 'pt', countryCode: 'BR');

  const AppLocale({
    required this.languageCode,
    this.scriptCode, // ignore: unused_element, unused_element_parameter
    this.countryCode, // ignore: unused_element, unused_element_parameter
  });

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;

  @override
  Future<Translations> build({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) async {
    return buildSync(
      overrides: overrides,
      cardinalResolver: cardinalResolver,
      ordinalResolver: ordinalResolver,
    );
  }

  @override
  Translations buildSync({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) {
    switch (this) {
      case AppLocale.en:
        return TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.de:
        return l_de.TranslationsDe(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.es:
        return l_es.TranslationsEs(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.et:
        return l_et.TranslationsEt(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.fr:
        return l_fr.TranslationsFr(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.gl:
        return l_gl.TranslationsGl(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.icelandic:
        return l_is.TranslationsIs(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.ko:
        return l_ko.TranslationsKo(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.nl:
        return l_nl.TranslationsNl(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.pl:
        return l_pl.TranslationsPl(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.pt:
        return l_pt.TranslationsPt(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.ru:
        return l_ru.TranslationsRu(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.sk:
        return l_sk.TranslationsSk(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.sv:
        return l_sv.TranslationsSv(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.th:
        return l_th.TranslationsTh(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.tok:
        return l_tok.TranslationsTok(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.uk:
        return l_uk.TranslationsUk(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.enGb:
        return l_en_GB.TranslationsEnGb(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.ptBr:
        return l_pt_BR.TranslationsPtBr(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.getTranslations(this);
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._()
      : super(
          utils: AppLocaleUtils.instance,
          lazy: false,
        );

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static Future<AppLocale> setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static Future<AppLocale> setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static Future<AppLocale> useDeviceLocale() => instance.useDeviceLocale();
  static Future<void> setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );

  // synchronous versions
  static AppLocale setLocaleSync(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleSync(locale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRawSync(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRawSync(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocaleSync() => instance.useDeviceLocaleSync();
  static void setPluralResolverSync(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolverSync(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(
          baseLocale: AppLocale.en,
          locales: AppLocale.values,
        );

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
