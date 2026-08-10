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
class TranslationsNl extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsNl(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.nl,
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

  /// Metadata for the translations of <nl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsNl _root = this; // ignore: unused_field

  @override
  TranslationsNl $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsNl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Innamens';
  @override
  String get nav_levels => 'Waarden';
  @override
  String get nav_supplies => 'Middelen';
  @override
  String get takeAnIntake => 'Dosis toevoegen';
  @override
  String get addAnItem => 'Item toevoegen';
  @override
  String get empty_home =>
      'Begin door een planning toe te voegen in de Instellingen';
  @override
  String get allDone => 'Afgerond!';
  @override
  String get noIntakesDue => 'Geen innamens voor vandaag';
  @override
  String get upcoming => 'Aankomend';
  @override
  String get taken => 'Genomen';
  @override
  String get yesterday => 'gisteren';
  @override
  String get tomorrow => 'morgen';
  @override
  String get scheduleFrequencyDaily => 'Elke dag';
  @override
  String get scheduleFrequencyWeekly => 'Wekelijks';
  @override
  String get scheduleFrequencyMonthly => 'Maandelijks';
  @override
  String get newUpdateAvailable => 'Een nieuwe update is beschikbaar!';
  @override
  String get goToSettings => 'Ga naar Instellingen';
  @override
  String get settingsTitle => 'Instellingen';
  @override
  String get notifications => 'Meldingen';
  @override
  String get schedulesAndNotifications => 'Planning & meldingen';
  @override
  String get general => 'Algemeen';
  @override
  String get schedules => 'Planning';
  @override
  String get noSchedules => 'Geen geplande momenten';
  @override
  String get language => 'Taal';
  @override
  String get languageFollowDevice => 'Apparaattaal volgen';
  @override
  String get selectLanguage => 'Taal Selecteren';
  @override
  String get enableNotifications => 'Meldingen aanzetten';
  @override
  String get enableNotificationsDescription => 'Reminders verzenden';
  @override
  String get notificationsDisabledTitle => 'Meldingen staan uit';
  @override
  String get clickToOpenSettings => 'Klik om instellingen te openen';
  @override
  String get exactRemindersDisabled => 'Exacte tijden voor reminders staan uit';
  @override
  String get remindersDelayed =>
      'Reminders kunnen misschien een beetje later aankomen. Klik om instellingen te openen.';
  @override
  String get medicalSettings => 'Medische instellingen';
  @override
  String get theme => 'Thema';
  @override
  String get themeCustomizeColors => 'Appkleuren aanpassen';
  @override
  String get customThemeEnabled => 'Aangepast thema';
  @override
  String get themeGenerate => 'Genereer';
  @override
  String get themeVariant => 'Variant';
  @override
  String get themeContrast => 'Contrast';
  @override
  String get themeContrastStandard => 'Standaard';
  @override
  String get themeContrastMedium => 'Medium';
  @override
  String get themeContrastHigh => 'Hoog';
  @override
  String get autoUpdate => 'Automatisch Updaten';
  @override
  String get autoUpdateDescription =>
      'Check automatisch of er een nieuwe app versie is wanneer de app opstart';
  @override
  String get checkForUpdates => 'Check voor Updates';
  @override
  String get checkForUpdatesDescription =>
      'Handmatig controleren op de nieuwste versie\nEr wordt verbinding gemaakt met het internet\n(Er worden geen gegevens verzonden)';
  @override
  String appVersion({required Object version}) => 'Mona versie ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Backup opgeslagen in: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Exporteren mislukt: ${error}';
  @override
  String get importDataTitle => 'Data importeren';
  @override
  String get importDataSubtitle => 'Data herstellen van een JSON backup';
  @override
  String get importDataOverwriteWarning =>
      'Dit zal je oude data overschrijven met de backup. Deze actie kan niet teruggedraaid worden. Wil je toch doorgaan?';
  @override
  String get importConfirm => 'Importeren';
  @override
  String get importSuccessfulTitle => 'Succesvol geimporteerd';
  @override
  String get importRestartRequired =>
      'Start de app opnieuw op om de nieuwe data in te laden.';
  @override
  String get closeApp => 'App Afsluiten';
  @override
  String importFailed({required Object error}) =>
      'Importeren mislukt: ${error}';
  @override
  String get updates => 'Updates';
  @override
  String get dataManagement => 'Data Management';
  @override
  String get exportDataTitle => 'Data Exporteren';
  @override
  String get exportDataSubtitle => 'Sla je data op in een JSON bestand';
  @override
  String get units => 'Eenheden';
  @override
  String get updateNoCompatibleApk =>
      'Er is geen geschikte update beschikbaar voor je apparaat.';
  @override
  String get updateAppUpToDate => 'Je gebruikt de nieuwste versie van de app!';
  @override
  String get updateCheckNetworkError =>
      'Kan niet op nieuwe updates checken op dit moment.';
  @override
  String get updateDialogTitle => 'Update Beschikbaar';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Versie ${latest} is beschikbaar! (Huidige: ${current})\n\nEen geschikte update is klaar om te installeren voor je apparaat.';
  @override
  String get updateDownloadAndInstall => 'Download & Installeer';
  @override
  String get updateInstallPermissionRequired =>
      'Een permissie is nodig om updates te kunnen installeren.';
  @override
  String get updateDownloadingTitle => 'Update Downloaden...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Openen van de installer mislukt: ${message}';
  @override
  String get updateDownloadFailed =>
      'Download mislukt. Controlleer je internet connectie.';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Gepland voor ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Gepland voor ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Gepland voor ${weekday}';
  @override
  String get addSchedule => 'Planning toevoegen';
  @override
  String get addScheduleToGetStarted => 'Voeg een planning toe om te beginnen.';
  @override
  String get newSchedule => 'Nieuwe planning';
  @override
  String get every => 'Elke';
  @override
  String get days => 'dagen';
  @override
  String get dayOfMonth => 'Dag van de maand';
  @override
  String get months => 'maanden';
  @override
  String get startDate => 'Start datun';
  @override
  String get pickATime => 'Kies een tijd';
  @override
  String get addIntakeTime => 'Een tijd toevoegen';
  @override
  String get editScheduleInfo => 'Planning informatie bewerken';
  @override
  String get scheduling => 'Planning';
  @override
  String get editSchedule => 'Planning bewerken';
  @override
  String deleteSchedule({required Object name}) => '${name} verwijderen?';
  @override
  String get addNotification => 'Melding toevoegen';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} dag geleden',
        other: '${count} dagen geleden',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'over ${count} dag',
        other: 'over ${count} dagen',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Elke dag',
        other: 'Elke ${count} dagen',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Dag ${day}, elke maand',
        other: 'Dag ${day}, elke ${count} maanden',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} aangemaakt',
        other: '${count} aangemaakt',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Aan HRT voor 1 dag',
        other: 'Aan HRT voor ${count} dagen',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Aan HRT voor 1 week',
        other: 'Aan HRT voor ${count} weken',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Aan HRT voor 1 maand',
        other: 'Aan HRT voor ${count} maanden',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Aan HRT voor 1 jaar',
        other: 'Aan HRT voor ${count} jaar',
      );
}

