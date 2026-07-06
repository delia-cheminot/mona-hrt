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
class TranslationsTok extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsTok(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.tok,
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

  /// Metadata for the translations of <tok>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsTok _root = this; // ignore: unused_field

  @override
  TranslationsTok $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsTok(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'open';
  @override
  String get nav_levels => 'nanpa insa';
  @override
  String get nav_supplies => 'jo';
  @override
  String get addAnItem => 'pana e ijo sin';
  @override
  String get empty_home => 'o pana e nasin tenpo lon poki nasin';
  @override
  String get allDone => 'ale li pini!';
  @override
  String get noIntakesDue => 'tenpo ni la open li wile ala';
  @override
  String get upcoming => 'kama';
  @override
  String get yesterday => 'tenpo suno pini';
  @override
  String get tomorrow => 'tenpo suno kama';
  @override
  String get goToSettings => 'o tawa poki nasin';
  @override
  String get settingsTitle => 'poki nasin';
  @override
  String get notifications => 'pana toki';
  @override
  String get schedulesAndNotifications => 'nasin tenpo en pana toki';
  @override
  String get general => 'ale';
  @override
  String get schedules => 'nasin tenpo';
  @override
  String get noSchedules => 'nasin tenpo li lon ala';
  @override
  String get language => 'toki';
  @override
  String get languageFollowDevice => 'o kepeken e toki ilo';
  @override
  String get enableNotifications => 'o open e pana toki';
  @override
  String get notificationsDisabledTitle => 'pana toki li lon ala';
  @override
  String get checkForUpdates => 'o alasa e sin';
  @override
  String get updateDialogTitle => 'sin li lon';
  @override
  String get addSchedule => 'o pana e nasin tenpo sin';
  @override
  String get addScheduleToGetStarted => 'o pana e nasin tenpo sin la o open.';
  @override
  String get newSchedule => 'nasin tenpo sin';
  @override
  String get days => 'tenpo suno';
  @override
  String get startDate => 'tenpo open';
  @override
  String get addIntakeTime => 'o pana e tenpo';
  @override
  String get editScheduleInfo => 'o ante e sona pi nasin tenpo';
  @override
  String get scheduling => 'nasin tenpo';
  @override
  String get noNotifications => 'pana toki li lon ala';
  @override
  String get editSchedule => 'o ante e nasin tenpo';
  @override
  String deleteSchedule({required Object name}) =>
      'o weka ala weka e nasin tenpo ${name}?';
  @override
  String get scheduleNotifications => 'pana toki pi nasin tenpo';
  @override
  String get addNotification => 'o pana e pana toki sin';
  @override
  String get dontShowAgain => 'o pana ala e ni sin';
  @override
  String get scheduleSettings => 'poki nasin pi nasin tenpo';
  @override
  String get editIntake => 'o ante e open';
  @override
  String get date => 'tenpo';
  @override
  String get none => 'ala';
  @override
  String get supplyItem => 'ijo jo';
  @override
  String get deleteIntake => 'o weka ala weka e open ni?';
  @override
  String get notes => 'lipu';
  @override
  String get microliters => 'μL';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies => 'jo li lon ala. o pana e ijo sin la o open.';
  @override
  String get allItemsFilter => 'ale';
  @override
  String get newItem => 'ijo sin';
  @override
  String get adminRoute => 'pana nasin';
  @override
  String get concentration => 'wawa';
  @override
  String get editItem => 'o ante e ijo';
  @override
  String deleteItem({required Object name}) => 'o weka ala weka e ${name}?';
  @override
  String get add => 'pana';
  @override
  String get cancel => 'o weka';
  @override
  String get next => 'kama';
  @override
  String get deleteElement => 'o weka ala weka e ijo ni?';
  @override
  String get irreversibleAction => 'sina ken ala ante e ni.';
  @override
  String get name => 'nimi';
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
  String get requiredField => 'poki ni li wile e nimi';
}

/// The flat map containing all translations for locale <tok>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTok {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'open',
      'nav_levels' => 'nanpa insa',
      'nav_supplies' => 'jo',
      'addAnItem' => 'pana e ijo sin',
      'empty_home' => 'o pana e nasin tenpo lon poki nasin',
      'allDone' => 'ale li pini!',
      'noIntakesDue' => 'tenpo ni la open li wile ala',
      'upcoming' => 'kama',
      'yesterday' => 'tenpo suno pini',
      'tomorrow' => 'tenpo suno kama',
      'goToSettings' => 'o tawa poki nasin',
      'settingsTitle' => 'poki nasin',
      'notifications' => 'pana toki',
      'schedulesAndNotifications' => 'nasin tenpo en pana toki',
      'general' => 'ale',
      'schedules' => 'nasin tenpo',
      'noSchedules' => 'nasin tenpo li lon ala',
      'language' => 'toki',
      'languageFollowDevice' => 'o kepeken e toki ilo',
      'enableNotifications' => 'o open e pana toki',
      'notificationsDisabledTitle' => 'pana toki li lon ala',
      'checkForUpdates' => 'o alasa e sin',
      'updateDialogTitle' => 'sin li lon',
      'addSchedule' => 'o pana e nasin tenpo sin',
      'addScheduleToGetStarted' => 'o pana e nasin tenpo sin la o open.',
      'newSchedule' => 'nasin tenpo sin',
      'days' => 'tenpo suno',
      'startDate' => 'tenpo open',
      'addIntakeTime' => 'o pana e tenpo',
      'editScheduleInfo' => 'o ante e sona pi nasin tenpo',
      'scheduling' => 'nasin tenpo',
      'noNotifications' => 'pana toki li lon ala',
      'editSchedule' => 'o ante e nasin tenpo',
      'deleteSchedule' => ({required Object name}) =>
          'o weka ala weka e nasin tenpo ${name}?',
      'scheduleNotifications' => 'pana toki pi nasin tenpo',
      'addNotification' => 'o pana e pana toki sin',
      'dontShowAgain' => 'o pana ala e ni sin',
      'scheduleSettings' => 'poki nasin pi nasin tenpo',
      'editIntake' => 'o ante e open',
      'date' => 'tenpo',
      'none' => 'ala',
      'supplyItem' => 'ijo jo',
      'deleteIntake' => 'o weka ala weka e open ni?',
      'notes' => 'lipu',
      'microliters' => 'μL',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'empty_supplies' => 'jo li lon ala. o pana e ijo sin la o open.',
      'allItemsFilter' => 'ale',
      'newItem' => 'ijo sin',
      'adminRoute' => 'pana nasin',
      'concentration' => 'wawa',
      'editItem' => 'o ante e ijo',
      'deleteItem' => ({required Object name}) => 'o weka ala weka e ${name}?',
      'add' => 'pana',
      'cancel' => 'o weka',
      'next' => 'kama',
      'deleteElement' => 'o weka ala weka e ijo ni?',
      'irreversibleAction' => 'sina ken ala ante e ni.',
      'name' => 'nimi',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'requiredField' => 'poki ni li wile e nimi',
      _ => null,
    };
  }
}
