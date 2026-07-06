///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsSk extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsSk(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.sk,
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

  /// Metadata for the translations of <sk>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsSk _root = this; // ignore: unused_field

  @override
  TranslationsSk $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsSk(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Dávky';
  @override
  String get nav_levels => 'Hodnoty';
  @override
  String get nav_supplies => 'Zásoby';
  @override
  String get takeAnIntake => 'Vziať dávku';
  @override
  String get addAnItem => 'Pridaj vybavenie';
  @override
  String get empty_home => 'Začni pridaním plánu v nastaveniach';
  @override
  String get allDone => 'Hotovo!';
  @override
  String get noIntakesDue => 'Dnes nie sú naplánované žiadne dávky';
  @override
  String get upcoming => 'Nadchádzajúce';
  @override
  String get taken => 'Vzaté';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        other: 'Pred ${count} dňami',
      );
  @override
  String get yesterday => 'včera';
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        few: 'o ${count} dni',
        other: 'o ${count} dní',
      );
  @override
  String get tomorrow => 'zajtra';
  @override
  String get lastTaken => 'Vzatá naposledy';
  @override
  String get neverTakenYet => 'Nevzatá nikdy';
  @override
  String get scheduleFrequencyDaily => 'Každý deň';
  @override
  String scheduleFrequencyEveryNDays({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        days,
        few: 'Každé ${days} dni',
        other: 'Každých ${days} dní',
      );
  @override
  String get scheduleFrequencyInterval => 'Interval';
  @override
  String get scheduleFrequencyWeekly => 'Týždenne';
  @override
  String get newUpdateAvailable => 'Je k dispozícii nová aktualizácia!';
  @override
  String get goToSettings => 'Ísť do nastavení';
  @override
  String get settingsTitle => 'Nastavenia';
  @override
  String get notifications => 'Notifikácie';
  @override
  String get schedulesAndNotifications => 'Plány & notifikácie';
  @override
  String get general => 'Všeobecné';
  @override
  String get schedules => 'Plány';
  @override
  String get noSchedules => 'Žiadne plány';
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'Vytvorený ${count} plán',
        few: 'Vytvorené ${count} plány',
        other: 'Vytvorených ${count} plánov',
      );
  @override
  String get language => 'Jazyk';
  @override
  String get languageFollowDevice => 'Jazyk podľa zariadenia';
  @override
  String get selectLanguage => 'Vyber jazyk';
  @override
  String get enableNotifications => 'Zapni notifikácie';
  @override
  String get enableNotificationsDescription => 'Posielať pripomienky';
  @override
  String get notificationsDisabledTitle => 'Notifikácie sú vypnuté';
  @override
  String get clickToOpenSettings => 'Klikni pre otvorenie nastavení';
  @override
  String get exactRemindersDisabled => 'Presné časy pripomienok sú vypnuté';
  @override
  String get remindersDelayed =>
      'Pripomienky môžu byť jemne oneskorené. Klikni pre otvorenie nastavení.';
  @override
  String get autoUpdate => 'Automatické aktualizácie';
  @override
  String get autoUpdateDescription =>
      'Automaticky skontrolovať najnovšie aktualizácie pre otvorení apky';
  @override
  String get checkForUpdates => 'Skontrolovať aktualizácie';
  @override
  String get checkForUpdatesDescription =>
      'Skontrolovať najnovšiu verziu manuálne\nTáto akcia ťa pripojí na internet.\n(Žiadne dáta nebudú odoslané)';
  @override
  String appVersion({required Object version}) => 'Mona verzia ${version}';
  @override
  String backupSavedTo({required Object path}) => 'Záloha uložená: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Export dát sa nepodaril: ${error}';
  @override
  String get importDataTitle => 'Import dát';
  @override
  String get importDataSubtitle => 'Obnoviť dáta pomocou JSON zálohy';
  @override
  String get importDataOverwriteWarning =>
      'Týmto sa všetky tvoje dáta prepíšu zálohou. Túto akciu nie je možné vrátiť späť. Chceš pokračovať?';
  @override
  String get importConfirm => 'Import';
  @override
  String get importSuccessfulTitle => 'Import úspešný';
  @override
  String get importRestartRequired =>
      'Prosím reštartuj apku pre načítanie importovaných dát.';
  @override
  String get closeApp => 'Zavrieť apku';
  @override
  String importFailed({required Object error}) =>
      'Import sa nepodaril: ${error}';
  @override
  String get updates => 'Aktualizácie';
  @override
  String get dataManagement => 'Správa dát';
  @override
  String get exportDataTitle => 'Export dát';
  @override
  String get exportDataSubtitle => 'Ulož svoje dáta do JSON súboru';
  @override
  String get units => 'Jednotky';
  @override
  String get updateNoCompatibleApk =>
      'Pre tvoje zariadenie nebola nájdená kompatibilná aktualizácia.';
  @override
  String get updateAppUpToDate => 'Tvoja apka má najnovšiu aktualizáciu!';
  @override
  String get updateCheckNetworkError =>
      'Nebolo možné skontrolovať aktualizácie.';
  @override
  String get updateDialogTitle => 'Dostupná aktualizácia';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Verzia ${latest} je dostupná! (Súčasná: ${current})\n\nAktualizácia kompatibilná s tvojím zariadením je pripravená na inštaláciu.';
  @override
  String get updateDownloadAndInstall => 'Stiahni & nainštaluj';
  @override
  String get updateInstallPermissionRequired =>
      'Pre inštaláciu aktualizácií je potrebné povolenie.';
  @override
  String get updateDownloadingTitle => 'Sťahovanie aktualizácie...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Nepodarilo sa otvoriť inštalátor: ${message}';
  @override
  String get updateDownloadFailed =>
      'Sťahovanie sa nepodarilo. Prosím skontroluj svoje pripojenie.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Prišiel čas si vziať ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Naplánovaná na ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Naplánovaná na ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Naplánovaná na ${weekday}';
  @override
  String get addSchedule => 'Pridaj plán';
  @override
  String get addScheduleToGetStarted => 'Pridaj plán pre začatie.';
  @override
  String get newSchedule => 'Nový plán';
  @override
  String get every => 'Každých';
  @override
  String get days => 'dní';
  @override
  String get startDate => 'Dátum začiatku';
  @override
  String get pickATime => 'Vyber čas';
  @override
  String get addIntakeTime => 'Pridaj čas';
  @override
  String get editScheduleInfo => 'Upraviť detaily plánu';
  @override
  String get scheduling => 'Plánovanie';
  @override
  String get noNotifications => 'Žiadne notifikácie';
  @override
  String notificationsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: '${count} notifikácia',
        few: '${count} notifikácie',
        other: '${count} notifikácií',
      );
  @override
  String get editSchedule => 'Upraviť plán';
  @override
  String deleteSchedule({required Object name}) => 'Vymazať ${name}?';
  @override
  String get scheduleNotifications => 'Notifikácie plánu';
  @override
  String get addNotification => 'Pridaj notifikáciu';
  @override
  String noNotificationsForSchedule({required Object scheduleName}) =>
      'Žiadne notifikácie pre ${scheduleName}. Stlač tlačidlo Pridaj.';
  @override
  String get notificationsUpdated => 'Notifikácie boli aktualizované!';
  @override
  String get notificationsUpdatedDescription =>
      'Každý plán má teraz vlastné notifikácie.\n\nZapni si notifikácie pre svoje plány, aby ti nič neušlo.';
  @override
  String get dontShowAgain => 'Nezobrazovať znovu';
  @override
  String get scheduleSettings => 'Nastavenia plánu';
  @override
  String get empty_intakes => 'Vzaté dávky sa zobrazia tu';
  @override
  String get chooseSchedule => 'Vyber plán';
  @override
  String get addSchedulesFirst => 'Najprv pridaj plány.';
  @override
  String get editIntake => 'Uprav dávku';
  @override
  String get date => 'Dátum';
  @override
  String get amount => 'Množstvo';
  @override
  String get takenAmount => 'Užité množstvo';
  @override
  String get wastedAmount => 'Stratené množstvo';
  @override
  String get none => 'Žiadna';
  @override
  String get supplyItem => 'Zásoba';
  @override
  String get injectionSide => 'Strana injekcie';
  @override
  String get deleteIntake => 'Vymazať túto dávku?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Vezmi ${scheduleName}';
  @override
  String get takeIntake => 'Vezmi dávku';
  @override
  String get intakeRecorded => 'Dávka zaznamenaná';
  @override
  String get needleDeadSpace => 'Mŕtvy priestor ihly';
  @override
  String get notes => 'Poznámky';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get empty_levels => 'Estradiolové injekcie sa zobrazia na tejto karte';
  @override
  String get bloodTestsTitle => 'Krvné testy';
  @override
  String get empty_blood_tests =>
      'Krvné testy sa zobrazia tu. Začni tlačidlom Pridať!';
  @override
  String get addBloodTest => 'Pridaj krvný test';
  @override
  String get editBloodTest => 'Upraviť krvný test';
  @override
  String get newBloodTest => 'Nový krvný test';
  @override
  String get deleteBloodTest => 'Vymazať krvný test?';
  @override
  String get estradiolLevelLabel => 'Hodnota estradiolu';
  @override
  String get testosteroneLevelLabel => 'Hodnota testosterónu';
  @override
  String get bloodTestDateLabel => 'Dátum krvného testu';
  @override
  String chartNowConcentration({required Object value}) => 'Teraz ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies => 'Žiadne zásoby. Pridaj vybavenie pre začatie.';
  @override
  String get newItem => 'Nové vybavenie';
  @override
  String get adminRoute => 'Spôsob podávania';
  @override
  String get totalAmount => 'Celkové množstvo';
  @override
  String get concentration => 'Koncentrácia';
  @override
  String get editItem => 'Uprav vybavenie';
  @override
  String get usedAmount => 'Použité množstvo';
  @override
  String deleteItem({required Object name}) => 'Vymazať ${name}?';
  @override
  String remaining({required num amount, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        amount,
        few: 'Zostávajú ${amount} ${unit}',
        other: 'Zostáva ${amount} ${unit}',
      );
  @override
  String get supplyType => 'Typ';
  @override
  String get syringe => 'Striekačky';
  @override
  String get wipe => 'Utierky';
  @override
  String get needle => 'Ihly';
  @override
  String get gloves => 'Rukavice';
  @override
  String get bandage => 'Náplasti';
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'Zostáva 1 striekačka',
        few: 'Zostávajú ${count} striekačky',
        other: 'Zostáva ${count} striekačiek',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'Zostáva 1 utierka',
        few: 'Zostávajú ${count} utierky',
        other: 'Zostáva ${count} utierok',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'Zostáva 1 ihla',
        few: 'Zostávajú ${count} ihly',
        other: 'Zostáva ${count} ihiel',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'Zostáva 1 rukavica',
        few: 'Zostávajú ${count} rukavice',
        other: 'Zostáva ${count} rukavíc',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'Zostáva 1 náplasť',
        few: 'Zostávajú ${count} náplaste',
        other: 'Zostáva ${count} náplastí',
      );
  @override
  String get add => 'Pridať';
  @override
  String get save => 'Uložiť';
  @override
  String get cancel => 'Zrušiť';
  @override
  String get next => 'Ďalej';
  @override
  String get delete => 'Vymazať';
  @override
  String get deleteElement => 'Vymazať toto vybavenie?';
  @override
  String get irreversibleAction => 'Tento úkon je nezvratný.';
  @override
  String get name => 'Meno';
  @override
  String get molecule => 'Molekula';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Estradiol';
  @override
  String get progesterone => 'Progesterón';
  @override
  String get testosterone => 'Testosterón';
  @override
  String get nandrolone => 'Nandrolón';
  @override
  String get dihydrotestosterone => 'Dihydrotestosterón';
  @override
  String get spironolactone => 'Spironolaktón';
  @override
  String get cyproteroneAcetate => 'Cyproterón acetát';
  @override
  String get leuprorelinAcetate => 'Leuprorelin acetát';
  @override
  String get bicalutamide => 'Bicalutamide';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloxifene';
  @override
  String get tamoxifen => 'Tamoxifen';
  @override
  String get finasteride => 'Finasterid';
  @override
  String get dutasteride => 'Dutasterid';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazón';
  @override
  String get enanthate => 'Enantát';
  @override
  String get valerate => 'Valerát';
  @override
  String get cypionate => 'Cypionát';
  @override
  String get undecylate => 'Undecylát';
  @override
  String get benzoate => 'Benzoát';
  @override
  String get cypionateSuspension => 'suspenzia cypionátu';
  @override
  String get medicationEstradiolEnanthate => 'Estradiol enantát';
  @override
  String get medicationEstradiolValerate => 'Estradiol valerát';
  @override
  String get medicationEstradiolCypionate => 'Estradiol cypionát';
  @override
  String get medicationEstradiolUndecylate => 'Estradiol undecylát';
  @override
  String get medicationEstradiolBenzoate => 'Estradiol benzoát';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Estradiolová suspenzia cypionátu';
  @override
  String get medicationTestosteroneEnanthate => 'Testosterón enantát';
  @override
  String get medicationTestosteroneValerate => 'Testosterón valerát';
  @override
  String get medicationTestosteroneCypionate => 'Testosterón cypionát';
  @override
  String get medicationTestosteroneUndecylate => 'Testosterón undecylát';
  @override
  String get medicationTestosteroneBenzoate => 'Testosterón benzoát';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Testosterónová suspenzia cypionátu';
  @override
  String get injection => 'Injekcia';
  @override
  String get oral => 'Orálne podanie';
  @override
  String get sublingual => 'Sublinguálne podanie';
  @override
  String get patch => 'Náplasť';
  @override
  String get gel => 'Gél';
  @override
  String get implant => 'Implantát';
  @override
  String get suppository => 'Čapík';
  @override
  String get transdermalSpray => 'Transdermálny sprej';
  @override
  String get transdermalDrops => 'Transdermálne kvapky';
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
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'pilulka',
        few: 'pilulky',
        other: 'piluliek',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'náplasť',
        few: 'náplasti',
        other: 'náplastí',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'stlačenie',
        few: 'stlačenia',
        other: 'stlačení',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'implantát',
        few: 'implantáty',
        other: 'implantátov',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'čapík',
        few: 'čapíky',
        other: 'čapíkov',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
        count,
        one: 'sprej',
        few: 'spreje',
        other: 'sprejov',
      );
  @override
  String get injectionSideLeft => 'Vľavo';
  @override
  String get injectionSideRight => 'Vpravo';
  @override
  String get intakeSummaryInjectionSideLeft => 'Ľavá strana';
  @override
  String get intakeSummaryInjectionSideRight => 'Pravá strana';
  @override
  String get requiredField => 'Požadované políčko';
  @override
  String get mustBePositiveNumber => 'Musí byť kladné číslo';
  @override
  String get invalidTotalAmount => 'Nesprávne celkové množstvo';
  @override
  String get cannotExceedTotalCapacity => 'Nemôže presahovať celkové množstvo';
}

