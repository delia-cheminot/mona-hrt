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
class TranslationsDe extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsDe(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.de,
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

  /// Metadata for the translations of <de>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsDe _root = this; // ignore: unused_field

  @override
  TranslationsDe $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsDe(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Einnahmen';
  @override
  String get nav_levels => 'Werte';
  @override
  String get nav_supplies => 'Vorräte';
  @override
  String get takeAnIntake => 'Eine Einnahme erfassen';
  @override
  String get addAnItem => 'Eintrag hinzufügen';
  @override
  String get empty_home =>
      'Beginne, indem du einen Zeitplan in den Einstellungen erstellst';
  @override
  String get allDone => 'Alles erledigt!';
  @override
  String get noIntakesDue => 'Heute sind keine Einnahmen fällig';
  @override
  String get upcoming => 'Bevorstehend';
  @override
  String get taken => 'Genommen';
  @override
  String get yesterday => 'gestern';
  @override
  String get tomorrow => 'morgen';
  @override
  String get lastTaken => 'Zuletzt genommen';
  @override
  String get neverTakenYet => 'Noch nie genommen';
  @override
  String get scheduleFrequencyDaily => 'Täglich';
  @override
  String get scheduleFrequencyInterval => 'Intervall';
  @override
  String get scheduleFrequencyWeekly => 'Wöchentlich';
  @override
  String get newUpdateAvailable => 'Ein neues Update ist verfügbar!';
  @override
  String get goToSettings => 'Zu den Einstellungen';
  @override
  String get settingsTitle => 'Einstellungen';
  @override
  String get notifications => 'Benachrichtigungen';
  @override
  String get schedulesAndNotifications => 'Zeitpläne und Benachrichtigungen';
  @override
  String get general => 'Allgemein';
  @override
  String get schedules => 'Zeitpläne';
  @override
  String get noSchedules => 'Keine Zeitpläne';
  @override
  String get language => 'Sprache';
  @override
  String get languageFollowDevice => 'Gerätesprache verwenden';
  @override
  String get selectLanguage => 'Sprache auswählen';
  @override
  String get enableNotifications => 'Benachrichtigungen aktivieren';
  @override
  String get enableNotificationsDescription => 'Erinnerungen senden';
  @override
  String get notificationsDisabledTitle =>
      'Benachrichtigungen sind deaktiviert';
  @override
  String get clickToOpenSettings => 'Tippe, um die Einstellungen zu öffnen';
  @override
  String get exactRemindersDisabled =>
      'Exakte Erinnerungszeiten sind deaktiviert';
  @override
  String get remindersDelayed =>
      'Erinnerungen können sich leicht verzögern. Tippe, um die Einstellungen zu öffnen.';
  @override
  String get autoUpdate => 'Automatische Updates';
  @override
  String get autoUpdateDescription =>
      'Beim Start der App automatisch nach Updates suchen';
  @override
  String get checkForUpdates => 'Nach Updates suchen';
  @override
  String get checkForUpdatesDescription =>
      'Manuell nach der neuesten Version suchen\nDies stellt eine Internetverbindung her\n(Es werden keine Daten gesendet)';
  @override
  String appVersion({required Object version}) => 'Mona Version ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Backup gespeichert unter: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Export fehlgeschlagen: ${error}';
  @override
  String get importDataTitle => 'Daten importieren';
  @override
  String get importDataSubtitle =>
      'Daten aus einer JSON-Sicherung wiederherstellen';
  @override
  String get importDataOverwriteWarning =>
      'Dadurch werden alle aktuellen Daten durch das Backup überschrieben. Diese Aktion kann nicht rückgängig gemacht werden. Möchtest du fortfahren?';
  @override
  String get importConfirm => 'Importieren';
  @override
  String get importSuccessfulTitle => 'Import erfolgreich';
  @override
  String get importRestartRequired =>
      'Bitte starte die App neu, um die wiederhergestellten Daten zu übernehmen.';
  @override
  String get closeApp => 'App schließen';
  @override
  String importFailed({required Object error}) =>
      'Import fehlgeschlagen: ${error}';
  @override
  String get updates => 'Aktualisierungen';
  @override
  String get dataManagement => 'Datenverwaltung';
  @override
  String get exportDataTitle => 'Daten exportieren';
  @override
  String get exportDataSubtitle => 'Daten in einer JSON-Datei speichern';
  @override
  String get units => 'Einheiten';
  @override
  String get updateNoCompatibleApk =>
      'Keine kompatible Aktualisierung für dein Gerät gefunden.';
  @override
  String get updateAppUpToDate => 'Deine App ist auf dem neuesten Stand!';
  @override
  String get updateCheckNetworkError =>
      'Aktualisierungen konnten gerade nicht geprüft werden.';
  @override
  String get updateDialogTitle => 'Aktualisierung verfügbar';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Version ${latest} ist verfügbar! (Aktuell: ${current})\n\nEine mit deinem Gerät kompatible Aktualisierung kann installiert werden.';
  @override
  String get updateDownloadAndInstall => 'Herunterladen & installieren';
  @override
  String get updateInstallPermissionRequired =>
      'Zum Installieren von Aktualisierungen ist eine Berechtigung erforderlich.';
  @override
  String get updateDownloadingTitle => 'Aktualisierung wird heruntergeladen …';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Installer konnte nicht geöffnet werden: ${message}';
  @override
  String get updateDownloadFailed =>
      'Download fehlgeschlagen. Bitte prüfe deine Verbindung.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Zeit, ${scheduleName} einzunehmen';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Geplant für den ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Geplant für ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Geplant für ${weekday}';
  @override
  String get addSchedule => 'Zeitplan hinzufügen';
  @override
  String get addScheduleToGetStarted =>
      'Füge einen Zeitplan hinzu, um zu beginnen.';
  @override
  String get newSchedule => 'Neuer Zeitplan';
  @override
  String get every => 'Alle';
  @override
  String get days => 'Tage';
  @override
  String get startDate => 'Startdatum';
  @override
  String get pickATime => 'Uhrzeit auswählen';
  @override
  String get addIntakeTime => 'Uhrzeit hinzufügen';
  @override
  String get editScheduleInfo => 'Zeitplaninformation bearbeiten';
  @override
  String get scheduling => 'Zeitplanung';
  @override
  String get editSchedule => 'Zeitplan bearbeiten';
  @override
  String deleteSchedule({required Object name}) => '${name} löschen?';
  @override
  String get addNotification => 'Benachrichtigung hinzufügen';
  @override
  String get empty_intakes => 'Erfasste Einnahmen werden hier angezeigt';
  @override
  String get chooseSchedule => 'Zeitplan auswählen';
  @override
  String get addSchedulesFirst => 'Erstelle zuerst Zeitpläne.';
  @override
  String get editIntake => 'Einnahme bearbeiten';
  @override
  String get date => 'Datum';
  @override
  String get amount => 'Menge';
  @override
  String get takenAmount => 'Eingenommene Menge';
  @override
  String get wastedAmount => 'Verworfene Menge';
  @override
  String get none => 'Keine';
  @override
  String get supplyItem => 'Vorratselement';
  @override
  String get injectionSide => 'Injektionsseite';
  @override
  String get deleteIntake => 'Diese Einnahme löschen?';
  @override
  String takeMedication({required Object scheduleName}) =>
      '${scheduleName} einnehmen';
  @override
  String get takeIntake => 'Einnahme erfassen';
  @override
  String get intakeRecorded => 'Einnahme erfasst';
  @override
  String get needleDeadSpace => 'Totraum der Nadel';
  @override
  String get notes => 'Notizen';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Bluttests';
  @override
  String get empty_blood_tests =>
      'Erfasste Bluttests werden hier angezeigt. Starte mit der Schaltfläche „Hinzufügen“!';
  @override
  String get addBloodTest => 'Bluttest hinzufügen';
  @override
  String get editBloodTest => 'Bluttest bearbeiten';
  @override
  String get newBloodTest => 'Neuer Bluttest';
  @override
  String get deleteBloodTest => 'Diesen Bluttest löschen?';
  @override
  String get estradiolLevelLabel => 'Östradiolspiegel';
  @override
  String get testosteroneLevelLabel => 'Testosteronspiegel';
  @override
  String get bloodTestDateLabel => 'Testdatum';
  @override
  String chartNowConcentration({required Object value}) => 'Jetzt ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Keine Vorräte. Füge einen Eintrag hinzu, um zu beginnen.';
  @override
  String get newItem => 'Neuer Eintrag';
  @override
  String get adminRoute => 'Anwendungsart';
  @override
  String get totalAmount => 'Gesamtmenge';
  @override
  String get concentration => 'Konzentration';
  @override
  String get editItem => 'Eintrag bearbeiten';
  @override
  String get usedAmount => 'Verwendete Menge';
  @override
  String deleteItem({required Object name}) => '${name} löschen?';
  @override
  String get supplyType => 'Typ';
  @override
  String get syringe => 'Spritzen';
  @override
  String get wipe => 'Tupfer';
  @override
  String get needle => 'Nadeln';
  @override
  String get gloves => 'Handschuhe';
  @override
  String get bandage => 'Pflaster';
  @override
  String get add => 'Hinzufügen';
  @override
  String get save => 'Speichern';
  @override
  String get cancel => 'Abbrechen';
  @override
  String get next => 'Weiter';
  @override
  String get delete => 'Löschen';
  @override
  String get deleteElement => 'Diesen Eintrag löschen?';
  @override
  String get irreversibleAction =>
      'Diese Aktion kann nicht rückgängig gemacht werden.';
  @override
  String get name => 'Name';
  @override
  String get molecule => 'Wirkstoff';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Estradiol';
  @override
  String get progesterone => 'Progesteron';
  @override
  String get testosterone => 'Testosteron';
  @override
  String get nandrolone => 'Nandrolon';
  @override
  String get dihydrotestosterone => 'Dihydrotestosteron';
  @override
  String get spironolactone => 'Spironolacton';
  @override
  String get cyproteroneAcetate => 'Cyproteronacetat';
  @override
  String get leuprorelinAcetate => 'Leuprorelinacetat';
  @override
  String get bicalutamide => 'Bicalutamid';
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
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazon';
  @override
  String get enanthate => 'Enanthat';
  @override
  String get valerate => 'Valerat';
  @override
  String get cypionate => 'Cypionat';
  @override
  String get undecylate => 'Undecylat';
  @override
  String get benzoate => 'Benzoat';
  @override
  String get cypionateSuspension => 'Cypionat-Suspension';
  @override
  String get medicationEstradiolEnanthate => 'Estradiolenantat';
  @override
  String get medicationEstradiolValerate => 'Estradiolvalerat';
  @override
  String get medicationEstradiolCypionate => 'Estradiolcypionat';
  @override
  String get medicationEstradiolUndecylate => 'Estradiolundecylat';
  @override
  String get medicationEstradiolBenzoate => 'Estradiolbenzoat';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Estradiolcypionat-Suspension';
  @override
  String get medicationTestosteroneEnanthate => 'Testosteronenantat';
  @override
  String get medicationTestosteroneValerate => 'Testosteronvalerat';
  @override
  String get medicationTestosteroneCypionate => 'Testosteroncypionat';
  @override
  String get medicationTestosteroneUndecylate => 'Testosteronundecylat';
  @override
  String get medicationTestosteroneBenzoate => 'Testosteronbenzoat';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Testosteroncypionat-Suspension';
  @override
  String get injection => 'Injektion';
  @override
  String get oral => 'Oral';
  @override
  String get sublingual => 'Sublingual';
  @override
  String get patch => 'Pflaster';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implantat';
  @override
  String get suppository => 'Zäpfchen';
  @override
  String get transdermalSpray => 'Transdermales Spray';
  @override
  String get transdermalDrops => 'Transdermale Tropfen';
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
  String get injectionSideLeft => 'Links';
  @override
  String get injectionSideRight => 'Rechts';
  @override
  String get placementLeft => 'Linke Seite';
  @override
  String get placementRight => 'Rechte Seite';
  @override
  String get requiredField => 'Pflichtfeld';
  @override
  String get mustBePositiveNumber => 'Muss eine positive Zahl sein';
  @override
  String get invalidTotalAmount => 'Ungültige Gesamtmenge';
  @override
  String get cannotExceedTotalCapacity =>
      'Darf die Gesamtkapazität nicht überschreiten';
  @override
  String get allItemsFilter => 'Alle';
  @override
  String get medicationItemsFilter => 'Medikamente';
  @override
  String get genericItems => 'Verbrauchsmaterialien';
  @override
  String get medicationItemType => 'Medikament';
  @override
  String get genericItemType => 'Verbrauchsmaterial';
  @override
  String get medicalSettings => 'Medizinische Einstellungen';
  @override
  String get theme => 'Design';
  @override
  String get themeVariant => 'Variante';
  @override
  String get themeContrast => 'Kontrast';
  @override
  String get themeContrastStandard => 'Standard';
  @override
  String get themeContrastHigh => 'Hoch';
  @override
  String get themeGenerate => 'Generieren';
  @override
  String get themeContrastMedium => 'Mittel';
  @override
  String get themeCustomizeColors => 'App-Farben anpassen';
  @override
  String get customThemeEnabled => 'Eigenes Design';
  @override
  String get placementLeftThigh => 'Linker Oberschenkel';
  @override
  String get placementRightThigh => 'Rechter Oberschenkel';
  @override
  String get placementLeftArm => 'Linker Arm';
  @override
  String get placementRightArm => 'Rechter Arm';
  @override
  String get placementLeftAbdomen => 'Linker Bauch';
  @override
  String get placementRightAbdomen => 'Rechter Bauch';
  @override
  String get injectionSites => 'Injektionsstellen';
  @override
  String get addInjectionSite => 'Stelle hinzufügen';
  @override
  String get customSiteLabel => 'Eigener Stellenname';
  @override
  String get noInjectionSitesYet => 'Noch keine Stellen';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Füge eine Stelle hinzu, um zu beginnen.';
  @override
  String get placementLeftButtock => 'Linkes Gesäß';
  @override
  String get placementRightButtock => 'Rechtes Gesäß';
  @override
  String get scheduleFrequencyMonthly => 'Monatlich';
  @override
  String get anchorToLastIntake => 'Anhand der letzten Einnahme neu berechnen';
  @override
  String get anchorToLastIntakeDescription =>
      'Plant die nächste Einnahme ein volles Intervall nach der letzten Einnahme';
  @override
  String get dayOfMonth => 'Tag des Monats';
  @override
  String get months => 'Monate';
  @override
  String get HrtCounter => 'Zeit auf HET';
  @override
  String get HrtCounterDescription =>
      'Zeigt, wie lange du schon HET nimmst, sowie die Gesamtzahl deiner Einnahmen';
  @override
  String get hrtWidgetPlaceholder =>
      'Öffne Mona, um deine erste Einnahme zu erfassen';
  @override
  String get hrtWidgetPreviewSample => 'Seit 8 Monaten auf HET';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 Einnahmen erfasst';
  @override
  String get startOfDay => 'Tagesbeginn';
  @override
  String startOfDayDescription({required Object time}) =>
      'Zeit vor ${time} zählt zum vorherigen Tag';
  @override
  String get chooseItem => 'Eintrag auswählen';
  @override
  String get noItemsToAdd => 'Keine Einträge verfügbar';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dosis pro ${unit}';
  @override
  String get injectionSitesDescription =>
      'Verwalte die Stellen, zwischen denen du wechselst';
  @override
  String get placementSuggestionPerScheduleTitle => 'Pro Zeitplan vorschlagen';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Nächste Stelle nur anhand der Historie dieses Zeitplans vorschlagen.';
  @override
  String get mustBeBetween1And28 => 'Muss zwischen 1 und 28 liegen';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'vor ${count} Tag',
        other: 'vor ${count} Tagen',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'in ${count} Tag',
        other: 'in ${count} Tagen',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Jeden Tag',
        other: 'Alle ${count} Tage',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} erstellt',
        other: '${count} erstellt',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '${count} ${unit} verbleibend',
        other: '${count} ${unit} verbleibend',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '1 Spritze verbleibend',
        other: '${count} Spritzen verbleibend',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '1 Tupfer verbleibend',
        other: '${count} Tupfer verbleibend',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '1 Nadel verbleibend',
        other: '${count} Nadeln verbleibend',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '1 Handschuh verbleibend',
        other: '${count} Handschuhe verbleibend',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '1 Pflaster verbleibend',
        other: '${count} Pflaster verbleibend',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Tablette',
        other: 'Tabletten',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Pflaster',
        other: 'Pflaster',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Hub',
        other: 'Hübe',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Implantat',
        other: 'Implantate',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Zäpfchen',
        other: 'Zäpfchen',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Spray',
        other: 'Sprays',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Tag ${day}, jeden Monat',
        other: 'Tag ${day}, alle ${count} Monate',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Seit 1 Tag auf HET',
        other: 'Seit ${count} Tagen auf HET',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Seit 1 Woche auf HET',
        other: 'Seit ${count} Wochen auf HET',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Seit 1 Monat auf HET',
        other: 'Seit ${count} Monaten auf HET',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: 'Seit 1 Jahr auf HET',
        other: 'Seit ${count} Jahren auf HET',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
        count,
        one: '1 Einnahme erfasst',
        other: '${count} Einnahmen erfasst',
      );
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Einnahmen',
      'nav_levels' => 'Werte',
      'nav_supplies' => 'Vorräte',
      'takeAnIntake' => 'Eine Einnahme erfassen',
      'addAnItem' => 'Eintrag hinzufügen',
      'empty_home' =>
        'Beginne, indem du einen Zeitplan in den Einstellungen erstellst',
      'allDone' => 'Alles erledigt!',
      'noIntakesDue' => 'Heute sind keine Einnahmen fällig',
      'upcoming' => 'Bevorstehend',
      'taken' => 'Genommen',
      'yesterday' => 'gestern',
      'tomorrow' => 'morgen',
      'lastTaken' => 'Zuletzt genommen',
      'neverTakenYet' => 'Noch nie genommen',
      'scheduleFrequencyDaily' => 'Täglich',
      'scheduleFrequencyInterval' => 'Intervall',
      'scheduleFrequencyWeekly' => 'Wöchentlich',
      'newUpdateAvailable' => 'Ein neues Update ist verfügbar!',
      'goToSettings' => 'Zu den Einstellungen',
      'settingsTitle' => 'Einstellungen',
      'notifications' => 'Benachrichtigungen',
      'schedulesAndNotifications' => 'Zeitpläne und Benachrichtigungen',
      'general' => 'Allgemein',
      'schedules' => 'Zeitpläne',
      'noSchedules' => 'Keine Zeitpläne',
      'language' => 'Sprache',
      'languageFollowDevice' => 'Gerätesprache verwenden',
      'selectLanguage' => 'Sprache auswählen',
      'enableNotifications' => 'Benachrichtigungen aktivieren',
      'enableNotificationsDescription' => 'Erinnerungen senden',
      'notificationsDisabledTitle' => 'Benachrichtigungen sind deaktiviert',
      'clickToOpenSettings' => 'Tippe, um die Einstellungen zu öffnen',
      'exactRemindersDisabled' => 'Exakte Erinnerungszeiten sind deaktiviert',
      'remindersDelayed' =>
        'Erinnerungen können sich leicht verzögern. Tippe, um die Einstellungen zu öffnen.',
      'autoUpdate' => 'Automatische Updates',
      'autoUpdateDescription' =>
        'Beim Start der App automatisch nach Updates suchen',
      'checkForUpdates' => 'Nach Updates suchen',
      'checkForUpdatesDescription' =>
        'Manuell nach der neuesten Version suchen\nDies stellt eine Internetverbindung her\n(Es werden keine Daten gesendet)',
      'appVersion' => ({required Object version}) => 'Mona Version ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Backup gespeichert unter: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Export fehlgeschlagen: ${error}',
      'importDataTitle' => 'Daten importieren',
      'importDataSubtitle' => 'Daten aus einer JSON-Sicherung wiederherstellen',
      'importDataOverwriteWarning' =>
        'Dadurch werden alle aktuellen Daten durch das Backup überschrieben. Diese Aktion kann nicht rückgängig gemacht werden. Möchtest du fortfahren?',
      'importConfirm' => 'Importieren',
      'importSuccessfulTitle' => 'Import erfolgreich',
      'importRestartRequired' =>
        'Bitte starte die App neu, um die wiederhergestellten Daten zu übernehmen.',
      'closeApp' => 'App schließen',
      'importFailed' => ({required Object error}) =>
          'Import fehlgeschlagen: ${error}',
      'updates' => 'Aktualisierungen',
      'dataManagement' => 'Datenverwaltung',
      'exportDataTitle' => 'Daten exportieren',
      'exportDataSubtitle' => 'Daten in einer JSON-Datei speichern',
      'units' => 'Einheiten',
      'updateNoCompatibleApk' =>
        'Keine kompatible Aktualisierung für dein Gerät gefunden.',
      'updateAppUpToDate' => 'Deine App ist auf dem neuesten Stand!',
      'updateCheckNetworkError' =>
        'Aktualisierungen konnten gerade nicht geprüft werden.',
      'updateDialogTitle' => 'Aktualisierung verfügbar',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Version ${latest} ist verfügbar! (Aktuell: ${current})\n\nEine mit deinem Gerät kompatible Aktualisierung kann installiert werden.',
      'updateDownloadAndInstall' => 'Herunterladen & installieren',
      'updateInstallPermissionRequired' =>
        'Zum Installieren von Aktualisierungen ist eine Berechtigung erforderlich.',
      'updateDownloadingTitle' => 'Aktualisierung wird heruntergeladen …',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Installer konnte nicht geöffnet werden: ${message}',
      'updateDownloadFailed' =>
        'Download fehlgeschlagen. Bitte prüfe deine Verbindung.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Zeit, ${scheduleName} einzunehmen',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Geplant für den ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Geplant für ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Geplant für ${weekday}',
      'addSchedule' => 'Zeitplan hinzufügen',
      'addScheduleToGetStarted' => 'Füge einen Zeitplan hinzu, um zu beginnen.',
      'newSchedule' => 'Neuer Zeitplan',
      'every' => 'Alle',
      'days' => 'Tage',
      'startDate' => 'Startdatum',
      'pickATime' => 'Uhrzeit auswählen',
      'addIntakeTime' => 'Uhrzeit hinzufügen',
      'editScheduleInfo' => 'Zeitplaninformation bearbeiten',
      'scheduling' => 'Zeitplanung',
      'editSchedule' => 'Zeitplan bearbeiten',
      'deleteSchedule' => ({required Object name}) => '${name} löschen?',
      'addNotification' => 'Benachrichtigung hinzufügen',
      'empty_intakes' => 'Erfasste Einnahmen werden hier angezeigt',
      'chooseSchedule' => 'Zeitplan auswählen',
      'addSchedulesFirst' => 'Erstelle zuerst Zeitpläne.',
      'editIntake' => 'Einnahme bearbeiten',
      'date' => 'Datum',
      'amount' => 'Menge',
      'takenAmount' => 'Eingenommene Menge',
      'wastedAmount' => 'Verworfene Menge',
      'none' => 'Keine',
      'supplyItem' => 'Vorratselement',
      'injectionSide' => 'Injektionsseite',
      'deleteIntake' => 'Diese Einnahme löschen?',
      'takeMedication' => ({required Object scheduleName}) =>
          '${scheduleName} einnehmen',
      'takeIntake' => 'Einnahme erfassen',
      'intakeRecorded' => 'Einnahme erfasst',
      'needleDeadSpace' => 'Totraum der Nadel',
      'notes' => 'Notizen',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Bluttests',
      'empty_blood_tests' =>
        'Erfasste Bluttests werden hier angezeigt. Starte mit der Schaltfläche „Hinzufügen“!',
      'addBloodTest' => 'Bluttest hinzufügen',
      'editBloodTest' => 'Bluttest bearbeiten',
      'newBloodTest' => 'Neuer Bluttest',
      'deleteBloodTest' => 'Diesen Bluttest löschen?',
      'estradiolLevelLabel' => 'Östradiolspiegel',
      'testosteroneLevelLabel' => 'Testosteronspiegel',
      'bloodTestDateLabel' => 'Testdatum',
      'chartNowConcentration' => ({required Object value}) => 'Jetzt ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' =>
        'Keine Vorräte. Füge einen Eintrag hinzu, um zu beginnen.',
      'newItem' => 'Neuer Eintrag',
      'adminRoute' => 'Anwendungsart',
      'totalAmount' => 'Gesamtmenge',
      'concentration' => 'Konzentration',
      'editItem' => 'Eintrag bearbeiten',
      'usedAmount' => 'Verwendete Menge',
      'deleteItem' => ({required Object name}) => '${name} löschen?',
      'supplyType' => 'Typ',
      'syringe' => 'Spritzen',
      'wipe' => 'Tupfer',
      'needle' => 'Nadeln',
      'gloves' => 'Handschuhe',
      'bandage' => 'Pflaster',
      'add' => 'Hinzufügen',
      'save' => 'Speichern',
      'cancel' => 'Abbrechen',
      'next' => 'Weiter',
      'delete' => 'Löschen',
      'deleteElement' => 'Diesen Eintrag löschen?',
      'irreversibleAction' =>
        'Diese Aktion kann nicht rückgängig gemacht werden.',
      'name' => 'Name',
      'molecule' => 'Wirkstoff',
      'ester' => 'Ester',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesteron',
      'testosterone' => 'Testosteron',
      'nandrolone' => 'Nandrolon',
      'dihydrotestosterone' => 'Dihydrotestosteron',
      'spironolactone' => 'Spironolacton',
      'cyproteroneAcetate' => 'Cyproteronacetat',
      'leuprorelinAcetate' => 'Leuprorelinacetat',
      'bicalutamide' => 'Bicalutamid',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloxifen',
      'tamoxifen' => 'Tamoxifen',
      'finasteride' => 'Finasterid',
      'dutasteride' => 'Dutasterid',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazon',
      'enanthate' => 'Enanthat',
      'valerate' => 'Valerat',
      'cypionate' => 'Cypionat',
      'undecylate' => 'Undecylat',
      'benzoate' => 'Benzoat',
      'cypionateSuspension' => 'Cypionat-Suspension',
      'medicationEstradiolEnanthate' => 'Estradiolenantat',
      'medicationEstradiolValerate' => 'Estradiolvalerat',
      'medicationEstradiolCypionate' => 'Estradiolcypionat',
      'medicationEstradiolUndecylate' => 'Estradiolundecylat',
      'medicationEstradiolBenzoate' => 'Estradiolbenzoat',
      'medicationEstradiolCypionateSuspension' =>
        'Estradiolcypionat-Suspension',
      'medicationTestosteroneEnanthate' => 'Testosteronenantat',
      'medicationTestosteroneValerate' => 'Testosteronvalerat',
      'medicationTestosteroneCypionate' => 'Testosteroncypionat',
      'medicationTestosteroneUndecylate' => 'Testosteronundecylat',
      'medicationTestosteroneBenzoate' => 'Testosteronbenzoat',
      'medicationTestosteroneCypionateSuspension' =>
        'Testosteroncypionat-Suspension',
      'injection' => 'Injektion',
      'oral' => 'Oral',
      'sublingual' => 'Sublingual',
      'patch' => 'Pflaster',
      'gel' => 'Gel',
      'implant' => 'Implantat',
      'suppository' => 'Zäpfchen',
      'transdermalSpray' => 'Transdermales Spray',
      'transdermalDrops' => 'Transdermale Tropfen',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'injectionSideLeft' => 'Links',
      'injectionSideRight' => 'Rechts',
      'placementLeft' => 'Linke Seite',
      'placementRight' => 'Rechte Seite',
      'requiredField' => 'Pflichtfeld',
      'mustBePositiveNumber' => 'Muss eine positive Zahl sein',
      'invalidTotalAmount' => 'Ungültige Gesamtmenge',
      'cannotExceedTotalCapacity' =>
        'Darf die Gesamtkapazität nicht überschreiten',
      'allItemsFilter' => 'Alle',
      'medicationItemsFilter' => 'Medikamente',
      'genericItems' => 'Verbrauchsmaterialien',
      'medicationItemType' => 'Medikament',
      'genericItemType' => 'Verbrauchsmaterial',
      'medicalSettings' => 'Medizinische Einstellungen',
      'theme' => 'Design',
      'themeVariant' => 'Variante',
      'themeContrast' => 'Kontrast',
      'themeContrastStandard' => 'Standard',
      'themeContrastHigh' => 'Hoch',
      'themeGenerate' => 'Generieren',
      'themeContrastMedium' => 'Mittel',
      'themeCustomizeColors' => 'App-Farben anpassen',
      'customThemeEnabled' => 'Eigenes Design',
      'placementLeftThigh' => 'Linker Oberschenkel',
      'placementRightThigh' => 'Rechter Oberschenkel',
      'placementLeftArm' => 'Linker Arm',
      'placementRightArm' => 'Rechter Arm',
      'placementLeftAbdomen' => 'Linker Bauch',
      'placementRightAbdomen' => 'Rechter Bauch',
      'injectionSites' => 'Injektionsstellen',
      'addInjectionSite' => 'Stelle hinzufügen',
      'customSiteLabel' => 'Eigener Stellenname',
      'noInjectionSitesYet' => 'Noch keine Stellen',
      'noInjectionAddOneToGetStarted' =>
        'Füge eine Stelle hinzu, um zu beginnen.',
      'placementLeftButtock' => 'Linkes Gesäß',
      'placementRightButtock' => 'Rechtes Gesäß',
      'scheduleFrequencyMonthly' => 'Monatlich',
      'anchorToLastIntake' => 'Anhand der letzten Einnahme neu berechnen',
      'anchorToLastIntakeDescription' =>
        'Plant die nächste Einnahme ein volles Intervall nach der letzten Einnahme',
      'dayOfMonth' => 'Tag des Monats',
      'months' => 'Monate',
      'HrtCounter' => 'Zeit auf HET',
      'HrtCounterDescription' =>
        'Zeigt, wie lange du schon HET nimmst, sowie die Gesamtzahl deiner Einnahmen',
      'hrtWidgetPlaceholder' =>
        'Öffne Mona, um deine erste Einnahme zu erfassen',
      'hrtWidgetPreviewSample' => 'Seit 8 Monaten auf HET',
      'hrtWidgetPreviewIntakeSample' => '16 Einnahmen erfasst',
      'startOfDay' => 'Tagesbeginn',
      'startOfDayDescription' => ({required Object time}) =>
          'Zeit vor ${time} zählt zum vorherigen Tag',
      'chooseItem' => 'Eintrag auswählen',
      'noItemsToAdd' => 'Keine Einträge verfügbar',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dosis pro ${unit}',
      'injectionSitesDescription' =>
        'Verwalte die Stellen, zwischen denen du wechselst',
      'placementSuggestionPerScheduleTitle' => 'Pro Zeitplan vorschlagen',
      'placementSuggestionPerScheduleDescription' =>
        'Nächste Stelle nur anhand der Historie dieses Zeitplans vorschlagen.',
      'mustBeBetween1And28' => 'Muss zwischen 1 und 28 liegen',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'vor ${count} Tag',
            other: 'vor ${count} Tagen',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'in ${count} Tag',
            other: 'in ${count} Tagen',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Jeden Tag',
            other: 'Alle ${count} Tage',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '${count} erstellt',
            other: '${count} erstellt',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '${count} ${unit} verbleibend',
            other: '${count} ${unit} verbleibend',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '1 Spritze verbleibend',
            other: '${count} Spritzen verbleibend',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '1 Tupfer verbleibend',
            other: '${count} Tupfer verbleibend',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '1 Nadel verbleibend',
            other: '${count} Nadeln verbleibend',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '1 Handschuh verbleibend',
            other: '${count} Handschuhe verbleibend',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '1 Pflaster verbleibend',
            other: '${count} Pflaster verbleibend',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Tablette',
            other: 'Tabletten',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Pflaster',
            other: 'Pflaster',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Hub',
            other: 'Hübe',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Implantat',
            other: 'Implantate',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Zäpfchen',
            other: 'Zäpfchen',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Spray',
            other: 'Sprays',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Tag ${day}, jeden Monat',
            other: 'Tag ${day}, alle ${count} Monate',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Seit 1 Tag auf HET',
            other: 'Seit ${count} Tagen auf HET',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Seit 1 Woche auf HET',
            other: 'Seit ${count} Wochen auf HET',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Seit 1 Monat auf HET',
            other: 'Seit ${count} Monaten auf HET',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: 'Seit 1 Jahr auf HET',
            other: 'Seit ${count} Jahren auf HET',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('de'))(
            count,
            one: '1 Einnahme erfasst',
            other: '${count} Einnahmen erfasst',
          ),
      _ => null,
    };
  }
}
