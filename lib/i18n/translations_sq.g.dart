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
class TranslationsSq extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSq(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.sq,
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

  /// Metadata for the translations of <sq>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsSq _root = this; // ignore: unused_field

  @override
  TranslationsSq $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsSq(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Marrje';
  @override
  String get nav_levels => 'Nivele';
  @override
  String get nav_supplies => 'Furnizime';
  @override
  String get takeAnIntake => 'Regjistro një marrje';
  @override
  String get addAnItem => 'Shto një artikull';
  @override
  String get empty_home => 'Fillo duke shtuar një orar te Cilësimet';
  @override
  String get allDone => 'Gjithçka u krye!';
  @override
  String get noIntakesDue => 'Nuk ka marrje për sot';
  @override
  String get upcoming => 'Të ardhshme';
  @override
  String get taken => 'Të marra';
  @override
  String get yesterday => 'dje';
  @override
  String get tomorrow => 'nesër';
  @override
  String get lastTaken => 'Marrë së fundmi';
  @override
  String get neverTakenYet => 'Ende e pamarrë';
  @override
  String get scheduleFrequencyInterval => 'Interval';
  @override
  String get scheduleFrequencyWeekly => 'Javore';
  @override
  String get scheduleFrequencyMonthly => 'Mujore';
  @override
  String get asNeeded => 'Sipas nevojës';
  @override
  String get scheduleFrequencyDaily => 'Ditore';
  @override
  String get scheduleFrequencyDailyDescription =>
      'Çdo ditë, në orare të caktuara';
  @override
  String get scheduleFrequencyIntervalDescription => 'Çdo disa ditë';
  @override
  String get scheduleFrequencyWeeklyDescription => 'Ditë të caktuara të javës';
  @override
  String get scheduleFrequencyMonthlyDescription => 'Të njëjtën ditë çdo muaj';
  @override
  String get scheduleFrequencyAsNeeded => 'Sipas nevojës';
  @override
  String get scheduleFrequencyAsNeededDescription => 'Pa orar të caktuar';
  @override
  String get newUpdateAvailable => 'Një përditësim i ri është i disponueshëm!';
  @override
  String get goToSettings => 'Shko te Cilësimet';
  @override
  String get settingsTitle => 'Cilësimet';
  @override
  String get notifications => 'Njoftime';
  @override
  String get schedulesAndNotifications => 'Orare & njoftime';
  @override
  String get general => 'Të përgjithshme';
  @override
  String get schedules => 'Orare';
  @override
  String get noSchedules => 'Nuk ka orare';
  @override
  String get language => 'Gjuha';
  @override
  String get languageFollowDevice => 'Ndiq gjuhën e pajisjes';
  @override
  String get selectLanguage => 'Zgjidh gjuhën';
  @override
  String get enableNotifications => 'Aktivizo njoftimet';
  @override
  String get enableNotificationsDescription => 'Dërgo kujtues';
  @override
  String get anchorToLastIntake => 'Rillogarit sipas marrjes së fundit';
  @override
  String get anchorToLastIntakeDescription =>
      'Planifikon marrjen e radhës një interval të plotë pasi e ke marrë herën e fundit';
  @override
  String get notificationsDisabledTitle => 'Njoftimet janë të çaktivizuara';
  @override
  String get clickToOpenSettings => 'Kliko për të hapur cilësimet';
  @override
  String get exactRemindersDisabled =>
      'Oraret e sakta të kujtuesve janë të çaktivizuara';
  @override
  String get remindersDelayed =>
      'Kujtuesit mund të vonohen paksa. Trokit për të hapur cilësimet.';
  @override
  String get medicalSettings => 'Cilësime mjekësore';
  @override
  String get theme => 'Tema';
  @override
  String get themeCustomizeColors => 'Personalizo ngjyrat e aplikacionit';
  @override
  String get customThemeEnabled => 'Temë e personalizuar';
  @override
  String get themeGenerate => 'Gjenero';
  @override
  String get themeVariant => 'Varianti';
  @override
  String get themeContrast => 'Kontrasti';
  @override
  String get themeContrastStandard => 'Standard';
  @override
  String get themeContrastMedium => 'Mesatar';
  @override
  String get themeContrastHigh => 'I lartë';
  @override
  String get autoUpdate => 'Përditësim automatik';
  @override
  String get autoUpdateDescription =>
      'Kontrollo automatikisht për përditësime të reja kur niset aplikacioni';
  @override
  String get checkForUpdates => 'Kontrollo për përditësime';
  @override
  String get checkForUpdatesDescription =>
      'Kontrollo manualisht për versionin më të fundit\nKjo do të të lidhë me internetin\n(Nuk do të dërgohen të dhëna)';
  @override
  String appVersion({required Object version}) => 'Mona versioni ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Kopja rezervë u ruajt te: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Eksportimi dështoi: ${error}';
  @override
  String get importDataTitle => 'Importo të dhënat';
  @override
  String get importDataSubtitle =>
      'Rikthe të dhënat nga një kopje rezervë JSON';
  @override
  String get importDataOverwriteWarning =>
      'Kjo do të mbishkruajë të gjitha të dhënat e tua aktuale me kopjen rezervë. Ky veprim nuk mund të zhbëhet. Dëshiron të vazhdosh?';
  @override
  String get importConfirm => 'Importo';
  @override
  String get importSuccessfulTitle => 'Importimi u krye me sukses';
  @override
  String get importRestartRequired =>
      'Të lutem rinis aplikacionin për të zbatuar të dhënat e rikthyera.';
  @override
  String get closeApp => 'Mbyll aplikacionin';
  @override
  String importFailed({required Object error}) => 'Importimi dështoi: ${error}';
  @override
  String get updates => 'Përditësime';
  @override
  String get dataManagement => 'Menaxhimi i të dhënave';
  @override
  String get exportDataTitle => 'Eksporto të dhënat';
  @override
  String get exportDataSubtitle => 'Ruaj të dhënat e tua në një skedar JSON';
  @override
  String get units => 'Njësi';
  @override
  String get updateNoCompatibleApk =>
      'Nuk u gjet asnjë përditësim i pajtueshëm për pajisjen tënde.';
  @override
  String get updateAppUpToDate => 'Aplikacioni yt është i përditësuar!';
  @override
  String get updateCheckNetworkError =>
      'Nuk u kontrollua dot për përditësime tani.';
  @override
  String get updateDialogTitle => 'Përditësim i disponueshëm';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Versioni ${latest} është i disponueshëm! (Aktual: ${current})\n\nNjë përditësim i pajtueshëm me pajisjen tënde është gati për t\'u instaluar.';
  @override
  String get updateDownloadAndInstall => 'Shkarko & instalo';
  @override
  String get updateInstallPermissionRequired =>
      'Kërkohet leje për të instaluar përditësimet.';
  @override
  String get updateDownloadingTitle => 'Po shkarkohet përditësimi...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Hapja e instaluesit dështoi: ${message}';
  @override
  String get updateDownloadFailed =>
      'Shkarkimi dështoi. Të lutem kontrollo lidhjen tënde.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Është koha të marrësh ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Planifikuar për ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Planifikuar për ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Planifikuar për ${weekday}';
  @override
  String get addSchedule => 'Shto një orar';
  @override
  String get addScheduleToGetStarted => 'Shto një orar për të filluar.';
  @override
  String get newSchedule => 'Orar i ri';
  @override
  String get every => 'Çdo';
  @override
  String get days => 'ditë';
  @override
  String get dayOfMonth => 'Dita e muajit';
  @override
  String get months => 'muaj';
  @override
  String get startDate => 'Data e fillimit';
  @override
  String get pickATime => 'Zgjidh një orë';
  @override
  String get addIntakeTime => 'Shto një orë';
  @override
  String get editScheduleInfo => 'Modifiko informacionin e orarit';
  @override
  String get scheduling => 'Planifikimi';
  @override
  String get editSchedule => 'Modifiko orarin';
  @override
  String deleteSchedule({required Object name}) => 'Të fshihet ${name}?';
  @override
  String get addNotification => 'Shto një njoftim';
  @override
  String get empty_intakes => 'Marrjet e regjistruara do të shfaqen këtu';
  @override
  String get HrtCounter => 'Koha në HRT';
  @override
  String get HrtCounterDescription =>
      'Shfaq prej sa kohësh je në HRT dhe marrjet e tua gjithsej';
  @override
  String get hrtWidgetPlaceholder =>
      'Hap Mona-n për të regjistruar marrjen tënde të parë';
  @override
  String get hrtWidgetPreviewSample => 'Në HRT prej 8 muajsh';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 marrje të regjistruara';
  @override
  String get startOfDay => 'Fillimi i ditës';
  @override
  String startOfDayDescription({required Object time}) =>
      'Koha përpara ${time} llogaritet për ditën e mëparshme';
  @override
  String get chooseSchedule => 'Zgjidh një orar';
  @override
  String get addSchedulesFirst => 'Shto fillimisht oraret.';
  @override
  String get editIntake => 'Modifiko marrjen';
  @override
  String get date => 'Data';
  @override
  String get amount => 'Sasia';
  @override
  String get takenAmount => 'Sasia e marrë';
  @override
  String get wastedAmount => 'Sasia e humbur';
  @override
  String get none => 'Asnjë';
  @override
  String get supplyItem => 'Artikull furnizimi';
  @override
  String get chooseItem => 'Zgjidh një artikull';
  @override
  String get noItemsToAdd => 'Nuk ka artikuj të disponueshëm';
  @override
  String get injectionSide => 'Ana e injektimit';
  @override
  String get deleteIntake => 'Të fshihet kjo marrje?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Merr ${scheduleName}';
  @override
  String get takeIntake => 'Regjistro marrjen';
  @override
  String get intakeRecorded => 'Marrja u regjistrua';
  @override
  String get needleDeadSpace => 'Hapësira e vdekur e gjilpërës';
  @override
  String get notes => 'Shënime';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Analiza gjaku';
  @override
  String get empty_blood_tests =>
      'Analizat e kryera të gjakut do të shfaqen këtu. Fillo duke përdorur butonin Shto!';
  @override
  String get addBloodTest => 'Shto një analizë gjaku';
  @override
  String get editBloodTest => 'Modifiko analizën e gjakut';
  @override
  String get newBloodTest => 'Analizë e re gjaku';
  @override
  String get deleteBloodTest => 'Të fshihet kjo analizë gjaku?';
  @override
  String get estradiolLevelLabel => 'Niveli i estradiolit';
  @override
  String get testosteroneLevelLabel => 'Niveli i testosteronit';
  @override
  String get bloodTestDateLabel => 'Data e analizës';
  @override
  String chartNowConcentration({required Object value}) => 'Tani ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Nuk ka furnizime. Shto një artikull për të filluar.';
  @override
  String get newItem => 'Artikull i ri';
  @override
  String get adminRoute => 'Rruga e administrimit';
  @override
  String get totalAmount => 'Sasia totale';
  @override
  String get concentration => 'Përqendrimi';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Doza për ${unit}';
  @override
  String get editItem => 'Modifiko artikullin';
  @override
  String get usedAmount => 'Sasia e përdorur';
  @override
  String deleteItem({required Object name}) => 'Të fshihet ${name}?';
  @override
  String get allItemsFilter => 'Të gjitha';
  @override
  String get medicationItemsFilter => 'Medikamente';
  @override
  String get genericItems => 'Materiale harxhuese';
  @override
  String get medicationItemType => 'Medikament';
  @override
  String get genericItemType => 'Material harxhues';
  @override
  String get supplyType => 'Lloji';
  @override
  String get syringe => 'Shiringa';
  @override
  String get wipe => 'Peceta';
  @override
  String get needle => 'Gjilpëra';
  @override
  String get gloves => 'Doreza';
  @override
  String get bandage => 'Fasha';
  @override
  String get add => 'Shto';
  @override
  String get save => 'Ruaj';
  @override
  String get cancel => 'Anulo';
  @override
  String get next => 'Tjetër';
  @override
  String get delete => 'Fshi';
  @override
  String get deleteElement => 'Të fshihet ky artikull?';
  @override
  String get irreversibleAction => 'Ky veprim nuk mund të zhbëhet.';
  @override
  String get name => 'Emri';
  @override
  String get molecule => 'Molekula';
  @override
  String get ester => 'Esteri';
  @override
  String get estradiol => 'Estradiol';
  @override
  String get progesterone => 'Progesteron';
  @override
  String get testosterone => 'Testosteron';
  @override
  String get nandrolone => 'Nandrolon';
  @override
  String get dihydrotestosterone => 'Dihidrotestosteron';
  @override
  String get spironolactone => 'Spironolakton';
  @override
  String get cyproteroneAcetate => 'Acetat ciproteroni';
  @override
  String get leuprorelinAcetate => 'Acetat leuprorelini';
  @override
  String get bicalutamide => 'Bikalutamid';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloksifen';
  @override
  String get tamoxifen => 'Tamoksifen';
  @override
  String get finasteride => 'Finasterid';
  @override
  String get dutasteride => 'Dutasterid';
  @override
  String get minoxidil => 'Minoksidil';
  @override
  String get pioglitazone => 'Pioglitazon';
  @override
  String get enanthate => 'Enantat';
  @override
  String get valerate => 'Valerat';
  @override
  String get cypionate => 'Cipionat';
  @override
  String get undecylate => 'Undecilat';
  @override
  String get benzoate => 'Benzoat';
  @override
  String get cypionateSuspension => 'Suspension cipionati';
  @override
  String get medicationEstradiolEnanthate => 'Estradiol enantat';
  @override
  String get medicationEstradiolValerate => 'Estradiol valerat';
  @override
  String get medicationEstradiolCypionate => 'Estradiol cipionat';
  @override
  String get medicationEstradiolUndecylate => 'Estradiol undecilat';
  @override
  String get medicationEstradiolBenzoate => 'Estradiol benzoat';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Suspension estradiol cipionati';
  @override
  String get medicationTestosteroneEnanthate => 'Testosteron enantat';
  @override
  String get medicationTestosteroneValerate => 'Testosteron valerat';
  @override
  String get medicationTestosteroneCypionate => 'Testosteron cipionat';
  @override
  String get medicationTestosteroneUndecylate => 'Testosteron undecilat';
  @override
  String get medicationTestosteroneBenzoate => 'Testosteron benzoat';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Suspension testosteron cipionati';
  @override
  String get injection => 'Injeksion';
  @override
  String get oral => 'Oral';
  @override
  String get sublingual => 'Nëngjuhësor';
  @override
  String get patch => 'Flaster';
  @override
  String get gel => 'Xhel';
  @override
  String get implant => 'Implant';
  @override
  String get suppository => 'Supozitor';
  @override
  String get transdermalSpray => 'Spraj transdermal';
  @override
  String get transdermalDrops => 'Pika transdermale';
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
  String get unitNgPerMl => 'ng/mL';
  @override
  String get injectionSideLeft => 'Majtas';
  @override
  String get injectionSideRight => 'Djathtas';
  @override
  String get placementLeft => 'Ana e majtë';
  @override
  String get placementRight => 'Ana e djathtë';
  @override
  String get placementLeftThigh => 'Kofsha e majtë';
  @override
  String get placementRightThigh => 'Kofsha e djathtë';
  @override
  String get placementLeftArm => 'Krahu i majtë';
  @override
  String get placementRightArm => 'Krahu i djathtë';
  @override
  String get placementLeftButtock => 'Vithja e majtë';
  @override
  String get placementRightButtock => 'Vithja e djathtë';
  @override
  String get placementLeftAbdomen => 'Barku i majtë';
  @override
  String get placementRightAbdomen => 'Barku i djathtë';
  @override
  String get injectionSites => 'Vendet e injektimit';
  @override
  String get injectionSitesDescription =>
      'Menaxho vendet ndërmjet të cilave alternon';
  @override
  String get addInjectionSite => 'Shto vend';
  @override
  String get customSiteLabel => 'Emër i personalizuar vendi';
  @override
  String get noInjectionSitesYet => 'Ende asnjë vend';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Shto një vend më poshtë për të filluar.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Sugjero sipas orarit';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Baza sugjerimin e vendit të radhës vetëm te historiku i këtij orari.';
  @override
  String get requiredField => 'Fushë e detyrueshme';
  @override
  String get mustBePositiveNumber => 'Duhet të jetë numër pozitiv';
  @override
  String get mustBeBetween1And28 => 'Duhet të jetë midis 1 dhe 28';
  @override
  String get invalidTotalAmount => 'Sasi totale e pavlefshme';
  @override
  String get cannotExceedTotalCapacity =>
      'Nuk mund të tejkalojë kapacitetin total';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '${count} ditë më parë',
        other: '${count} ditë më parë',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'pas ${count} dite',
        other: 'pas ${count} ditësh',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Çdo ditë',
        other: 'Çdo ${count} ditë',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Ditën ${day}, çdo muaj',
        other: 'Ditën ${day}, çdo ${count} muaj',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '${count} i krijuar',
        other: '${count} të krijuara',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Në HRT prej 1 dite',
        other: 'Në HRT prej ${count} ditësh',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Në HRT prej 1 jave',
        other: 'Në HRT prej ${count} javësh',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Në HRT prej 1 muaji',
        other: 'Në HRT prej ${count} muajsh',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Në HRT prej 1 viti',
        other: 'Në HRT prej ${count} vitesh',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '1 marrje e regjistruar',
        other: '${count} marrje të regjistruara',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'Mbetet ${count} ${unit}',
        other: 'Mbeten ${count} ${unit}',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '1 shiringë e mbetur',
        other: '${count} shiringa të mbetura',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '1 pecetë e mbetur',
        other: '${count} peceta të mbetura',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '1 gjilpërë e mbetur',
        other: '${count} gjilpëra të mbetura',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '1 dorezë e mbetur',
        other: '${count} doreza të mbetura',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: '1 fashë e mbetur',
        other: '${count} fasha të mbetura',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'tabletë',
        other: 'tableta',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'flaster',
        other: 'flastera',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'pompë',
        other: 'pompa',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'implant',
        other: 'implante',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'supozitor',
        other: 'supozitorë',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
        count,
        one: 'spraj',
        other: 'spraje',
      );
}