/// The flat map containing all translations for locale <sk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsSk {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Dávky',
      'nav_levels' => 'Hodnoty',
      'nav_supplies' => 'Zásoby',
      'takeAnIntake' => 'Vziať dávku',
      'addAnItem' => 'Pridaj vybavenie',
      'empty_home' => 'Začni pridaním plánu v nastaveniach',
      'allDone' => 'Hotovo!',
      'noIntakesDue' => 'Dnes nie sú naplánované žiadne dávky',
      'upcoming' => 'Nadchádzajúce',
      'taken' => 'Vzaté',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            other: 'Pred ${count} dňami',
          ),
      'yesterday' => 'včera',
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            few: 'o ${count} dni',
            other: 'o ${count} dní',
          ),
      'tomorrow' => 'zajtra',
      'lastTaken' => 'Vzatá naposledy',
      'neverTakenYet' => 'Nevzatá nikdy',
      'scheduleFrequencyDaily' => 'Každý deň',
      'scheduleFrequencyEveryNDays' => ({required num days}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            days,
            few: 'Každé ${days} dni',
            other: 'Každých ${days} dní',
          ),
      'scheduleFrequencyInterval' => 'Interval',
      'scheduleFrequencyWeekly' => 'Týždenne',
      'newUpdateAvailable' => 'Je k dispozícii nová aktualizácia!',
      'goToSettings' => 'Ísť do nastavení',
      'settingsTitle' => 'Nastavenia',
      'notifications' => 'Notifikácie',
      'schedulesAndNotifications' => 'Plány & notifikácie',
      'general' => 'Všeobecné',
      'schedules' => 'Plány',
      'noSchedules' => 'Žiadne plány',
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'Vytvorený ${count} plán',
            few: 'Vytvorené ${count} plány',
            other: 'Vytvorených ${count} plánov',
          ),
      'language' => 'Jazyk',
      'languageFollowDevice' => 'Jazyk podľa zariadenia',
      'selectLanguage' => 'Vyber jazyk',
      'enableNotifications' => 'Zapni notifikácie',
      'enableNotificationsDescription' => 'Posielať pripomienky',
      'notificationsDisabledTitle' => 'Notifikácie sú vypnuté',
      'clickToOpenSettings' => 'Klikni pre otvorenie nastavení',
      'exactRemindersDisabled' => 'Presné časy pripomienok sú vypnuté',
      'remindersDelayed' =>
        'Pripomienky môžu byť jemne oneskorené. Klikni pre otvorenie nastavení.',
      'autoUpdate' => 'Automatické aktualizácie',
      'autoUpdateDescription' =>
        'Automaticky skontrolovať najnovšie aktualizácie pre otvorení apky',
      'checkForUpdates' => 'Skontrolovať aktualizácie',
      'checkForUpdatesDescription' =>
        'Skontrolovať najnovšiu verziu manuálne\nTáto akcia ťa pripojí na internet.\n(Žiadne dáta nebudú odoslané)',
      'appVersion' => ({required Object version}) => 'Mona verzia ${version}',
      'backupSavedTo' => ({required Object path}) => 'Záloha uložená: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Export dát sa nepodaril: ${error}',
      'importDataTitle' => 'Import dát',
      'importDataSubtitle' => 'Obnoviť dáta pomocou JSON zálohy',
      'importDataOverwriteWarning' =>
        'Týmto sa všetky tvoje dáta prepíšu zálohou. Túto akciu nie je možné vrátiť späť. Chceš pokračovať?',
      'importConfirm' => 'Import',
      'importSuccessfulTitle' => 'Import úspešný',
      'importRestartRequired' =>
        'Prosím reštartuj apku pre načítanie importovaných dát.',
      'closeApp' => 'Zavrieť apku',
      'importFailed' => ({required Object error}) =>
          'Import sa nepodaril: ${error}',
      'updates' => 'Aktualizácie',
      'dataManagement' => 'Správa dát',
      'exportDataTitle' => 'Export dát',
      'exportDataSubtitle' => 'Ulož svoje dáta do JSON súboru',
      'units' => 'Jednotky',
      'updateNoCompatibleApk' =>
        'Pre tvoje zariadenie nebola nájdená kompatibilná aktualizácia.',
      'updateAppUpToDate' => 'Tvoja apka má najnovšiu aktualizáciu!',
      'updateCheckNetworkError' => 'Nebolo možné skontrolovať aktualizácie.',
      'updateDialogTitle' => 'Dostupná aktualizácia',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Verzia ${latest} je dostupná! (Súčasná: ${current})\n\nAktualizácia kompatibilná s tvojím zariadením je pripravená na inštaláciu.',
      'updateDownloadAndInstall' => 'Stiahni & nainštaluj',
      'updateInstallPermissionRequired' =>
        'Pre inštaláciu aktualizácií je potrebné povolenie.',
      'updateDownloadingTitle' => 'Sťahovanie aktualizácie...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Nepodarilo sa otvoriť inštalátor: ${message}',
      'updateDownloadFailed' =>
        'Sťahovanie sa nepodarilo. Prosím skontroluj svoje pripojenie.',
      'notificationMedicationReminderTitle' => (
              {required Object scheduleName}) =>
          'Prišiel čas si vziať ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Naplánovaná na ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Naplánovaná na ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Naplánovaná na ${weekday}',
      'addSchedule' => 'Pridaj plán',
      'addScheduleToGetStarted' => 'Pridaj plán pre začatie.',
      'newSchedule' => 'Nový plán',
      'every' => 'Každých',
      'days' => 'dní',
      'startDate' => 'Dátum začiatku',
      'pickATime' => 'Vyber čas',
      'addIntakeTime' => 'Pridaj čas',
      'editScheduleInfo' => 'Upraviť detaily plánu',
      'scheduling' => 'Plánovanie',
      'noNotifications' => 'Žiadne notifikácie',
      'notificationsCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: '${count} notifikácia',
            few: '${count} notifikácie',
            other: '${count} notifikácií',
          ),
      'editSchedule' => 'Upraviť plán',
      'deleteSchedule' => ({required Object name}) => 'Vymazať ${name}?',
      'scheduleNotifications' => 'Notifikácie plánu',
      'addNotification' => 'Pridaj notifikáciu',
      'noNotificationsForSchedule' => ({required Object scheduleName}) =>
          'Žiadne notifikácie pre ${scheduleName}. Stlač tlačidlo Pridaj.',
      'notificationsUpdated' => 'Notifikácie boli aktualizované!',
      'notificationsUpdatedDescription' =>
        'Každý plán má teraz vlastné notifikácie.\n\nZapni si notifikácie pre svoje plány, aby ti nič neušlo.',
      'dontShowAgain' => 'Nezobrazovať znovu',
      'scheduleSettings' => 'Nastavenia plánu',
      'empty_intakes' => 'Vzaté dávky sa zobrazia tu',
      'chooseSchedule' => 'Vyber plán',
      'addSchedulesFirst' => 'Najprv pridaj plány.',
      'editIntake' => 'Uprav dávku',
      'date' => 'Dátum',
      'amount' => 'Množstvo',
      'takenAmount' => 'Užité množstvo',
      'wastedAmount' => 'Stratené množstvo',
      'none' => 'Žiadna',
      'supplyItem' => 'Zásoba',
      'injectionSide' => 'Strana injekcie',
      'deleteIntake' => 'Vymazať túto dávku?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Vezmi ${scheduleName}',
      'takeIntake' => 'Vezmi dávku',
      'intakeRecorded' => 'Dávka zaznamenaná',
      'needleDeadSpace' => 'Mŕtvy priestor ihly',
      'notes' => 'Poznámky',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'empty_levels' => 'Estradiolové injekcie sa zobrazia na tejto karte',
      'bloodTestsTitle' => 'Krvné testy',
      'empty_blood_tests' =>
        'Krvné testy sa zobrazia tu. Začni tlačidlom Pridať!',
      'addBloodTest' => 'Pridaj krvný test',
      'editBloodTest' => 'Upraviť krvný test',
      'newBloodTest' => 'Nový krvný test',
      'deleteBloodTest' => 'Vymazať krvný test?',
      'estradiolLevelLabel' => 'Hodnota estradiolu',
      'testosteroneLevelLabel' => 'Hodnota testosterónu',
      'bloodTestDateLabel' => 'Dátum krvného testu',
      'chartNowConcentration' => ({required Object value}) => 'Teraz ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'empty_supplies' => 'Žiadne zásoby. Pridaj vybavenie pre začatie.',
      'newItem' => 'Nové vybavenie',
      'adminRoute' => 'Spôsob podávania',
      'totalAmount' => 'Celkové množstvo',
      'concentration' => 'Koncentrácia',
      'editItem' => 'Uprav vybavenie',
      'usedAmount' => 'Použité množstvo',
      'deleteItem' => ({required Object name}) => 'Vymazať ${name}?',
      'remaining' => ({required num amount, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            amount,
            few: 'Zostávajú ${amount} ${unit}',
            other: 'Zostáva ${amount} ${unit}',
          ),
      'supplyType' => 'Typ',
      'syringe' => 'Striekačky',
      'wipe' => 'Utierky',
      'needle' => 'Ihly',
      'gloves' => 'Rukavice',
      'bandage' => 'Náplasti',
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'Zostáva 1 striekačka',
            few: 'Zostávajú ${count} striekačky',
            other: 'Zostáva ${count} striekačiek',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'Zostáva 1 utierka',
            few: 'Zostávajú ${count} utierky',
            other: 'Zostáva ${count} utierok',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'Zostáva 1 ihla',
            few: 'Zostávajú ${count} ihly',
            other: 'Zostáva ${count} ihiel',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'Zostáva 1 rukavica',
            few: 'Zostávajú ${count} rukavice',
            other: 'Zostáva ${count} rukavíc',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'Zostáva 1 náplasť',
            few: 'Zostávajú ${count} náplaste',
            other: 'Zostáva ${count} náplastí',
          ),
      'add' => 'Pridať',
      'save' => 'Uložiť',
      'cancel' => 'Zrušiť',
      'next' => 'Ďalej',
      'delete' => 'Vymazať',
      'deleteElement' => 'Vymazať toto vybavenie?',
      'irreversibleAction' => 'Tento úkon je nezvratný.',
      'name' => 'Meno',
      'molecule' => 'Molekula',
      'ester' => 'Ester',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesterón',
      'testosterone' => 'Testosterón',
      'nandrolone' => 'Nandrolón',
      'dihydrotestosterone' => 'Dihydrotestosterón',
      'spironolactone' => 'Spironolaktón',
      'cyproteroneAcetate' => 'Cyproterón acetát',
      'leuprorelinAcetate' => 'Leuprorelin acetát',
      'bicalutamide' => 'Bicalutamide',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloxifene',
      'tamoxifen' => 'Tamoxifen',
      'finasteride' => 'Finasterid',
      'dutasteride' => 'Dutasterid',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazón',
      'enanthate' => 'Enantát',
      'valerate' => 'Valerát',
      'cypionate' => 'Cypionát',
      'undecylate' => 'Undecylát',
      'benzoate' => 'Benzoát',
      'cypionateSuspension' => 'suspenzia cypionátu',
      'medicationEstradiolEnanthate' => 'Estradiol enantát',
      'medicationEstradiolValerate' => 'Estradiol valerát',
      'medicationEstradiolCypionate' => 'Estradiol cypionát',
      'medicationEstradiolUndecylate' => 'Estradiol undecylát',
      'medicationEstradiolBenzoate' => 'Estradiol benzoát',
      'medicationEstradiolCypionateSuspension' =>
        'Estradiolová suspenzia cypionátu',
      'medicationTestosteroneEnanthate' => 'Testosterón enantát',
      'medicationTestosteroneValerate' => 'Testosterón valerát',
      'medicationTestosteroneCypionate' => 'Testosterón cypionát',
      'medicationTestosteroneUndecylate' => 'Testosterón undecylát',
      'medicationTestosteroneBenzoate' => 'Testosterón benzoát',
      'medicationTestosteroneCypionateSuspension' =>
        'Testosterónová suspenzia cypionátu',
      'injection' => 'Injekcia',
      'oral' => 'Orálne podanie',
      'sublingual' => 'Sublinguálne podanie',
      'patch' => 'Náplasť',
      'gel' => 'Gél',
      'implant' => 'Implantát',
      'suppository' => 'Čapík',
      'transdermalSpray' => 'Transdermálny sprej',
      'transdermalDrops' => 'Transdermálne kvapky',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'pilulka',
            few: 'pilulky',
            other: 'piluliek',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'náplasť',
            few: 'náplasti',
            other: 'náplastí',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'stlačenie',
            few: 'stlačenia',
            other: 'stlačení',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'implantát',
            few: 'implantáty',
            other: 'implantátov',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'čapík',
            few: 'čapíky',
            other: 'čapíkov',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('sk'))(
            count,
            one: 'sprej',
            few: 'spreje',
            other: 'sprejov',
          ),
      'injectionSideLeft' => 'Vľavo',
      'injectionSideRight' => 'Vpravo',
      'intakeSummaryInjectionSideLeft' => 'Ľavá strana',
      'intakeSummaryInjectionSideRight' => 'Pravá strana',
      'requiredField' => 'Požadované políčko',
      'mustBePositiveNumber' => 'Musí byť kladné číslo',
      'invalidTotalAmount' => 'Nesprávne celkové množstvo',
      'cannotExceedTotalCapacity' => 'Nemôže presahovať celkové množstvo',
      _ => null,
    };
  }
}
