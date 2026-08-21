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
class TranslationsIs extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsIs(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.icelandic,
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

  /// Metadata for the translations of <is>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsIs _root = this; // ignore: unused_field

  @override
  TranslationsIs $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsIs(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Inntak';
  @override
  String get nav_levels => 'Stig';
  @override
  String get nav_supplies => 'Forðar';
  @override
  String get takeAnIntake => 'Taka inntak';
  @override
  String get addAnItem => 'Bættu við atriði';
  @override
  String get empty_home => 'Byrjaðu á bætandi við áætlun í Stillingar';
  @override
  String get allDone => 'Allt búið!';
  @override
  String get noIntakesDue => 'Engar inntökur áætlaðar í dag';
  @override
  String get upcoming => 'Komandi';
  @override
  String get taken => 'Tekið';
  @override
  String get yesterday => 'í gær';
  @override
  String get tomorrow => 'á morgun';
  @override
  String get lastTaken => 'Síðast tekið';
  @override
  String get neverTakenYet => 'Aldrei tekið ennþá';
  @override
  String get scheduleFrequencyDaily => 'Á hverjum degi';
  @override
  String get scheduleFrequencyInterval => 'Millibil';
  @override
  String get scheduleFrequencyWeekly => 'Vikulega';
  @override
  String get newUpdateAvailable => 'Ný uppfærsla er í boði!';
  @override
  String get goToSettings => 'Farðu til Stillingar';
  @override
  String get settingsTitle => 'Stillingar';
  @override
  String get notifications => 'Tilkynningar';
  @override
  String get schedulesAndNotifications => 'Áætlunar & tilkynningar';
  @override
  String get general => 'Almennur';
  @override
  String get schedules => 'Áætlanir';
  @override
  String get noSchedules => 'Engin Áætlanir';
  @override
  String get language => 'Tungumál';
  @override
  String get languageFollowDevice => 'Fylgja tækatungumál';
  @override
  String get selectLanguage => 'Veldu tungumál';
  @override
  String get enableNotifications => 'Virkjaðu tilkynningar';
  @override
  String get enableNotificationsDescription => 'Sendaðu afgangar';
  @override
  String get notificationsDisabledTitle => 'Tilkynningar eru óvirkir';
  @override
  String get clickToOpenSettings => 'Smelltu til opna stillingar';
  @override
  String get exactRemindersDisabled => 'Nákvæmir afgangartímar eru óvirkir';
  @override
  String get remindersDelayed =>
      'Afgangur gætu tafist örlítið. Ýttu til að opna stillingar.';
  @override
  String get medicalSettings => 'Læknisfræðilegur Stillingar';
  @override
  String get theme => 'Þema';
  @override
  String get themeCustomizeColors => 'Sérsniðaðu forritslitina';
  @override
  String get customThemeEnabled => 'Sérsniðið þema';
  @override
  String get themeGenerate => 'Búa til';
  @override
  String get themeVariant => 'Variant';
  @override
  String get themeContrast => 'Mótsetning';
  @override
  String get themeContrastStandard => 'Staðall';
  @override
  String get themeContrastMedium => 'Meðallangur';
  @override
  String get themeContrastHigh => 'Há';
  @override
  String get autoUpdate => 'Sjálfvirk Uppfærsla';
  @override
  String get autoUpdateDescription =>
      'Athuga sjálfkrafa nýjar uppfærslur þegar forritið er ræst';
  @override
  String get checkForUpdates => 'Athugaðu hvort uppfærslur séu til staðar';
  @override
  String get checkForUpdatesDescription =>
      'Athugaðu handvirkt hvort nýjustu útgáfan sé til staðar\nÞetta mun tengja þig við internetið\n(Engin gögn verða send)';
  @override
  String appVersion({required Object version}) => 'Mona útgáfa ${version}';
  @override
  String backupSavedTo({required Object path}) => 'Afrit vistað í: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Mistókst að flytja út: ${error}';
  @override
  String get importDataTitle => 'Flytja inn gögn';
  @override
  String get importDataSubtitle => 'Endurheimta gögn úr JSON afriti';
  @override
  String get importDataOverwriteWarning =>
      'Þetta mun yfirskrifa öll núverandi gögn með afritinu. Þessa aðgerð er ekki hægt að afturkalla. Viltu halda áfram?';
  @override
  String get importConfirm => 'Flytja inn';
  @override
  String get importSuccessfulTitle => 'Innflutningur tókst';
  @override
  String get importRestartRequired =>
      'Endurræstu forritið til að virkja endurheimtu gögnin.';
  @override
  String get closeApp => 'Loka forrit';
  @override
  String importFailed({required Object error}) =>
      'Mistókst að flytja inn: ${error}';
  @override
  String get updates => 'Uppfærslur';
  @override
  String get dataManagement => 'Gagnastjórnun';
  @override
  String get exportDataTitle => 'Flytja út gögn';
  @override
  String get exportDataSubtitle => 'Vistaðu gögnin þín í JSON skrá';
  @override
  String get units => 'Einingar';
  @override
  String get updateNoCompatibleApk =>
      'Engin samhæf uppfærsla fannst fyrir tækið þitt.';
  @override
  String get updateAppUpToDate => 'Forritið þitt er uppfært!';
  @override
  String get updateCheckNetworkError =>
      'Gat ekki athugað hvort uppfærslur væru í augnablikinu.';
  @override
  String get updateDialogTitle => 'Uppfærsla í boði';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Útgáfa ${latest} er tiltæk! (Núverandi: ${current})\n\nUppfærsla sem er samhæf tækinu þínu er tilbúin til uppsetningar.';
  @override
  String get updateDownloadAndInstall => 'Hlaða niður & Setja upp';
  @override
  String get updateInstallPermissionRequired =>
      'Leyfi þarf til að setja upp uppfærslur.';
  @override
  String get updateDownloadingTitle => 'Hlaðandi niður uppfærslu...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Mistókst að opna uppsetningarforritið: ${message}';
  @override
  String get updateDownloadFailed =>
      'Niðurhal mistókst. Vinsamlegast athugaðu tenginguna þína.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Tími til að taka ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Áætlað fyrir ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Áætlað fyrir ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Áætlað fyrir ${weekday}';
  @override
  String get addSchedule => 'Bættu við áætlun';
  @override
  String get addScheduleToGetStarted => 'Bættu við áætlun til að byrja.';
  @override
  String get newSchedule => 'Ný áætlun';
  @override
  String get every => 'Sérhver';
  @override
  String get days => 'dagur';
  @override
  String get startDate => 'Upphafsdagur';
  @override
  String get pickATime => 'Veldu tíma';
  @override
  String get addIntakeTime => 'Bættu við tíma';
  @override
  String get editScheduleInfo => 'Breyttu áætlunarupplýsingar';
  @override
  String get scheduling => 'Tímasetningar';
  @override
  String get editSchedule => 'Breyttu áætlun';
  @override
  String deleteSchedule({required Object name}) => 'Eyða ${name}?';
  @override
  String get addNotification => 'Bættu við tilkynning';
  @override
  String get empty_intakes => 'Teknar inntökur birtast hér';
  @override
  String get chooseSchedule => 'Veldu áætlun';
  @override
  String get addSchedulesFirst => 'Bættu við áætlanir fysta.';
  @override
  String get editIntake => 'Breyttu inntak';
  @override
  String get date => 'Dagsetning';
  @override
  String get amount => 'Upphæð';
  @override
  String get takenAmount => 'Tekið upphæð';
  @override
  String get wastedAmount => 'Sóað upphæð';
  @override
  String get none => 'Ekkert';
  @override
  String get supplyItem => 'Framboðsvara';
  @override
  String get injectionSide => 'Innspýtingarhlið';
  @override
  String get deleteIntake => 'Eyddu þetta inntak?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Taktu ${scheduleName}';
  @override
  String get takeIntake => 'Taktu inntak';
  @override
  String get intakeRecorded => 'Inntak skráð';
  @override
  String get needleDeadSpace => 'Nálardauður rými';
  @override
  String get notes => 'Glósur';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Blóðprufur';
  @override
  String get empty_blood_tests =>
      'Blóðprufur sem teknar eru birtast hér. Byrjaðu með því að nota Bæta við hnappinn.!';
  @override
  String get addBloodTest => 'Bættu við blóðprufa';
  @override
  String get editBloodTest => 'Breyttu blóðprufa';
  @override
  String get newBloodTest => 'Ný blóðprufa';
  @override
  String get deleteBloodTest => 'Eyddu þetta blóðprufa?';
  @override
  String get estradiolLevelLabel => 'Estradíólstig';
  @override
  String get testosteroneLevelLabel => 'Testósterónstig';
  @override
  String get bloodTestDateLabel => 'Prufudagsetning';
  @override
  String chartNowConcentration({required Object value}) => 'Núna ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies => 'Engar forðar. Bættu við vöru til að byrja..';
  @override
  String get newItem => 'Nýtt atriði';
  @override
  String get adminRoute => 'Stjórnunarleið';
  @override
  String get totalAmount => 'Heildarupphæð';
  @override
  String get concentration => 'Einbeiting';
  @override
  String get editItem => 'Breyttu atriði';
  @override
  String get usedAmount => 'Notað upphæð';
  @override
  String deleteItem({required Object name}) => 'Eyddu ${name}?';
  @override
  String get allItemsFilter => 'Allt';
  @override
  String get medicationItemsFilter => 'Lyfjameðferð';
  @override
  String get genericItems => 'Neysluvörur';
  @override
  String get medicationItemType => 'Lyfjameðferð';
  @override
  String get genericItemType => 'Neysluvara';
  @override
  String get supplyType => 'Tegund';
  @override
  String get syringe => 'Sprautur';
  @override
  String get wipe => 'Þurrkur';
  @override
  String get needle => 'Nálar';
  @override
  String get gloves => 'Hannskar';
  @override
  String get bandage => 'Plástrar';
  @override
  String get add => 'Bæta við';
  @override
  String get save => 'Vista';
  @override
  String get cancel => 'Hætta við';
  @override
  String get next => 'Næst';
  @override
  String get delete => 'Eyða';
  @override
  String get deleteElement => 'Eyðaðu þetta atriði?';
  @override
  String get irreversibleAction => 'Ekki er hægt að afturkalla þessa aðgerð.';
  @override
  String get name => 'Nafn';
  @override
  String get molecule => 'Sameind';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Estradíól';
  @override
  String get progesterone => 'Prógesterón';
  @override
  String get testosterone => 'Testósterón';
  @override
  String get nandrolone => 'Nandrólón';
  @override
  String get dihydrotestosterone => 'Díhýdrótestósterón';
  @override
  String get spironolactone => 'Spírónólaktón';
  @override
  String get cyproteroneAcetate => 'Sýpróterón asetat';
  @override
  String get leuprorelinAcetate => 'Leuprórelín asetat';
  @override
  String get bicalutamide => 'Bikalútamíð';
  @override
  String get decapeptyl => 'Triptórelín';
  @override
  String get raloxifene => 'Raloxífen';
  @override
  String get tamoxifen => 'Tamoxifen';
  @override
  String get finasteride => 'Fínasteríð';
  @override
  String get dutasteride => 'Dútasteríð';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Píoglítasón';
  @override
  String get enanthate => 'Enantat';
  @override
  String get valerate => 'Valerat';
  @override
  String get cypionate => 'Cypionate';
  @override
  String get undecylate => 'Undecýlat';
  @override
  String get benzoate => 'Bensóat';
  @override
  String get cypionateSuspension => 'Cypionate sviflausn';
  @override
  String get medicationEstradiolEnanthate => 'Estradíólenantat';
  @override
  String get medicationEstradiolValerate => 'Estradíólvalerat';
  @override
  String get medicationEstradiolCypionate => 'Estradíól-cypionate';
  @override
  String get medicationEstradiolUndecylate => 'Estradíólundecýlat';
  @override
  String get medicationEstradiolBenzoate => 'Estradíólbensóat';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Estradíól-cypionate sviflausn';
  @override
  String get medicationTestosteroneEnanthate => 'Testósterónenantat';
  @override
  String get medicationTestosteroneValerate => 'Testósterónvalerat';
  @override
  String get medicationTestosteroneCypionate => 'Testósterón-cypionate';
  @override
  String get medicationTestosteroneUndecylate => 'Testósterónundecýlat';
  @override
  String get medicationTestosteroneBenzoate => 'Testósterónbensóat';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Testósterón-cypionate sviflausn';
  @override
  String get injection => 'Innspýting';
  @override
  String get oral => 'Munnlega';
  @override
  String get sublingual => 'Undir tungu';
  @override
  String get patch => 'Bót';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Ígræðsla';
  @override
  String get suppository => 'Stikkpilla';
  @override
  String get transdermalSpray => 'Gegnum húð úði';
  @override
  String get transdermalDrops => 'Gegnum húð dropar';
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
  String get injectionSideLeft => 'Vinstri';
  @override
  String get injectionSideRight => 'Hægri';
  @override
  String get placementLeft => 'Vinstri hlið';
  @override
  String get placementRight => 'Hægri hlið';
  @override
  String get placementLeftThigh => 'Vinstri læri';
  @override
  String get placementRightThigh => 'Right læri';
  @override
  String get placementLeftArm => 'Vinstri handleggur';
  @override
  String get placementRightArm => 'Right handleggur';
  @override
  String get placementLeftButtock => 'Vinstri rass';
  @override
  String get placementRightButtock => 'Right rass';
  @override
  String get placementLeftAbdomen => 'Vinstri kvið';
  @override
  String get placementRightAbdomen => 'Right kvið';
  @override
  String get injectionSites => 'Innspýtingarstaðir';
  @override
  String get injectionSitesDescription =>
      'Stjórnaðu síðunum sem þú skiptir á milli';
  @override
  String get addInjectionSite => 'Bættu við staðir';
  @override
  String get customSiteLabel => 'Sérsniðið staðarnafn';
  @override
  String get noInjectionSitesYet => 'Engar staðir ennþá';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Bættu við stað hér að neðan til að byrja.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Tillögur samkvæmt áætlun';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Byggðu tillöguna að næsta stað eingöngu á sögu þessarar áætlunar.';
  @override
  String get requiredField => 'Skylda reitur';
  @override
  String get mustBePositiveNumber => 'Verður að vera jákvæð tala';
  @override
  String get invalidTotalAmount => 'Ógild heildarupphæð';
  @override
  String get cannotExceedTotalCapacity =>
      'Ekki er hægt að fara yfir heildargetu';
  @override
  String get scheduleFrequencyMonthly => 'Mánuðurlega';
  @override
  String get dayOfMonth => 'Dag mánaðarins';
  @override
  String get months => 'mánuðir';
  @override
  String get mustBeBetween1And28 => 'Verður að vera á milli 1 og 28';
  @override
  String get HrtCounterDescription =>
      'Sýnið hversu lengi þið hafið verið á HRT og heildarinntöku ykkar';
  @override
  String get startOfDay => 'Byrjun dags';
  @override
  String startOfDayDescription({required Object time}) =>
      'Tíminn fyrir ${time} telst með í fyrri degi';
  @override
  String get anchorToLastIntake => 'Endurreikna út frá síðustu inntöku';
  @override
  String get anchorToLastIntakeDescription =>
      'Áætlar næstu inntöku með fullu millibili eftir að þú tókst hana síðast';
  @override
  String get chooseItem => 'Veldu atriði';
  @override
  String get noItemsToAdd => 'Engar atriði tiltækar';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '${count} fyrir dögum',
        other: '${count} fyrir dögum',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'eftir ${count} degi',
        other: 'eftir ${count} daga',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'Á hverjum degi',
        other: 'Á ${count} daga fresti',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '${count} skapiði',
        other: '${count} skapiði',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '${count} ${unit} eftir',
        other: '${count} ${unit} eftir',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '1 sprauta eftir',
        other: '${count} sprautur eftir',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '1 þurrka eftir',
        other: '${count} þurrkur eftir',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '1 nál eftir',
        other: '${count} nálar eftir',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '1 hannski eftir',
        other: '${count} hannskar eftir',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '1 plástur eftir',
        other: '${count} plástrar eftir',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'pilla',
        other: 'pillur',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'bót',
        other: 'bætur',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'dæla',
        other: 'dælur',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'ígræðsla',
        other: 'ígræðslur',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'stikkpilla',
        other: 'stikkpillur',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'úði',
        other: 'úðar',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'Dagur ${day}, í hverjum mánuði',
        other: 'Dagur ${day}, á ${count} mánaða fresti',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'Á HRT í 1 dag',
        other: 'Á HRT í ${count} daga',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'Á HRT í 1 viku',
        other: 'Á HRT í ${count} vikur',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'Á HRT í 1 mánuð',
        other: 'Á HRT í ${count} mánuði',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: 'Á HRT í 1 ár',
        other: 'Á HRT í ${count} ár',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
        count,
        one: '1 inntaka skráð',
        other: '${count} inntökur skráðar',
      );
}