/// The flat map containing all translations for locale <sq>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsSq {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Marrje',
      'nav_levels' => 'Nivele',
      'nav_supplies' => 'Furnizime',
      'takeAnIntake' => 'Regjistro një marrje',
      'addAnItem' => 'Shto një artikull',
      'empty_home' => 'Fillo duke shtuar një orar te Cilësimet',
      'allDone' => 'Gjithçka u krye!',
      'noIntakesDue' => 'Nuk ka marrje për sot',
      'upcoming' => 'Të ardhshme',
      'taken' => 'Të marra',
      'yesterday' => 'dje',
      'tomorrow' => 'nesër',
      'lastTaken' => 'Marrë së fundmi',
      'neverTakenYet' => 'Ende e pamarrë',
      'scheduleFrequencyInterval' => 'Interval',
      'scheduleFrequencyWeekly' => 'Javore',
      'scheduleFrequencyMonthly' => 'Mujore',
      'asNeeded' => 'Sipas nevojës',
      'scheduleFrequencyDaily' => 'Ditore',
      'scheduleFrequencyDailyDescription' => 'Çdo ditë, në orare të caktuara',
      'scheduleFrequencyIntervalDescription' => 'Çdo disa ditë',
      'scheduleFrequencyWeeklyDescription' => 'Ditë të caktuara të javës',
      'scheduleFrequencyMonthlyDescription' => 'Të njëjtën ditë çdo muaj',
      'scheduleFrequencyAsNeeded' => 'Sipas nevojës',
      'scheduleFrequencyAsNeededDescription' => 'Pa orar të caktuar',
      'newUpdateAvailable' => 'Një përditësim i ri është i disponueshëm!',
      'goToSettings' => 'Shko te Cilësimet',
      'settingsTitle' => 'Cilësimet',
      'notifications' => 'Njoftime',
      'schedulesAndNotifications' => 'Orare & njoftime',
      'general' => 'Të përgjithshme',
      'schedules' => 'Orare',
      'noSchedules' => 'Nuk ka orare',
      'language' => 'Gjuha',
      'languageFollowDevice' => 'Ndiq gjuhën e pajisjes',
      'selectLanguage' => 'Zgjidh gjuhën',
      'enableNotifications' => 'Aktivizo njoftimet',
      'enableNotificationsDescription' => 'Dërgo kujtues',
      'anchorToLastIntake' => 'Rillogarit sipas marrjes së fundit',
      'anchorToLastIntakeDescription' =>
        'Planifikon marrjen e radhës një interval të plotë pasi e ke marrë herën e fundit',
      'notificationsDisabledTitle' => 'Njoftimet janë të çaktivizuara',
      'clickToOpenSettings' => 'Kliko për të hapur cilësimet',
      'exactRemindersDisabled' =>
        'Oraret e sakta të kujtuesve janë të çaktivizuara',
      'remindersDelayed' =>
        'Kujtuesit mund të vonohen paksa. Trokit për të hapur cilësimet.',
      'medicalSettings' => 'Cilësime mjekësore',
      'theme' => 'Tema',
      'themeCustomizeColors' => 'Personalizo ngjyrat e aplikacionit',
      'customThemeEnabled' => 'Temë e personalizuar',
      'themeGenerate' => 'Gjenero',
      'themeVariant' => 'Varianti',
      'themeContrast' => 'Kontrasti',
      'themeContrastStandard' => 'Standard',
      'themeContrastMedium' => 'Mesatar',
      'themeContrastHigh' => 'I lartë',
      'autoUpdate' => 'Përditësim automatik',
      'autoUpdateDescription' =>
        'Kontrollo automatikisht për përditësime të reja kur niset aplikacioni',
      'checkForUpdates' => 'Kontrollo për përditësime',
      'checkForUpdatesDescription' =>
        'Kontrollo manualisht për versionin më të fundit\nKjo do të të lidhë me internetin\n(Nuk do të dërgohen të dhëna)',
      'appVersion' => ({required Object version}) => 'Mona versioni ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Kopja rezervë u ruajt te: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Eksportimi dështoi: ${error}',
      'importDataTitle' => 'Importo të dhënat',
      'importDataSubtitle' => 'Rikthe të dhënat nga një kopje rezervë JSON',
      'importDataOverwriteWarning' =>
        'Kjo do të mbishkruajë të gjitha të dhënat e tua aktuale me kopjen rezervë. Ky veprim nuk mund të zhbëhet. Dëshiron të vazhdosh?',
      'importConfirm' => 'Importo',
      'importSuccessfulTitle' => 'Importimi u krye me sukses',
      'importRestartRequired' =>
        'Të lutem rinis aplikacionin për të zbatuar të dhënat e rikthyera.',
      'closeApp' => 'Mbyll aplikacionin',
      'importFailed' => ({required Object error}) =>
          'Importimi dështoi: ${error}',
      'updates' => 'Përditësime',
      'dataManagement' => 'Menaxhimi i të dhënave',
      'exportDataTitle' => 'Eksporto të dhënat',
      'exportDataSubtitle' => 'Ruaj të dhënat e tua në një skedar JSON',
      'units' => 'Njësi',
      'updateNoCompatibleApk' =>
        'Nuk u gjet asnjë përditësim i pajtueshëm për pajisjen tënde.',
      'updateAppUpToDate' => 'Aplikacioni yt është i përditësuar!',
      'updateCheckNetworkError' => 'Nuk u kontrollua dot për përditësime tani.',
      'updateDialogTitle' => 'Përditësim i disponueshëm',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Versioni ${latest} është i disponueshëm! (Aktual: ${current})\n\nNjë përditësim i pajtueshëm me pajisjen tënde është gati për t\'u instaluar.',
      'updateDownloadAndInstall' => 'Shkarko & instalo',
      'updateInstallPermissionRequired' =>
        'Kërkohet leje për të instaluar përditësimet.',
      'updateDownloadingTitle' => 'Po shkarkohet përditësimi...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Hapja e instaluesit dështoi: ${message}',
      'updateDownloadFailed' =>
        'Shkarkimi dështoi. Të lutem kontrollo lidhjen tënde.',
      'notificationMedicationReminderTitle' => (
              {required Object scheduleName}) =>
          'Është koha të marrësh ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Planifikuar për ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Planifikuar për ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Planifikuar për ${weekday}',
      'addSchedule' => 'Shto një orar',
      'addScheduleToGetStarted' => 'Shto një orar për të filluar.',
      'newSchedule' => 'Orar i ri',
      'every' => 'Çdo',
      'days' => 'ditë',
      'dayOfMonth' => 'Dita e muajit',
      'months' => 'muaj',
      'startDate' => 'Data e fillimit',
      'pickATime' => 'Zgjidh një orë',
      'addIntakeTime' => 'Shto një orë',
      'editScheduleInfo' => 'Modifiko informacionin e orarit',
      'scheduling' => 'Planifikimi',
      'editSchedule' => 'Modifiko orarin',
      'deleteSchedule' => ({required Object name}) => 'Të fshihet ${name}?',
      'addNotification' => 'Shto një njoftim',
      'empty_intakes' => 'Marrjet e regjistruara do të shfaqen këtu',
      'HrtCounter' => 'Koha në HRT',
      'HrtCounterDescription' =>
        'Shfaq prej sa kohësh je në HRT dhe marrjet e tua gjithsej',
      'hrtWidgetPlaceholder' =>
        'Hap Mona-n për të regjistruar marrjen tënde të parë',
      'hrtWidgetPreviewSample' => 'Në HRT prej 8 muajsh',
      'hrtWidgetPreviewIntakeSample' => '16 marrje të regjistruara',
      'startOfDay' => 'Fillimi i ditës',
      'startOfDayDescription' => ({required Object time}) =>
          'Koha përpara ${time} llogaritet për ditën e mëparshme',
      'chooseSchedule' => 'Zgjidh një orar',
      'addSchedulesFirst' => 'Shto fillimisht oraret.',
      'editIntake' => 'Modifiko marrjen',
      'date' => 'Data',
      'amount' => 'Sasia',
      'takenAmount' => 'Sasia e marrë',
      'wastedAmount' => 'Sasia e humbur',
      'none' => 'Asnjë',
      'supplyItem' => 'Artikull furnizimi',
      'chooseItem' => 'Zgjidh një artikull',
      'noItemsToAdd' => 'Nuk ka artikuj të disponueshëm',
      'injectionSide' => 'Ana e injektimit',
      'deleteIntake' => 'Të fshihet kjo marrje?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Merr ${scheduleName}',
      'takeIntake' => 'Regjistro marrjen',
      'intakeRecorded' => 'Marrja u regjistrua',
      'needleDeadSpace' => 'Hapësira e vdekur e gjilpërës',
      'notes' => 'Shënime',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Analiza gjaku',
      'empty_blood_tests' =>
        'Analizat e kryera të gjakut do të shfaqen këtu. Fillo duke përdorur butonin Shto!',
      'addBloodTest' => 'Shto një analizë gjaku',
      'editBloodTest' => 'Modifiko analizën e gjakut',
      'newBloodTest' => 'Analizë e re gjaku',
      'deleteBloodTest' => 'Të fshihet kjo analizë gjaku?',
      'estradiolLevelLabel' => 'Niveli i estradiolit',
      'testosteroneLevelLabel' => 'Niveli i testosteronit',
      'bloodTestDateLabel' => 'Data e analizës',
      'chartNowConcentration' => ({required Object value}) => 'Tani ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Nuk ka furnizime. Shto një artikull për të filluar.',
      'newItem' => 'Artikull i ri',
      'adminRoute' => 'Rruga e administrimit',
      'totalAmount' => 'Sasia totale',
      'concentration' => 'Përqendrimi',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Doza për ${unit}',
      'editItem' => 'Modifiko artikullin',
      'usedAmount' => 'Sasia e përdorur',
      'deleteItem' => ({required Object name}) => 'Të fshihet ${name}?',
      'allItemsFilter' => 'Të gjitha',
      'medicationItemsFilter' => 'Medikamente',
      'genericItems' => 'Materiale harxhuese',
      'medicationItemType' => 'Medikament',
      'genericItemType' => 'Material harxhues',
      'supplyType' => 'Lloji',
      'syringe' => 'Shiringa',
      'wipe' => 'Peceta',
      'needle' => 'Gjilpëra',
      'gloves' => 'Doreza',
      'bandage' => 'Fasha',
      'add' => 'Shto',
      'save' => 'Ruaj',
      'cancel' => 'Anulo',
      'next' => 'Tjetër',
      'delete' => 'Fshi',
      'deleteElement' => 'Të fshihet ky artikull?',
      'irreversibleAction' => 'Ky veprim nuk mund të zhbëhet.',
      'name' => 'Emri',
      'molecule' => 'Molekula',
      'ester' => 'Esteri',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesteron',
      'testosterone' => 'Testosteron',
      'nandrolone' => 'Nandrolon',
      'dihydrotestosterone' => 'Dihidrotestosteron',
      'spironolactone' => 'Spironolakton',
      'cyproteroneAcetate' => 'Acetat ciproteroni',
      'leuprorelinAcetate' => 'Acetat leuprorelini',
      'bicalutamide' => 'Bikalutamid',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloksifen',
      'tamoxifen' => 'Tamoksifen',
      'finasteride' => 'Finasterid',
      'dutasteride' => 'Dutasterid',
      'minoxidil' => 'Minoksidil',
      'pioglitazone' => 'Pioglitazon',
      'enanthate' => 'Enantat',
      'valerate' => 'Valerat',
      'cypionate' => 'Cipionat',
      'undecylate' => 'Undecilat',
      'benzoate' => 'Benzoat',
      'cypionateSuspension' => 'Suspension cipionati',
      'medicationEstradiolEnanthate' => 'Estradiol enantat',
      'medicationEstradiolValerate' => 'Estradiol valerat',
      'medicationEstradiolCypionate' => 'Estradiol cipionat',
      'medicationEstradiolUndecylate' => 'Estradiol undecilat',
      'medicationEstradiolBenzoate' => 'Estradiol benzoat',
      'medicationEstradiolCypionateSuspension' =>
        'Suspension estradiol cipionati',
      'medicationTestosteroneEnanthate' => 'Testosteron enantat',
      'medicationTestosteroneValerate' => 'Testosteron valerat',
      'medicationTestosteroneCypionate' => 'Testosteron cipionat',
      'medicationTestosteroneUndecylate' => 'Testosteron undecilat',
      'medicationTestosteroneBenzoate' => 'Testosteron benzoat',
      'medicationTestosteroneCypionateSuspension' =>
        'Suspension testosteron cipionati',
      'injection' => 'Injeksion',
      'oral' => 'Oral',
      'sublingual' => 'Nëngjuhësor',
      'patch' => 'Flaster',
      'gel' => 'Xhel',
      'implant' => 'Implant',
      'suppository' => 'Supozitor',
      'transdermalSpray' => 'Spraj transdermal',
      'transdermalDrops' => 'Pika transdermale',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'unitNgPerMl' => 'ng/mL',
      'injectionSideLeft' => 'Majtas',
      'injectionSideRight' => 'Djathtas',
      'placementLeft' => 'Ana e majtë',
      'placementRight' => 'Ana e djathtë',
      'placementLeftThigh' => 'Kofsha e majtë',
      'placementRightThigh' => 'Kofsha e djathtë',
      'placementLeftArm' => 'Krahu i majtë',
      'placementRightArm' => 'Krahu i djathtë',
      'placementLeftButtock' => 'Vithja e majtë',
      'placementRightButtock' => 'Vithja e djathtë',
      'placementLeftAbdomen' => 'Barku i majtë',
      'placementRightAbdomen' => 'Barku i djathtë',
      'injectionSites' => 'Vendet e injektimit',
      'injectionSitesDescription' =>
        'Menaxho vendet ndërmjet të cilave alternon',
      'addInjectionSite' => 'Shto vend',
      'customSiteLabel' => 'Emër i personalizuar vendi',
      'noInjectionSitesYet' => 'Ende asnjë vend',
      'noInjectionAddOneToGetStarted' =>
        'Shto një vend më poshtë për të filluar.',
      'placementSuggestionPerScheduleTitle' => 'Sugjero sipas orarit',
      'placementSuggestionPerScheduleDescription' =>
        'Baza sugjerimin e vendit të radhës vetëm te historiku i këtij orari.',
      'requiredField' => 'Fushë e detyrueshme',
      'mustBePositiveNumber' => 'Duhet të jetë numër pozitiv',
      'mustBeBetween1And28' => 'Duhet të jetë midis 1 dhe 28',
      'invalidTotalAmount' => 'Sasi totale e pavlefshme',
      'cannotExceedTotalCapacity' => 'Nuk mund të tejkalojë kapacitetin total',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '${count} ditë më parë',
            other: '${count} ditë më parë',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'pas ${count} dite',
            other: 'pas ${count} ditësh',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Çdo ditë',
            other: 'Çdo ${count} ditë',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Ditën ${day}, çdo muaj',
            other: 'Ditën ${day}, çdo ${count} muaj',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '${count} i krijuar',
            other: '${count} të krijuara',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Në HRT prej 1 dite',
            other: 'Në HRT prej ${count} ditësh',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Në HRT prej 1 jave',
            other: 'Në HRT prej ${count} javësh',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Në HRT prej 1 muaji',
            other: 'Në HRT prej ${count} muajsh',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Në HRT prej 1 viti',
            other: 'Në HRT prej ${count} vitesh',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '1 marrje e regjistruar',
            other: '${count} marrje të regjistruara',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'Mbetet ${count} ${unit}',
            other: 'Mbeten ${count} ${unit}',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '1 shiringë e mbetur',
            other: '${count} shiringa të mbetura',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '1 pecetë e mbetur',
            other: '${count} peceta të mbetura',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '1 gjilpërë e mbetur',
            other: '${count} gjilpëra të mbetura',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '1 dorezë e mbetur',
            other: '${count} doreza të mbetura',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: '1 fashë e mbetur',
            other: '${count} fasha të mbetura',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'tabletë',
            other: 'tableta',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'flaster',
            other: 'flastera',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'pompë',
            other: 'pompa',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'implant',
            other: 'implante',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'supozitor',
            other: 'supozitorë',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sq'))(
            count,
            one: 'spraj',
            other: 'spraje',
          ),
      _ => null,
    };
  }
}
