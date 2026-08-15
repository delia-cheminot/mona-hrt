///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsSv extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSv(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.sv,
              overrides: overrides ?? {},
              cardinalResolver: cardinalResolver,
              ordinalResolver: ordinalResolver,
            ),
        super(
            cardinalResolver: cardinalResolver,
            ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <sv>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsSv _root = this; // ignore: unused_field

  @override
  TranslationsSv $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsSv(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Intag';
  @override
  String get allDone => 'Allt klart!';
  @override
  String get unitMilligram => 'mg';
  @override
  String get unitPgPerMl => 'pg/mL';
  @override
  String get unitPmolPerL => 'pmol/L';
  @override
  String get unitNgPerDl => 'ng/dL';
  @override
  String get unitNmolPerL => 'nmol/L';
  @override
  String get tomorrow => 'imorgon';
  @override
  String get yesterday => 'igår';
  @override
  String get nav_levels => 'Värden';
  @override
  String get nav_supplies => 'Material';
  @override
  String get takeAnIntake => 'Ta ett intag';
  @override
  String get notifications => 'Aviseringar';
  @override
  String get settingsTitle => 'Inställningar';
  @override
  String get schedulesAndNotifications => 'Scheman och aviseringar';
  @override
  String get schedules => 'Scheman';
  @override
  String get noSchedules => 'Inga scheman';
  @override
  String get language => 'Språk';
  @override
  String get languageFollowDevice => 'Använd enhetens språk';
  @override
  String get selectLanguage => 'Välj Språk';
  @override
  String get enableNotifications => 'Aktivera aviseringar';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Östradiol';
  @override
  String get progesterone => 'Progesteron';
  @override
  String get testosterone => 'Testosteron';
  @override
  String get nandrolone => 'Nandrolon';
  @override
  String get dihydrotestosterone => 'Dihydrotestosteron';
  @override
  String get spironolactone => 'Spironolakton';
  @override
  String get cyproteroneAcetate => 'Cyproteronacetat';
  @override
  String get leuprorelinAcetate => 'Leuprorelinacetat';
  @override
  String get bicalutamide => 'Bikalutamid';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloxifen';
  @override
  String get tamoxifen => 'Tamoxifen';
  @override
  String get finasteride => 'Finasterid';
  @override
  String get dutasteride => 'Dutasterid';
  @override
  String appVersion({required Object version}) => 'Mona version ${version}';
  @override
  String get importDataTitle => 'Importera data';
  @override
  String get closeApp => 'Stäng appen';
  @override
  String get updateAppUpToDate => 'Din app är uppdaterad!';
  @override
  String get updateDialogTitle => 'Uppdatering tillgänglig';
  @override
  String get updateDownloadAndInstall => 'Hämta & installera';
  @override
  String get addAnItem => 'Lägg till ett objekt';
  @override
  String get empty_home => 'Börja med att skapa ett schema i Inställningar';
  @override
  String get noIntakesDue => 'Inga intag planerade för idag';
  @override
  String get upcoming => 'Kommande';
  @override
  String get taken => 'Intaget';
  @override
  String get lastTaken => 'Senaste intag';
  @override
  String get newUpdateAvailable => 'En ny uppdatering är tillgänglig!';
  @override
  String get goToSettings => 'Gå till Inställningar';
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'ml',
        other: 'ml',
      );
}

/// The flat map containing all translations for locale <sv>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsSv {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Intag',
      'allDone' => 'Allt klart!',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'tomorrow' => 'imorgon',
      'yesterday' => 'igår',
      'nav_levels' => 'Värden',
      'nav_supplies' => 'Material',
      'takeAnIntake' => 'Ta ett intag',
      'notifications' => 'Aviseringar',
      'settingsTitle' => 'Inställningar',
      'schedulesAndNotifications' => 'Scheman och aviseringar',
      'schedules' => 'Scheman',
      'noSchedules' => 'Inga scheman',
      'language' => 'Språk',
      'languageFollowDevice' => 'Använd enhetens språk',
      'selectLanguage' => 'Välj Språk',
      'enableNotifications' => 'Aktivera aviseringar',
      'ester' => 'Ester',
      'estradiol' => 'Östradiol',
      'progesterone' => 'Progesteron',
      'testosterone' => 'Testosteron',
      'nandrolone' => 'Nandrolon',
      'dihydrotestosterone' => 'Dihydrotestosteron',
      'spironolactone' => 'Spironolakton',
      'cyproteroneAcetate' => 'Cyproteronacetat',
      'leuprorelinAcetate' => 'Leuprorelinacetat',
      'bicalutamide' => 'Bikalutamid',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloxifen',
      'tamoxifen' => 'Tamoxifen',
      'finasteride' => 'Finasterid',
      'dutasteride' => 'Dutasterid',
      'appVersion' => ({required Object version}) => 'Mona version ${version}',
      'importDataTitle' => 'Importera data',
      'closeApp' => 'Stäng appen',
      'updateAppUpToDate' => 'Din app är uppdaterad!',
      'updateDialogTitle' => 'Uppdatering tillgänglig',
      'updateDownloadAndInstall' => 'Hämta & installera',
      'addAnItem' => 'Lägg till ett objekt',
      'empty_home' => 'Börja med att skapa ett schema i Inställningar',
      'noIntakesDue' => 'Inga intag planerade för idag',
      'upcoming' => 'Kommande',
      'taken' => 'Intaget',
      'lastTaken' => 'Senaste intag',
      'newUpdateAvailable' => 'En ny uppdatering är tillgänglig!',
      'goToSettings' => 'Gå till Inställningar',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      _ => null,
    };
  }
}