/// The flat map containing all translations for locale <nl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsNl {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Innamens',
      'nav_levels' => 'Waarden',
      'nav_supplies' => 'Middelen',
      'takeAnIntake' => 'Dosis toevoegen',
      'addAnItem' => 'Item toevoegen',
      'empty_home' =>
        'Begin door een planning toe te voegen in de Instellingen',
      'allDone' => 'Afgerond!',
      'noIntakesDue' => 'Geen innamens voor vandaag',
      'upcoming' => 'Aankomend',
      'taken' => 'Genomen',
      'yesterday' => 'gisteren',
      'tomorrow' => 'morgen',
      'scheduleFrequencyDaily' => 'Elke dag',
      'scheduleFrequencyWeekly' => 'Wekelijks',
      'scheduleFrequencyMonthly' => 'Maandelijks',
      'newUpdateAvailable' => 'Een nieuwe update is beschikbaar!',
      'goToSettings' => 'Ga naar Instellingen',
      'settingsTitle' => 'Instellingen',
      'notifications' => 'Meldingen',
      'schedulesAndNotifications' => 'Planning & meldingen',
      'general' => 'Algemeen',
      'schedules' => 'Planning',
      'noSchedules' => 'Geen geplande momenten',
      'language' => 'Taal',
      'languageFollowDevice' => 'Apparaattaal volgen',
      'selectLanguage' => 'Taal Selecteren',
      'enableNotifications' => 'Meldingen aanzetten',
      'enableNotificationsDescription' => 'Reminders verzenden',
      'notificationsDisabledTitle' => 'Meldingen staan uit',
      'clickToOpenSettings' => 'Klik om instellingen te openen',
      'exactRemindersDisabled' => 'Exacte tijden voor reminders staan uit',
      'remindersDelayed' =>
        'Reminders kunnen misschien een beetje later aankomen. Klik om instellingen te openen.',
      'medicalSettings' => 'Medische instellingen',
      'theme' => 'Thema',
      'themeCustomizeColors' => 'Appkleuren aanpassen',
      'customThemeEnabled' => 'Aangepast thema',
      'themeGenerate' => 'Genereer',
      'themeVariant' => 'Variant',
      'themeContrast' => 'Contrast',
      'themeContrastStandard' => 'Standaard',
      'themeContrastMedium' => 'Medium',
      'themeContrastHigh' => 'Hoog',
      'autoUpdate' => 'Automatisch Updaten',
      'autoUpdateDescription' =>
        'Check automatisch of er een nieuwe app versie is wanneer de app opstart',
      'checkForUpdates' => 'Check voor Updates',
      'checkForUpdatesDescription' =>
        'Handmatig controleren op de nieuwste versie\nEr wordt verbinding gemaakt met het internet\n(Er worden geen gegevens verzonden)',
      'appVersion' => ({required Object version}) => 'Mona versie ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Backup opgeslagen in: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Exporteren mislukt: ${error}',
      'importDataTitle' => 'Data importeren',
      'importDataSubtitle' => 'Data herstellen van een JSON backup',
      'importDataOverwriteWarning' =>
        'Dit zal je oude data overschrijven met de backup. Deze actie kan niet teruggedraaid worden. Wil je toch doorgaan?',
      'importConfirm' => 'Importeren',
      'importSuccessfulTitle' => 'Succesvol geimporteerd',
      'importRestartRequired' =>
        'Start de app opnieuw op om de nieuwe data in te laden.',
      'closeApp' => 'App Afsluiten',
      'importFailed' => ({required Object error}) =>
          'Importeren mislukt: ${error}',
      'updates' => 'Updates',
      'dataManagement' => 'Data Management',
      'exportDataTitle' => 'Data Exporteren',
      'exportDataSubtitle' => 'Sla je data op in een JSON bestand',
      'units' => 'Eenheden',
      'updateNoCompatibleApk' =>
        'Er is geen geschikte update beschikbaar voor je apparaat.',
      'updateAppUpToDate' => 'Je gebruikt de nieuwste versie van de app!',
      'updateCheckNetworkError' =>
        'Kan niet op nieuwe updates checken op dit moment.',
      'updateDialogTitle' => 'Update Beschikbaar',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Versie ${latest} is beschikbaar! (Huidige: ${current})\n\nEen geschikte update is klaar om te installeren voor je apparaat.',
      'updateDownloadAndInstall' => 'Download & Installeer',
      'updateInstallPermissionRequired' =>
        'Een permissie is nodig om updates te kunnen installeren.',
      'updateDownloadingTitle' => 'Update Downloaden...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Openen van de installer mislukt: ${message}',
      'updateDownloadFailed' =>
        'Download mislukt. Controlleer je internet connectie.',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Gepland voor ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Gepland voor ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Gepland voor ${weekday}',
      'addSchedule' => 'Planning toevoegen',
      'addScheduleToGetStarted' => 'Voeg een planning toe om te beginnen.',
      'newSchedule' => 'Nieuwe planning',
      'every' => 'Elke',
      'days' => 'dagen',
      'dayOfMonth' => 'Dag van de maand',
      'months' => 'maanden',
      'startDate' => 'Start datun',
      'pickATime' => 'Kies een tijd',
      'addIntakeTime' => 'Een tijd toevoegen',
      'editScheduleInfo' => 'Planning informatie bewerken',
      'scheduling' => 'Planning',
      'editSchedule' => 'Planning bewerken',
      'deleteSchedule' => ({required Object name}) => '${name} verwijderen?',
      'addNotification' => 'Melding toevoegen',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '${count} dag geleden',
            other: '${count} dagen geleden',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'over ${count} dag',
            other: 'over ${count} dagen',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Elke dag',
            other: 'Elke ${count} dagen',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Dag ${day}, elke maand',
            other: 'Dag ${day}, elke ${count} maanden',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '${count} aangemaakt',
            other: '${count} aangemaakt',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Aan HRT voor 1 dag',
            other: 'Aan HRT voor ${count} dagen',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Aan HRT voor 1 week',
            other: 'Aan HRT voor ${count} weken',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Aan HRT voor 1 maand',
            other: 'Aan HRT voor ${count} maanden',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Aan HRT voor 1 jaar',
            other: 'Aan HRT voor ${count} jaar',
          ),
      _ => null,
    };
  }
}