/// The flat map containing all translations for locale <is>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsIs {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Inntak',
      'nav_levels' => 'Stig',
      'nav_supplies' => 'Forðar',
      'takeAnIntake' => 'Taka inntak',
      'addAnItem' => 'Bættu við atriði',
      'empty_home' => 'Byrjaðu á bætandi við áætlun í Stillingar',
      'allDone' => 'Allt búið!',
      'noIntakesDue' => 'Engar inntökur áætlaðar í dag',
      'upcoming' => 'Komandi',
      'taken' => 'Tekið',
      'yesterday' => 'í gær',
      'tomorrow' => 'á morgun',
      'lastTaken' => 'Síðast tekið',
      'neverTakenYet' => 'Aldrei tekið ennþá',
      'scheduleFrequencyDaily' => 'Á hverjum degi',
      'scheduleFrequencyInterval' => 'Millibil',
      'scheduleFrequencyWeekly' => 'Vikulega',
      'newUpdateAvailable' => 'Ný uppfærsla er í boði!',
      'goToSettings' => 'Farðu til Stillingar',
      'settingsTitle' => 'Stillingar',
      'notifications' => 'Tilkynningar',
      'schedulesAndNotifications' => 'Áætlunar & tilkynningar',
      'general' => 'Almennur',
      'schedules' => 'Áætlanir',
      'noSchedules' => 'Engin Áætlanir',
      'language' => 'Tungumál',
      'languageFollowDevice' => 'Fylgja tækatungumál',
      'selectLanguage' => 'Veldu tungumál',
      'enableNotifications' => 'Virkjaðu tilkynningar',
      'enableNotificationsDescription' => 'Sendaðu afgangar',
      'notificationsDisabledTitle' => 'Tilkynningar eru óvirkir',
      'clickToOpenSettings' => 'Smelltu til opna stillingar',
      'exactRemindersDisabled' => 'Nákvæmir afgangartímar eru óvirkir',
      'remindersDelayed' =>
        'Afgangur gætu tafist örlítið. Ýttu til að opna stillingar.',
      'medicalSettings' => 'Læknisfræðilegur Stillingar',
      'theme' => 'Þema',
      'themeCustomizeColors' => 'Sérsniðaðu forritslitina',
      'customThemeEnabled' => 'Sérsniðið þema',
      'themeGenerate' => 'Búa til',
      'themeVariant' => 'Variant',
      'themeContrast' => 'Mótsetning',
      'themeContrastStandard' => 'Staðall',
      'themeContrastMedium' => 'Meðallangur',
      'themeContrastHigh' => 'Há',
      'autoUpdate' => 'Sjálfvirk Uppfærsla',
      'autoUpdateDescription' =>
        'Athuga sjálfkrafa nýjar uppfærslur þegar forritið er ræst',
      'checkForUpdates' => 'Athugaðu hvort uppfærslur séu til staðar',
      'checkForUpdatesDescription' =>
        'Athugaðu handvirkt hvort nýjustu útgáfan sé til staðar\nÞetta mun tengja þig við internetið\n(Engin gögn verða send)',
      'appVersion' => ({required Object version}) => 'Mona útgáfa ${version}',
      'backupSavedTo' => ({required Object path}) => 'Afrit vistað í: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Mistókst að flytja út: ${error}',
      'importDataTitle' => 'Flytja inn gögn',
      'importDataSubtitle' => 'Endurheimta gögn úr JSON afriti',
      'importDataOverwriteWarning' =>
        'Þetta mun yfirskrifa öll núverandi gögn með afritinu. Þessa aðgerð er ekki hægt að afturkalla. Viltu halda áfram?',
      'importConfirm' => 'Flytja inn',
      'importSuccessfulTitle' => 'Innflutningur tókst',
      'importRestartRequired' =>
        'Endurræstu forritið til að virkja endurheimtu gögnin.',
      'closeApp' => 'Loka forrit',
      'importFailed' => ({required Object error}) =>
          'Mistókst að flytja inn: ${error}',
      'updates' => 'Uppfærslur',
      'dataManagement' => 'Gagnastjórnun',
      'exportDataTitle' => 'Flytja út gögn',
      'exportDataSubtitle' => 'Vistaðu gögnin þín í JSON skrá',
      'units' => 'Einingar',
      'updateNoCompatibleApk' =>
        'Engin samhæf uppfærsla fannst fyrir tækið þitt.',
      'updateAppUpToDate' => 'Forritið þitt er uppfært!',
      'updateCheckNetworkError' =>
        'Gat ekki athugað hvort uppfærslur væru í augnablikinu.',
      'updateDialogTitle' => 'Uppfærsla í boði',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Útgáfa ${latest} er tiltæk! (Núverandi: ${current})\n\nUppfærsla sem er samhæf tækinu þínu er tilbúin til uppsetningar.',
      'updateDownloadAndInstall' => 'Hlaða niður & Setja upp',
      'updateInstallPermissionRequired' =>
        'Leyfi þarf til að setja upp uppfærslur.',
      'updateDownloadingTitle' => 'Hlaðandi niður uppfærslu...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Mistókst að opna uppsetningarforritið: ${message}',
      'updateDownloadFailed' =>
        'Niðurhal mistókst. Vinsamlegast athugaðu tenginguna þína.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Tími til að taka ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Áætlað fyrir ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Áætlað fyrir ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Áætlað fyrir ${weekday}',
      'addSchedule' => 'Bættu við áætlun',
      'addScheduleToGetStarted' => 'Bættu við áætlun til að byrja.',
      'newSchedule' => 'Ný áætlun',
      'every' => 'Sérhver',
      'days' => 'dagur',
      'startDate' => 'Upphafsdagur',
      'pickATime' => 'Veldu tíma',
      'addIntakeTime' => 'Bættu við tíma',
      'editScheduleInfo' => 'Breyttu áætlunarupplýsingar',
      'scheduling' => 'Tímasetningar',
      'editSchedule' => 'Breyttu áætlun',
      'deleteSchedule' => ({required Object name}) => 'Eyða ${name}?',
      'addNotification' => 'Bættu við tilkynning',
      'empty_intakes' => 'Teknar inntökur birtast hér',
      'chooseSchedule' => 'Veldu áætlun',
      'addSchedulesFirst' => 'Bættu við áætlanir fysta.',
      'editIntake' => 'Breyttu inntak',
      'date' => 'Dagsetning',
      'amount' => 'Upphæð',
      'takenAmount' => 'Tekið upphæð',
      'wastedAmount' => 'Sóað upphæð',
      'none' => 'Ekkert',
      'supplyItem' => 'Framboðsvara',
      'injectionSide' => 'Innspýtingarhlið',
      'deleteIntake' => 'Eyddu þetta inntak?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Taktu ${scheduleName}',
      'takeIntake' => 'Taktu inntak',
      'intakeRecorded' => 'Inntak skráð',
      'needleDeadSpace' => 'Nálardauður rými',
      'notes' => 'Glósur',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Blóðprufur',
      'empty_blood_tests' =>
        'Blóðprufur sem teknar eru birtast hér. Byrjaðu með því að nota Bæta við hnappinn.!',
      'addBloodTest' => 'Bættu við blóðprufa',
      'editBloodTest' => 'Breyttu blóðprufa',
      'newBloodTest' => 'Ný blóðprufa',
      'deleteBloodTest' => 'Eyddu þetta blóðprufa?',
      'estradiolLevelLabel' => 'Estradíólstig',
      'testosteroneLevelLabel' => 'Testósterónstig',
      'bloodTestDateLabel' => 'Prufudagsetning',
      'chartNowConcentration' => ({required Object value}) => 'Núna ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Engar forðar. Bættu við vöru til að byrja..',
      'newItem' => 'Nýtt atriði',
      'adminRoute' => 'Stjórnunarleið',
      'totalAmount' => 'Heildarupphæð',
      'concentration' => 'Einbeiting',
      'editItem' => 'Breyttu atriði',
      'usedAmount' => 'Notað upphæð',
      'deleteItem' => ({required Object name}) => 'Eyddu ${name}?',
      'allItemsFilter' => 'Allt',
      'medicationItemsFilter' => 'Lyfjameðferð',
      'genericItems' => 'Neysluvörur',
      'medicationItemType' => 'Lyfjameðferð',
      'genericItemType' => 'Neysluvara',
      'supplyType' => 'Tegund',
      'syringe' => 'Sprautur',
      'wipe' => 'Þurrkur',
      'needle' => 'Nálar',
      'gloves' => 'Hannskar',
      'bandage' => 'Plástrar',
      'add' => 'Bæta við',
      'save' => 'Vista',
      'cancel' => 'Hætta við',
      'next' => 'Næst',
      'delete' => 'Eyða',
      'deleteElement' => 'Eyðaðu þetta atriði?',
      'irreversibleAction' => 'Ekki er hægt að afturkalla þessa aðgerð.',
      'name' => 'Nafn',
      'molecule' => 'Sameind',
      'ester' => 'Ester',
      'estradiol' => 'Estradíól',
      'progesterone' => 'Prógesterón',
      'testosterone' => 'Testósterón',
      'nandrolone' => 'Nandrólón',
      'dihydrotestosterone' => 'Díhýdrótestósterón',
      'spironolactone' => 'Spírónólaktón',
      'cyproteroneAcetate' => 'Sýpróterón asetat',
      'leuprorelinAcetate' => 'Leuprórelín asetat',
      'bicalutamide' => 'Bikalútamíð',
      'decapeptyl' => 'Triptórelín',
      'raloxifene' => 'Raloxífen',
      'tamoxifen' => 'Tamoxifen',
      'finasteride' => 'Fínasteríð',
      'dutasteride' => 'Dútasteríð',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Píoglítasón',
      'enanthate' => 'Enantat',
      'valerate' => 'Valerat',
      'cypionate' => 'Cypionate',
      'undecylate' => 'Undecýlat',
      'benzoate' => 'Bensóat',
      'cypionateSuspension' => 'Cypionate sviflausn',
      'medicationEstradiolEnanthate' => 'Estradíólenantat',
      'medicationEstradiolValerate' => 'Estradíólvalerat',
      'medicationEstradiolCypionate' => 'Estradíól-cypionate',
      'medicationEstradiolUndecylate' => 'Estradíólundecýlat',
      'medicationEstradiolBenzoate' => 'Estradíólbensóat',
      'medicationEstradiolCypionateSuspension' =>
        'Estradíól-cypionate sviflausn',
      'medicationTestosteroneEnanthate' => 'Testósterónenantat',
      'medicationTestosteroneValerate' => 'Testósterónvalerat',
      'medicationTestosteroneCypionate' => 'Testósterón-cypionate',
      'medicationTestosteroneUndecylate' => 'Testósterónundecýlat',
      'medicationTestosteroneBenzoate' => 'Testósterónbensóat',
      'medicationTestosteroneCypionateSuspension' =>
        'Testósterón-cypionate sviflausn',
      'injection' => 'Innspýting',
      'oral' => 'Munnlega',
      'sublingual' => 'Undir tungu',
      'patch' => 'Bót',
      'gel' => 'Gel',
      'implant' => 'Ígræðsla',
      'suppository' => 'Stikkpilla',
      'transdermalSpray' => 'Gegnum húð úði',
      'transdermalDrops' => 'Gegnum húð dropar',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'injectionSideLeft' => 'Vinstri',
      'injectionSideRight' => 'Hægri',
      'placementLeft' => 'Vinstri hlið',
      'placementRight' => 'Hægri hlið',
      'placementLeftThigh' => 'Vinstri læri',
      'placementRightThigh' => 'Right læri',
      'placementLeftArm' => 'Vinstri handleggur',
      'placementRightArm' => 'Right handleggur',
      'placementLeftButtock' => 'Vinstri rass',
      'placementRightButtock' => 'Right rass',
      'placementLeftAbdomen' => 'Vinstri kvið',
      'placementRightAbdomen' => 'Right kvið',
      'injectionSites' => 'Innspýtingarstaðir',
      'injectionSitesDescription' => 'Stjórnaðu síðunum sem þú skiptir á milli',
      'addInjectionSite' => 'Bættu við staðir',
      'customSiteLabel' => 'Sérsniðið staðarnafn',
      'noInjectionSitesYet' => 'Engar staðir ennþá',
      'noInjectionAddOneToGetStarted' =>
        'Bættu við stað hér að neðan til að byrja.',
      'placementSuggestionPerScheduleTitle' => 'Tillögur samkvæmt áætlun',
      'placementSuggestionPerScheduleDescription' =>
        'Byggðu tillöguna að næsta stað eingöngu á sögu þessarar áætlunar.',
      'requiredField' => 'Skylda reitur',
      'mustBePositiveNumber' => 'Verður að vera jákvæð tala',
      'invalidTotalAmount' => 'Ógild heildarupphæð',
      'cannotExceedTotalCapacity' => 'Ekki er hægt að fara yfir heildargetu',
      'scheduleFrequencyMonthly' => 'Mánuðurlega',
      'dayOfMonth' => 'Dag mánaðarins',
      'months' => 'mánuðir',
      'mustBeBetween1And28' => 'Verður að vera á milli 1 og 28',
      'HrtCounterDescription' =>
        'Sýnið hversu lengi þið hafið verið á HRT og heildarinntöku ykkar',
      'startOfDay' => 'Byrjun dags',
      'startOfDayDescription' => ({required Object time}) =>
          'Tíminn fyrir ${time} telst með í fyrri degi',
      'anchorToLastIntake' => 'Endurreikna út frá síðustu inntöku',
      'anchorToLastIntakeDescription' =>
        'Áætlar næstu inntöku með fullu millibili eftir að þú tókst hana síðast',
      'chooseItem' => 'Veldu atriði',
      'noItemsToAdd' => 'Engar atriði tiltækar',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '${count} fyrir dögum',
            other: '${count} fyrir dögum',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'eftir ${count} degi',
            other: 'eftir ${count} daga',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'Á hverjum degi',
            other: 'Á ${count} daga fresti',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '${count} skapiði',
            other: '${count} skapiði',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '${count} ${unit} eftir',
            other: '${count} ${unit} eftir',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '1 sprauta eftir',
            other: '${count} sprautur eftir',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '1 þurrka eftir',
            other: '${count} þurrkur eftir',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '1 nál eftir',
            other: '${count} nálar eftir',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '1 hannski eftir',
            other: '${count} hannskar eftir',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '1 plástur eftir',
            other: '${count} plástrar eftir',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'pilla',
            other: 'pillur',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'bót',
            other: 'bætur',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'dæla',
            other: 'dælur',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'ígræðsla',
            other: 'ígræðslur',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'stikkpilla',
            other: 'stikkpillur',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'úði',
            other: 'úðar',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'Dagur ${day}, í hverjum mánuði',
            other: 'Dagur ${day}, á ${count} mánaða fresti',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'Á HRT í 1 dag',
            other: 'Á HRT í ${count} daga',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'Á HRT í 1 viku',
            other: 'Á HRT í ${count} vikur',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'Á HRT í 1 mánuð',
            other: 'Á HRT í ${count} mánuði',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: 'Á HRT í 1 ár',
            other: 'Á HRT í ${count} ár',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('is'))(
            count,
            one: '1 inntaka skráð',
            other: '${count} inntökur skráðar',
          ),
      _ => null,
    };
  }
}
