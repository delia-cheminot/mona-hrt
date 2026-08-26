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
  String get neverTakenYet => 'Aldrig tagits än';
  @override
  String get scheduleFrequencyDaily => 'Varje dag';
  @override
  String get scheduleFrequencyInterval => 'Intervall';
  @override
  String get scheduleFrequencyWeekly => 'Varje vecka';
  @override
  String get scheduleFrequencyMonthly => 'Varje månad';
  @override
  String get general => 'Allmänt';
  @override
  String get enableNotificationsDescription => 'Skicka påminnelser';
  @override
  String get anchorToLastIntake => 'Räkna om baserat på senaste intag';
  @override
  String get anchorToLastIntakeDescription =>
      'Schemalägger nästa intag ett helt intervall efter senaste gången du tog det';
  @override
  String get notificationsDisabledTitle => 'Aviseringar är inaktiverade';
  @override
  String get clickToOpenSettings => 'Tryck för att öppna inställningar';
  @override
  String get exactRemindersDisabled => 'Exakta påminnelsetider är inaktiverade';
  @override
  String get remindersDelayed =>
      'Påminnelser kan bli något försenade. Tryck för att öppna inställningar.';
  @override
  String get medicalSettings => 'Medicinska inställningar';
  @override
  String get theme => 'Tema';
  @override
  String get themeCustomizeColors => 'Anpassa appens färger';
  @override
  String get customThemeEnabled => 'Anpassat tema';
  @override
  String get themeGenerate => 'Generera';
  @override
  String get themeVariant => 'Variant';
  @override
  String get themeContrast => 'Kontrast';
  @override
  String get themeContrastStandard => 'Standard';
  @override
  String get themeContrastMedium => 'Medel';
  @override
  String get themeContrastHigh => 'Hög';
  @override
  String get autoUpdate => 'Automatisk uppdatering';
  @override
  String get autoUpdateDescription =>
      'Sök automatiskt efter nya uppdateringar när appen startas';
  @override
  String get checkForUpdates => 'Sök efter uppdateringar';
  @override
  String get checkForUpdatesDescription =>
      'Sök manuellt efter senaste versionen\nDetta kommer att ansluta dig till internet\n(Ingen data skickas)';
  @override
  String backupSavedTo({required Object path}) =>
      'Säkerhetskopia sparad i: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Export misslyckades: ${error}';
  @override
  String get importDataSubtitle => 'Återställ data från en JSON-säkerhetskopia';
  @override
  String get importDataOverwriteWarning =>
      'Detta kommer att skriva över all din nuvarande data med säkerhetskopian. Denna åtgärd kan inte ångras. Vill du fortsätta?';
  @override
  String get importConfirm => 'Importera';
  @override
  String get importSuccessfulTitle => 'Import lyckades';
  @override
  String get importRestartRequired =>
      'Starta om appen för att tillämpa den återställda datan.';
  @override
  String importFailed({required Object error}) =>
      'Import misslyckades: ${error}';
  @override
  String get updates => 'Uppdateringar';
  @override
  String get dataManagement => 'Datahantering';
  @override
  String get exportDataTitle => 'Exportera data';
  @override
  String get exportDataSubtitle => 'Spara din data till en JSON-fil';
  @override
  String get units => 'Enheter';
  @override
  String get updateNoCompatibleApk =>
      'Ingen kompatibel uppdatering hittades för din enhet.';
  @override
  String get updateCheckNetworkError =>
      'Det gick inte att söka efter uppdateringar just nu.';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Version ${latest} är tillgänglig! (Nuvarande: ${current})\n\nEn uppdatering som är kompatibel med din enhet är redo att installeras.';
  @override
  String get updateInstallPermissionRequired =>
      'Behörighet krävs för att installera uppdateringar.';
  @override
  String get updateDownloadingTitle => 'Laddar ner uppdatering...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Det gick inte att öppna installationsprogrammet: ${message}';
  @override
  String get updateDownloadFailed =>
      'Nedladdningen misslyckades. Kontrollera din anslutning.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Dags att ta ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Schemalagd till ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Schemalagd till ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Schemalagd till ${weekday}';
  @override
  String get addSchedule => 'Lägg till ett schema';
  @override
  String get addScheduleToGetStarted =>
      'Lägg till ett schema för att komma igång.';
  @override
  String get newSchedule => 'Nytt schema';
  @override
  String get every => 'Var';
  @override
  String get days => 'dagar';
  @override
  String get dayOfMonth => 'Dag i månaden';
  @override
  String get months => 'månader';
  @override
  String get startDate => 'Startdatum';
  @override
  String get pickATime => 'Välj en tid';
  @override
  String get addIntakeTime => 'Lägg till en tid';
  @override
  String get editScheduleInfo => 'Redigera schemainformation';
  @override
  String get scheduling => 'Schemaläggning';
  @override
  String get editSchedule => 'Redigera schema';
  @override
  String deleteSchedule({required Object name}) => 'Ta bort ${name}?';
  @override
  String get addNotification => 'Lägg till en avisering';
  @override
  String get empty_intakes => 'Tagna intag visas här';
  @override
  String get HrtCounter => 'Tid på HRT';
  @override
  String get HrtCounterDescription =>
      'Visar hur länge du varit på HRT och dina totala intag';
  @override
  String get hrtWidgetPlaceholder =>
      'Öppna Mona för att registrera ditt första intag';
  @override
  String get hrtWidgetPreviewSample => 'På HRT i 8 månader';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 intag registrerade';
  @override
  String get startOfDay => 'Dagens start';
  @override
  String startOfDayDescription({required Object time}) =>
      'Tid före ${time} räknas till föregående dag';
  @override
  String get chooseSchedule => 'Välj ett schema';
  @override
  String get addSchedulesFirst => 'Lägg till scheman först.';
  @override
  String get editIntake => 'Redigera intag';
  @override
  String get date => 'Datum';
  @override
  String get amount => 'Mängd';
  @override
  String get takenAmount => 'Tagen mängd';
  @override
  String get wastedAmount => 'Bortslösad mängd';
  @override
  String get none => 'Ingen';
  @override
  String get supplyItem => 'Förbrukningsartikel';
  @override
  String get chooseItem => 'Välj en artikel';
  @override
  String get noItemsToAdd => 'Inga artiklar tillgängliga';
  @override
  String get injectionSide => 'Injektionssida';
  @override
  String get deleteIntake => 'Ta bort detta intag?';
  @override
  String takeMedication({required Object scheduleName}) => 'Ta ${scheduleName}';
  @override
  String get takeIntake => 'Ta intag';
  @override
  String get intakeRecorded => 'Intag registrerat';
  @override
  String get needleDeadSpace => 'Nålens dödutrymme';
  @override
  String get notes => 'Anteckningar';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Blodprover';
  @override
  String get empty_blood_tests =>
      'Tagna blodprover visas här. Börja genom att använda Lägg till-knappen!';
  @override
  String get addBloodTest => 'Lägg till ett blodprov';
  @override
  String get editBloodTest => 'Redigera blodprov';
  @override
  String get newBloodTest => 'Nytt blodprov';
  @override
  String get deleteBloodTest => 'Ta bort detta blodprov?';
  @override
  String get estradiolLevelLabel => 'Östradiolnivå';
  @override
  String get testosteroneLevelLabel => 'Testosteronnivå';
  @override
  String get bloodTestDateLabel => 'Provdatum';
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
      'Inga förbrukningsvaror. Lägg till en artikel för att komma igång.';
  @override
  String get newItem => 'Ny artikel';
  @override
  String get adminRoute => 'Administreringsväg';
  @override
  String get totalAmount => 'Total mängd';
  @override
  String get concentration => 'Koncentration';
  @override
  String concentrationLabelPerUnit({required Object unit}) => 'Dos per ${unit}';
  @override
  String get editItem => 'Redigera artikel';
  @override
  String get usedAmount => 'Använd mängd';
  @override
  String deleteItem({required Object name}) => 'Ta bort ${name}?';
  @override
  String get allItemsFilter => 'Alla';
  @override
  String get medicationItemsFilter => 'Medicin';
  @override
  String get genericItems => 'Förbrukningsvaror';
  @override
  String get medicationItemType => 'Medicin';
  @override
  String get genericItemType => 'Förbrukningsvara';
  @override
  String get supplyType => 'Typ';
  @override
  String get syringe => 'Sprutor';
  @override
  String get wipe => 'Servetter';
  @override
  String get needle => 'Nålar';
  @override
  String get gloves => 'Handskar';
  @override
  String get bandage => 'Bandage';
  @override
  String get add => 'Lägg till';
  @override
  String get save => 'Spara';
  @override
  String get cancel => 'Avbryt';
  @override
  String get next => 'Nästa';
  @override
  String get delete => 'Ta bort';
  @override
  String get deleteElement => 'Ta bort denna post?';
  @override
  String get irreversibleAction => 'Denna åtgärd kan inte ångras.';
  @override
  String get name => 'Namn';
  @override
  String get molecule => 'Molekyl';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazon';
  @override
  String get enanthate => 'Enantat';
  @override
  String get valerate => 'Valerat';
  @override
  String get cypionate => 'Cypionat';
  @override
  String get undecylate => 'Undecylat';
  @override
  String get benzoate => 'Bensoat';
  @override
  String get cypionateSuspension => 'Cypionatsuspension';
  @override
  String get medicationEstradiolEnanthate => 'Östradiolenantat';
  @override
  String get medicationEstradiolValerate => 'Östradiolvalerat';
  @override
  String get medicationEstradiolCypionate => 'Östradiolcypionat';
  @override
  String get medicationEstradiolUndecylate => 'Östradiolundecylat';
  @override
  String get medicationEstradiolBenzoate => 'Östradiolbensoat';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Östradiolcypionatsuspension';
  @override
  String get medicationTestosteroneEnanthate => 'Testosteronenantat';
  @override
  String get medicationTestosteroneValerate => 'Testosteronvalerat';
  @override
  String get medicationTestosteroneCypionate => 'Testosteroncypionat';
  @override
  String get medicationTestosteroneUndecylate => 'Testosteronundecylat';
  @override
  String get medicationTestosteroneBenzoate => 'Testosteronbensoat';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Testosteroncypionatsuspension';
  @override
  String get injection => 'Injektion';
  @override
  String get oral => 'Oralt';
  @override
  String get sublingual => 'Sublingualt';
  @override
  String get patch => 'Plåster';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implantat';
  @override
  String get suppository => 'Suppositorium';
  @override
  String get transdermalSpray => 'Transdermal spray';
  @override
  String get transdermalDrops => 'Transdermala droppar';
  @override
  String get injectionSideLeft => 'Vänster';
  @override
  String get injectionSideRight => 'Höger';
  @override
  String get placementLeft => 'Vänster sida';
  @override
  String get placementRight => 'Höger sida';
  @override
  String get placementLeftThigh => 'Vänster lår';
  @override
  String get placementRightThigh => 'Höger lår';
  @override
  String get placementLeftArm => 'Vänster arm';
  @override
  String get placementRightArm => 'Höger arm';
  @override
  String get placementLeftButtock => 'Vänster skinka';
  @override
  String get placementRightButtock => 'Höger skinka';
  @override
  String get placementLeftAbdomen => 'Vänster buk';
  @override
  String get placementRightAbdomen => 'Höger buk';
  @override
  String get injectionSites => 'Injektionsställen';
  @override
  String get injectionSitesDescription => 'Hantera ställena du roterar mellan';
  @override
  String get addInjectionSite => 'Lägg till ställe';
  @override
  String get customSiteLabel => 'Anpassat ställenamn';
  @override
  String get noInjectionSitesYet => 'Inga ställen än';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Lägg till ett ställe nedan för att komma igång.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Föreslå per schema';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Basera förslaget på nästa ställe enbart på detta schemas historik.';
  @override
  String get requiredField => 'Obligatoriskt fält';
  @override
  String get mustBePositiveNumber => 'Måste vara ett positivt tal';
  @override
  String get mustBeBetween1And28 => 'Måste vara mellan 1 och 28';
  @override
  String get invalidTotalAmount => 'Ogiltig totalmängd';
  @override
  String get cannotExceedTotalCapacity => 'Kan inte överstiga total kapacitet';
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '${count} dag sedan',
        other: '${count} dagar sedan',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'om ${count} dag',
        other: 'om ${count} dagar',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'Varje dag',
        other: 'Var ${count}:e dag',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'Dag ${day}, varje månad',
        other: 'Dag ${day}, var ${count}:e månad',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '${count} skapat',
        other: '${count} skapade',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'På HRT i 1 dag',
        other: 'På HRT i ${count} dagar',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'På HRT i 1 vecka',
        other: 'På HRT i ${count} veckor',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'På HRT i 1 månad',
        other: 'På HRT i ${count} månader',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'På HRT i 1 år',
        other: 'På HRT i ${count} år',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '1 intag registrerat',
        other: '${count} intag registrerade',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '${count} ${unit} kvar',
        other: '${count} ${unit} kvar',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '1 spruta kvar',
        other: '${count} sprutor kvar',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '1 servett kvar',
        other: '${count} servetter kvar',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '1 nål kvar',
        other: '${count} nålar kvar',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '1 handske kvar',
        other: '${count} handskar kvar',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: '1 bandage kvar',
        other: '${count} bandage kvar',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'tablett',
        other: 'tabletter',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'plåster',
        other: 'plåster',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'pump',
        other: 'pumpar',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'implantat',
        other: 'implantat',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'suppositorium',
        other: 'suppositorier',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
        count,
        one: 'spray',
        other: 'sprayer',
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
      'neverTakenYet' => 'Aldrig tagits än',
      'scheduleFrequencyDaily' => 'Varje dag',
      'scheduleFrequencyInterval' => 'Intervall',
      'scheduleFrequencyWeekly' => 'Varje vecka',
      'scheduleFrequencyMonthly' => 'Varje månad',
      'general' => 'Allmänt',
      'enableNotificationsDescription' => 'Skicka påminnelser',
      'anchorToLastIntake' => 'Räkna om baserat på senaste intag',
      'anchorToLastIntakeDescription' =>
        'Schemalägger nästa intag ett helt intervall efter senaste gången du tog det',
      'notificationsDisabledTitle' => 'Aviseringar är inaktiverade',
      'clickToOpenSettings' => 'Tryck för att öppna inställningar',
      'exactRemindersDisabled' => 'Exakta påminnelsetider är inaktiverade',
      'remindersDelayed' =>
        'Påminnelser kan bli något försenade. Tryck för att öppna inställningar.',
      'medicalSettings' => 'Medicinska inställningar',
      'theme' => 'Tema',
      'themeCustomizeColors' => 'Anpassa appens färger',
      'customThemeEnabled' => 'Anpassat tema',
      'themeGenerate' => 'Generera',
      'themeVariant' => 'Variant',
      'themeContrast' => 'Kontrast',
      'themeContrastStandard' => 'Standard',
      'themeContrastMedium' => 'Medel',
      'themeContrastHigh' => 'Hög',
      'autoUpdate' => 'Automatisk uppdatering',
      'autoUpdateDescription' =>
        'Sök automatiskt efter nya uppdateringar när appen startas',
      'checkForUpdates' => 'Sök efter uppdateringar',
      'checkForUpdatesDescription' =>
        'Sök manuellt efter senaste versionen\nDetta kommer att ansluta dig till internet\n(Ingen data skickas)',
      'backupSavedTo' => ({required Object path}) =>
          'Säkerhetskopia sparad i: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Export misslyckades: ${error}',
      'importDataSubtitle' => 'Återställ data från en JSON-säkerhetskopia',
      'importDataOverwriteWarning' =>
        'Detta kommer att skriva över all din nuvarande data med säkerhetskopian. Denna åtgärd kan inte ångras. Vill du fortsätta?',
      'importConfirm' => 'Importera',
      'importSuccessfulTitle' => 'Import lyckades',
      'importRestartRequired' =>
        'Starta om appen för att tillämpa den återställda datan.',
      'importFailed' => ({required Object error}) =>
          'Import misslyckades: ${error}',
      'updates' => 'Uppdateringar',
      'dataManagement' => 'Datahantering',
      'exportDataTitle' => 'Exportera data',
      'exportDataSubtitle' => 'Spara din data till en JSON-fil',
      'units' => 'Enheter',
      'updateNoCompatibleApk' =>
        'Ingen kompatibel uppdatering hittades för din enhet.',
      'updateCheckNetworkError' =>
        'Det gick inte att söka efter uppdateringar just nu.',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Version ${latest} är tillgänglig! (Nuvarande: ${current})\n\nEn uppdatering som är kompatibel med din enhet är redo att installeras.',
      'updateInstallPermissionRequired' =>
        'Behörighet krävs för att installera uppdateringar.',
      'updateDownloadingTitle' => 'Laddar ner uppdatering...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Det gick inte att öppna installationsprogrammet: ${message}',
      'updateDownloadFailed' =>
        'Nedladdningen misslyckades. Kontrollera din anslutning.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Dags att ta ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Schemalagd till ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Schemalagd till ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Schemalagd till ${weekday}',
      'addSchedule' => 'Lägg till ett schema',
      'addScheduleToGetStarted' => 'Lägg till ett schema för att komma igång.',
      'newSchedule' => 'Nytt schema',
      'every' => 'Var',
      'days' => 'dagar',
      'dayOfMonth' => 'Dag i månaden',
      'months' => 'månader',
      'startDate' => 'Startdatum',
      'pickATime' => 'Välj en tid',
      'addIntakeTime' => 'Lägg till en tid',
      'editScheduleInfo' => 'Redigera schemainformation',
      'scheduling' => 'Schemaläggning',
      'editSchedule' => 'Redigera schema',
      'deleteSchedule' => ({required Object name}) => 'Ta bort ${name}?',
      'addNotification' => 'Lägg till en avisering',
      'empty_intakes' => 'Tagna intag visas här',
      'HrtCounter' => 'Tid på HRT',
      'HrtCounterDescription' =>
        'Visar hur länge du varit på HRT och dina totala intag',
      'hrtWidgetPlaceholder' =>
        'Öppna Mona för att registrera ditt första intag',
      'hrtWidgetPreviewSample' => 'På HRT i 8 månader',
      'hrtWidgetPreviewIntakeSample' => '16 intag registrerade',
      'startOfDay' => 'Dagens start',
      'startOfDayDescription' => ({required Object time}) =>
          'Tid före ${time} räknas till föregående dag',
      'chooseSchedule' => 'Välj ett schema',
      'addSchedulesFirst' => 'Lägg till scheman först.',
      'editIntake' => 'Redigera intag',
      'date' => 'Datum',
      'amount' => 'Mängd',
      'takenAmount' => 'Tagen mängd',
      'wastedAmount' => 'Bortslösad mängd',
      'none' => 'Ingen',
      'supplyItem' => 'Förbrukningsartikel',
      'chooseItem' => 'Välj en artikel',
      'noItemsToAdd' => 'Inga artiklar tillgängliga',
      'injectionSide' => 'Injektionssida',
      'deleteIntake' => 'Ta bort detta intag?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Ta ${scheduleName}',
      'takeIntake' => 'Ta intag',
      'intakeRecorded' => 'Intag registrerat',
      'needleDeadSpace' => 'Nålens dödutrymme',
      'notes' => 'Anteckningar',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Blodprover',
      'empty_blood_tests' =>
        'Tagna blodprover visas här. Börja genom att använda Lägg till-knappen!',
      'addBloodTest' => 'Lägg till ett blodprov',
      'editBloodTest' => 'Redigera blodprov',
      'newBloodTest' => 'Nytt blodprov',
      'deleteBloodTest' => 'Ta bort detta blodprov?',
      'estradiolLevelLabel' => 'Östradiolnivå',
      'testosteroneLevelLabel' => 'Testosteronnivå',
      'bloodTestDateLabel' => 'Provdatum',
      'chartNowConcentration' => ({required Object value}) => 'Nu ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' =>
        'Inga förbrukningsvaror. Lägg till en artikel för att komma igång.',
      'newItem' => 'Ny artikel',
      'adminRoute' => 'Administreringsväg',
      'totalAmount' => 'Total mängd',
      'concentration' => 'Koncentration',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dos per ${unit}',
      'editItem' => 'Redigera artikel',
      'usedAmount' => 'Använd mängd',
      'deleteItem' => ({required Object name}) => 'Ta bort ${name}?',
      'allItemsFilter' => 'Alla',
      'medicationItemsFilter' => 'Medicin',
      'genericItems' => 'Förbrukningsvaror',
      'medicationItemType' => 'Medicin',
      'genericItemType' => 'Förbrukningsvara',
      'supplyType' => 'Typ',
      'syringe' => 'Sprutor',
      'wipe' => 'Servetter',
      'needle' => 'Nålar',
      'gloves' => 'Handskar',
      'bandage' => 'Bandage',
      'add' => 'Lägg till',
      'save' => 'Spara',
      'cancel' => 'Avbryt',
      'next' => 'Nästa',
      'delete' => 'Ta bort',
      'deleteElement' => 'Ta bort denna post?',
      'irreversibleAction' => 'Denna åtgärd kan inte ångras.',
      'name' => 'Namn',
      'molecule' => 'Molekyl',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazon',
      'enanthate' => 'Enantat',
      'valerate' => 'Valerat',
      'cypionate' => 'Cypionat',
      'undecylate' => 'Undecylat',
      'benzoate' => 'Bensoat',
      'cypionateSuspension' => 'Cypionatsuspension',
      'medicationEstradiolEnanthate' => 'Östradiolenantat',
      'medicationEstradiolValerate' => 'Östradiolvalerat',
      'medicationEstradiolCypionate' => 'Östradiolcypionat',
      'medicationEstradiolUndecylate' => 'Östradiolundecylat',
      'medicationEstradiolBenzoate' => 'Östradiolbensoat',
      'medicationEstradiolCypionateSuspension' => 'Östradiolcypionatsuspension',
      'medicationTestosteroneEnanthate' => 'Testosteronenantat',
      'medicationTestosteroneValerate' => 'Testosteronvalerat',
      'medicationTestosteroneCypionate' => 'Testosteroncypionat',
      'medicationTestosteroneUndecylate' => 'Testosteronundecylat',
      'medicationTestosteroneBenzoate' => 'Testosteronbensoat',
      'medicationTestosteroneCypionateSuspension' =>
        'Testosteroncypionatsuspension',
      'injection' => 'Injektion',
      'oral' => 'Oralt',
      'sublingual' => 'Sublingualt',
      'patch' => 'Plåster',
      'gel' => 'Gel',
      'implant' => 'Implantat',
      'suppository' => 'Suppositorium',
      'transdermalSpray' => 'Transdermal spray',
      'transdermalDrops' => 'Transdermala droppar',
      'injectionSideLeft' => 'Vänster',
      'injectionSideRight' => 'Höger',
      'placementLeft' => 'Vänster sida',
      'placementRight' => 'Höger sida',
      'placementLeftThigh' => 'Vänster lår',
      'placementRightThigh' => 'Höger lår',
      'placementLeftArm' => 'Vänster arm',
      'placementRightArm' => 'Höger arm',
      'placementLeftButtock' => 'Vänster skinka',
      'placementRightButtock' => 'Höger skinka',
      'placementLeftAbdomen' => 'Vänster buk',
      'placementRightAbdomen' => 'Höger buk',
      'injectionSites' => 'Injektionsställen',
      'injectionSitesDescription' => 'Hantera ställena du roterar mellan',
      'addInjectionSite' => 'Lägg till ställe',
      'customSiteLabel' => 'Anpassat ställenamn',
      'noInjectionSitesYet' => 'Inga ställen än',
      'noInjectionAddOneToGetStarted' =>
        'Lägg till ett ställe nedan för att komma igång.',
      'placementSuggestionPerScheduleTitle' => 'Föreslå per schema',
      'placementSuggestionPerScheduleDescription' =>
        'Basera förslaget på nästa ställe enbart på detta schemas historik.',
      'requiredField' => 'Obligatoriskt fält',
      'mustBePositiveNumber' => 'Måste vara ett positivt tal',
      'mustBeBetween1And28' => 'Måste vara mellan 1 och 28',
      'invalidTotalAmount' => 'Ogiltig totalmängd',
      'cannotExceedTotalCapacity' => 'Kan inte överstiga total kapacitet',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '${count} dag sedan',
            other: '${count} dagar sedan',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'om ${count} dag',
            other: 'om ${count} dagar',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'Varje dag',
            other: 'Var ${count}:e dag',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'Dag ${day}, varje månad',
            other: 'Dag ${day}, var ${count}:e månad',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '${count} skapat',
            other: '${count} skapade',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'På HRT i 1 dag',
            other: 'På HRT i ${count} dagar',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'På HRT i 1 vecka',
            other: 'På HRT i ${count} veckor',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'På HRT i 1 månad',
            other: 'På HRT i ${count} månader',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'På HRT i 1 år',
            other: 'På HRT i ${count} år',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '1 intag registrerat',
            other: '${count} intag registrerade',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '${count} ${unit} kvar',
            other: '${count} ${unit} kvar',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '1 spruta kvar',
            other: '${count} sprutor kvar',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '1 servett kvar',
            other: '${count} servetter kvar',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '1 nål kvar',
            other: '${count} nålar kvar',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '1 handske kvar',
            other: '${count} handskar kvar',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: '1 bandage kvar',
            other: '${count} bandage kvar',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'tablett',
            other: 'tabletter',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'plåster',
            other: 'plåster',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'pump',
            other: 'pumpar',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'implantat',
            other: 'implantat',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'suppositorium',
            other: 'suppositorier',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sv'))(
            count,
            one: 'spray',
            other: 'sprayer',
          ),
      _ => null,
    };
  }
}
