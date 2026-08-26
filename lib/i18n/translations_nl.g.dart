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
  String get startOfDay => 'Begin van de dag';
  @override
  String startOfDayDescription({required Object time}) =>
      'Tijd voor ${time} teld voor de vorige dag';
  @override
  String get chooseSchedule => 'Kies een schema';
  @override
  String get addSchedulesFirst => 'Voeg eerst een schema toe.';
  @override
  String get editIntake => 'Intake bewerken';
  @override
  String get date => 'Datum';
  @override
  String get amount => 'Hoeveelheid';
  @override
  String get takenAmount => 'Genomen hoeveelheid';
  @override
  String get wastedAmount => 'Verloren hoeveelheid';
  @override
  String get none => 'Geen';
  @override
  String get chooseItem => 'Kies een item';
  @override
  String get noItemsToAdd => 'Geen items beschikbaar';
  @override
  String get injectionSide => 'Kant van injectie';
  @override
  String get deleteIntake => 'Deze intake verwijderen?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Neem ${scheduleName}';
  @override
  String get takeIntake => 'Neem intake';
  @override
  String get intakeRecorded => 'Intake opgenomen';
  @override
  String get notes => 'Notities';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Bloedwaardentesten';
  @override
  String get empty_blood_tests =>
      'Genomen bloedwaardentesten zullen hier komen te staan. Begin door op de Toevoegen knop te drukken!';
  @override
  String get addBloodTest => 'Voeg een bloedwaardentest toe';
  @override
  String get editBloodTest => 'Een bloedwaardentest bewerken';
  @override
  String get newBloodTest => 'Nieuwe bloedwaardentest';
  @override
  String get deleteBloodTest => 'Deze bloedwaardentest verwijderen?';
  @override
  String get estradiolLevelLabel => 'Oestradiol niveau';
  @override
  String get testosteroneLevelLabel => 'Testosteron niveau';
  @override
  String get bloodTestDateLabel => 'Test datum';
  @override
  String chartNowConcentration({required Object value}) => 'Nu ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Geen middelen. Voeg een item toe om te beginnen.';
  @override
  String get newItem => 'Nieuw item';
  @override
  String get totalAmount => 'Totale hoeveelheid';
  @override
  String get concentration => 'Concentratie';
  @override
  String get editItem => 'Item bewerken';
  @override
  String get usedAmount => 'Gebruikte hoeveelheid';
  @override
  String deleteItem({required Object name}) => '${name} verwijderen?';
  @override
  String get allItemsFilter => 'Alles';
  @override
  String get medicationItemsFilter => 'Medicatie';
  @override
  String get genericItems => 'Verbruiksmaterialen';
  @override
  String get medicationItemType => 'Medicatie';
  @override
  String get genericItemType => 'Verbruiksmaterialen';
  @override
  String get supplyType => 'Type';
  @override
  String get syringe => 'Injectiespuiten';
  @override
  String get wipe => 'Doekjes';
  @override
  String get needle => 'Naalden';
  @override
  String get gloves => 'Handschoenen';
  @override
  String get bandage => 'Pleisters/Verband';
  @override
  String get add => 'Toevoegen';
  @override
  String get save => 'Opslaan';
  @override
  String get cancel => 'Annuleren';
  @override
  String get next => 'Volgende';
  @override
  String get delete => 'Verwijderen';
  @override
  String get deleteElement => 'Dit item verwijderen?';
  @override
  String get irreversibleAction =>
      'Deze actie kan niet ongedaan worden gemaakt.';
  @override
  String get name => 'Naam';
  @override
  String get molecule => 'Molecule';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Oestradiol';
  @override
  String get progesterone => 'Progesterone';
  @override
  String get testosterone => 'Testosteron';
  @override
  String get nandrolone => 'Nandrolon';
  @override
  String get dihydrotestosterone => 'Dihydrotestosteron';
  @override
  String get spironolactone => 'Spironolacton';
  @override
  String get cyproteroneAcetate => 'Cyproteronacetaat';
  @override
  String get leuprorelinAcetate => 'Leuprorelineacetaat';
  @override
  String get bicalutamide => 'Bicalutamide';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloxifene';
  @override
  String get tamoxifen => 'Tamoxifen';
  @override
  String get finasteride => 'Finasteride';
  @override
  String get dutasteride => 'Dutasteride';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazone';
  @override
  String get enanthate => 'Enanthaat';
  @override
  String get valerate => 'Valeraat';
  @override
  String get cypionate => 'Cypionaat';
  @override
  String get undecylate => 'Undecylaat';
  @override
  String get benzoate => 'Benzoaat';
  @override
  String get cypionateSuspension => 'Cypionaat-suspensie';
  @override
  String get medicationEstradiolEnanthate => 'Estradiol-enanthaat';
  @override
  String get medicationEstradiolValerate => 'Estradiolvaleraat';
  @override
  String get medicationEstradiolCypionate => 'Estradiolcypionaat';
  @override
  String get medicationEstradiolUndecylate => 'Estradiolundecylaat';
  @override
  String get medicationEstradiolBenzoate => 'Estradiolbenzoaat';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Estradiolcypionaat-suspensie';
  @override
  String get injection => 'Injectie';
  @override
  String get oral => 'Oraal';
  @override
  String get sublingual => 'Sublinguaal';
  @override
  String get patch => 'Pleister';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implantaat';
  @override
  String get suppository => 'Zetpil';
  @override
  String get transdermalSpray => 'Transdermale spray';
  @override
  String get transdermalDrops => 'Transdermale druppels';
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
  String get placementLeft => 'Linker kant';
  @override
  String get placementRight => 'Rechter kant';
  @override
  String get placementLeftThigh => 'Linkerdij';
  @override
  String get placementRightThigh => 'Rechterdij';
  @override
  String get placementLeftArm => 'Linkerarm';
  @override
  String get placementRightArm => 'Rechterarm';
  @override
  String get placementLeftButtock => 'Linkerbil';
  @override
  String get placementRightButtock => 'Rechterbil';
  @override
  String get placementLeftAbdomen => 'Linkerzijde van de buik';
  @override
  String get placementRightAbdomen => 'Rechterzijde van de buik';
  @override
  String get injectionSites => 'Injectieplekken';
  @override
  String get injectionSitesDescription => 'Beheer de plekken waar je wisselt';
  @override
  String get addInjectionSite => 'Plek toevoegen';
  @override
  String get noInjectionSitesYet => 'Nog geen plekken';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Voeg hieronder plekken toe om te beginnen.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Suggesteer per schema';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Baseer de suggestie voor de volgende plek alleen op de geschiedenis van dit schema.';
  @override
  String get requiredField => 'Verplicht veld';
  @override
  String get mustBePositiveNumber => 'Moet een positief nummer zijn';
  @override
  String get mustBeBetween1And28 => 'Moet tussen 1 en 28 zijn';
  @override
  String get invalidTotalAmount => 'Ongeldige totaalhoeveelheid';
  @override
  String get cannotExceedTotalCapacity => 'Kan niet het totaal overschrijden';
  @override
  String get lastTaken => 'Laatst (in)genomen';
  @override
  String get neverTakenYet => 'Nog niet (in)genomen';
  @override
  String get scheduleFrequencyInterval => 'Interval';
  @override
  String get anchorToLastIntake =>
      'Opnieuw berekenen op basis van de laatste inname';
  @override
  String get anchorToLastIntakeDescription =>
      'Plan de volgende inname volgens de ingestelde interval sinds de vorige inname';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Tijd om ${scheduleName} in te nemen';
  @override
  String get empty_intakes => '(In)Genomen innames zullen hier getoond worden';
  @override
  String get HrtCounterDescription =>
      'Laat zien hoe lang je aan HRT zit en je totale innames';
  @override
  String get HrtCounter => 'Tijd op HRT';
  @override
  String get hrtWidgetPlaceholder =>
      'Open Mona om je eerste inname te registreren';
  @override
  String get hrtWidgetPreviewSample => '8 maanden op HRT';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 innames geregistreerd';
  @override
  String get supplyItem => 'Voorraaditem';
  @override
  String get needleDeadSpace => 'Dode ruimte van de naald';
  @override
  String get adminRoute => 'Toedieningsweg';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dosis per ${unit}';
  @override
  String get medicationTestosteroneEnanthate => 'Testosteron-enanthaat';
  @override
  String get medicationTestosteroneValerate => 'Testosteronvaleraat';
  @override
  String get medicationTestosteroneCypionate => 'Testosteroncypionaat';
  @override
  String get medicationTestosteroneUndecylate => 'Testosteronundecylaat';
  @override
  String get medicationTestosteroneBenzoate => 'Testosteronbenzoaat';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Testosteroncypionaat-suspensie';
  @override
  String get customSiteLabel => 'Aangepaste pleknaam';
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
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '${count} ${unit} over',
        other: '${count} ${unit} over',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '1 injectiespuit over',
        other: '${count} injectiespuiten over',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '1 doekje over',
        other: '${count} doekjes over',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '1 naald over',
        other: '${count} naalden over',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '1 handschoen over',
        other: '${count} handschoenen over',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'pil',
        other: 'pillen',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'pleister',
        other: 'pleisters',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'pomp',
        other: 'pompen',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'implantaat',
        other: 'implantaten',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'zetpil',
        other: 'zetpillen',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'spray',
        other: 'sprays',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: '1 inname gelogd',
        other: '${count} innames gelogd',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
        count,
        one: 'Nog 1 verband over',
        other: 'Nog ${count} verbanden over',
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
      'startOfDay' => 'Begin van de dag',
      'startOfDayDescription' => ({required Object time}) =>
          'Tijd voor ${time} teld voor de vorige dag',
      'chooseSchedule' => 'Kies een schema',
      'addSchedulesFirst' => 'Voeg eerst een schema toe.',
      'editIntake' => 'Intake bewerken',
      'date' => 'Datum',
      'amount' => 'Hoeveelheid',
      'takenAmount' => 'Genomen hoeveelheid',
      'wastedAmount' => 'Verloren hoeveelheid',
      'none' => 'Geen',
      'chooseItem' => 'Kies een item',
      'noItemsToAdd' => 'Geen items beschikbaar',
      'injectionSide' => 'Kant van injectie',
      'deleteIntake' => 'Deze intake verwijderen?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Neem ${scheduleName}',
      'takeIntake' => 'Neem intake',
      'intakeRecorded' => 'Intake opgenomen',
      'notes' => 'Notities',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Bloedwaardentesten',
      'empty_blood_tests' =>
        'Genomen bloedwaardentesten zullen hier komen te staan. Begin door op de Toevoegen knop te drukken!',
      'addBloodTest' => 'Voeg een bloedwaardentest toe',
      'editBloodTest' => 'Een bloedwaardentest bewerken',
      'newBloodTest' => 'Nieuwe bloedwaardentest',
      'deleteBloodTest' => 'Deze bloedwaardentest verwijderen?',
      'estradiolLevelLabel' => 'Oestradiol niveau',
      'testosteroneLevelLabel' => 'Testosteron niveau',
      'bloodTestDateLabel' => 'Test datum',
      'chartNowConcentration' => ({required Object value}) => 'Nu ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Geen middelen. Voeg een item toe om te beginnen.',
      'newItem' => 'Nieuw item',
      'totalAmount' => 'Totale hoeveelheid',
      'concentration' => 'Concentratie',
      'editItem' => 'Item bewerken',
      'usedAmount' => 'Gebruikte hoeveelheid',
      'deleteItem' => ({required Object name}) => '${name} verwijderen?',
      'allItemsFilter' => 'Alles',
      'medicationItemsFilter' => 'Medicatie',
      'genericItems' => 'Verbruiksmaterialen',
      'medicationItemType' => 'Medicatie',
      'genericItemType' => 'Verbruiksmaterialen',
      'supplyType' => 'Type',
      'syringe' => 'Injectiespuiten',
      'wipe' => 'Doekjes',
      'needle' => 'Naalden',
      'gloves' => 'Handschoenen',
      'bandage' => 'Pleisters/Verband',
      'add' => 'Toevoegen',
      'save' => 'Opslaan',
      'cancel' => 'Annuleren',
      'next' => 'Volgende',
      'delete' => 'Verwijderen',
      'deleteElement' => 'Dit item verwijderen?',
      'irreversibleAction' => 'Deze actie kan niet ongedaan worden gemaakt.',
      'name' => 'Naam',
      'molecule' => 'Molecule',
      'ester' => 'Ester',
      'estradiol' => 'Oestradiol',
      'progesterone' => 'Progesterone',
      'testosterone' => 'Testosteron',
      'nandrolone' => 'Nandrolon',
      'dihydrotestosterone' => 'Dihydrotestosteron',
      'spironolactone' => 'Spironolacton',
      'cyproteroneAcetate' => 'Cyproteronacetaat',
      'leuprorelinAcetate' => 'Leuprorelineacetaat',
      'bicalutamide' => 'Bicalutamide',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloxifene',
      'tamoxifen' => 'Tamoxifen',
      'finasteride' => 'Finasteride',
      'dutasteride' => 'Dutasteride',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazone',
      'enanthate' => 'Enanthaat',
      'valerate' => 'Valeraat',
      'cypionate' => 'Cypionaat',
      'undecylate' => 'Undecylaat',
      'benzoate' => 'Benzoaat',
      'cypionateSuspension' => 'Cypionaat-suspensie',
      'medicationEstradiolEnanthate' => 'Estradiol-enanthaat',
      'medicationEstradiolValerate' => 'Estradiolvaleraat',
      'medicationEstradiolCypionate' => 'Estradiolcypionaat',
      'medicationEstradiolUndecylate' => 'Estradiolundecylaat',
      'medicationEstradiolBenzoate' => 'Estradiolbenzoaat',
      'medicationEstradiolCypionateSuspension' =>
        'Estradiolcypionaat-suspensie',
      'injection' => 'Injectie',
      'oral' => 'Oraal',
      'sublingual' => 'Sublinguaal',
      'patch' => 'Pleister',
      'gel' => 'Gel',
      'implant' => 'Implantaat',
      'suppository' => 'Zetpil',
      'transdermalSpray' => 'Transdermale spray',
      'transdermalDrops' => 'Transdermale druppels',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'injectionSideLeft' => 'Links',
      'injectionSideRight' => 'Rechts',
      'placementLeft' => 'Linker kant',
      'placementRight' => 'Rechter kant',
      'placementLeftThigh' => 'Linkerdij',
      'placementRightThigh' => 'Rechterdij',
      'placementLeftArm' => 'Linkerarm',
      'placementRightArm' => 'Rechterarm',
      'placementLeftButtock' => 'Linkerbil',
      'placementRightButtock' => 'Rechterbil',
      'placementLeftAbdomen' => 'Linkerzijde van de buik',
      'placementRightAbdomen' => 'Rechterzijde van de buik',
      'injectionSites' => 'Injectieplekken',
      'injectionSitesDescription' => 'Beheer de plekken waar je wisselt',
      'addInjectionSite' => 'Plek toevoegen',
      'noInjectionSitesYet' => 'Nog geen plekken',
      'noInjectionAddOneToGetStarted' =>
        'Voeg hieronder plekken toe om te beginnen.',
      'placementSuggestionPerScheduleTitle' => 'Suggesteer per schema',
      'placementSuggestionPerScheduleDescription' =>
        'Baseer de suggestie voor de volgende plek alleen op de geschiedenis van dit schema.',
      'requiredField' => 'Verplicht veld',
      'mustBePositiveNumber' => 'Moet een positief nummer zijn',
      'mustBeBetween1And28' => 'Moet tussen 1 en 28 zijn',
      'invalidTotalAmount' => 'Ongeldige totaalhoeveelheid',
      'cannotExceedTotalCapacity' => 'Kan niet het totaal overschrijden',
      'lastTaken' => 'Laatst (in)genomen',
      'neverTakenYet' => 'Nog niet (in)genomen',
      'scheduleFrequencyInterval' => 'Interval',
      'anchorToLastIntake' =>
        'Opnieuw berekenen op basis van de laatste inname',
      'anchorToLastIntakeDescription' =>
        'Plan de volgende inname volgens de ingestelde interval sinds de vorige inname',
      'notificationMedicationReminderTitle' => (
              {required Object scheduleName}) =>
          'Tijd om ${scheduleName} in te nemen',
      'empty_intakes' => '(In)Genomen innames zullen hier getoond worden',
      'HrtCounterDescription' =>
        'Laat zien hoe lang je aan HRT zit en je totale innames',
      'HrtCounter' => 'Tijd op HRT',
      'hrtWidgetPlaceholder' => 'Open Mona om je eerste inname te registreren',
      'hrtWidgetPreviewSample' => '8 maanden op HRT',
      'hrtWidgetPreviewIntakeSample' => '16 innames geregistreerd',
      'supplyItem' => 'Voorraaditem',
      'needleDeadSpace' => 'Dode ruimte van de naald',
      'adminRoute' => 'Toedieningsweg',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dosis per ${unit}',
      'medicationTestosteroneEnanthate' => 'Testosteron-enanthaat',
      'medicationTestosteroneValerate' => 'Testosteronvaleraat',
      'medicationTestosteroneCypionate' => 'Testosteroncypionaat',
      'medicationTestosteroneUndecylate' => 'Testosteronundecylaat',
      'medicationTestosteroneBenzoate' => 'Testosteronbenzoaat',
      'medicationTestosteroneCypionateSuspension' =>
        'Testosteroncypionaat-suspensie',
      'customSiteLabel' => 'Aangepaste pleknaam',
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
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '${count} ${unit} over',
            other: '${count} ${unit} over',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '1 injectiespuit over',
            other: '${count} injectiespuiten over',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '1 doekje over',
            other: '${count} doekjes over',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '1 naald over',
            other: '${count} naalden over',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '1 handschoen over',
            other: '${count} handschoenen over',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'pil',
            other: 'pillen',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'pleister',
            other: 'pleisters',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'pomp',
            other: 'pompen',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'implantaat',
            other: 'implantaten',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'zetpil',
            other: 'zetpillen',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'spray',
            other: 'sprays',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: '1 inname gelogd',
            other: '${count} innames gelogd',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('nl'))(
            count,
            one: 'Nog 1 verband over',
            other: 'Nog ${count} verbanden over',
          ),
      _ => null,
    };
  }
}
