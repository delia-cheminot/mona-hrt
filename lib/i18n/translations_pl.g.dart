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
class TranslationsPl extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPl(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.pl,
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

  /// Metadata for the translations of <pl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsPl _root = this; // ignore: unused_field

  @override
  TranslationsPl $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsPl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Przyjęcia';
  @override
  String get nav_levels => 'Poziomy';
  @override
  String get nav_supplies => 'Zapasy';
  @override
  String get takeAnIntake => 'Odnotuj przyjęcie';
  @override
  String get addAnItem => 'Dodaj przedmiot';
  @override
  String get empty_home => 'Rozpocznij od dodania harmonogramu w Ustawieniach';
  @override
  String get allDone => 'Wszystko gotowe!';
  @override
  String get noIntakesDue => 'Nie ma dziś żadnych przyjęć';
  @override
  String get upcoming => 'Nadchodzące';
  @override
  String get taken => 'Zażyte';
  @override
  String get appTitle => 'Mona';
  @override
  String get yesterday => 'wczoraj';
  @override
  String get tomorrow => 'jutro';
  @override
  String get lastTaken => 'Ostatnio przyjęte';
  @override
  String get neverTakenYet => 'Jeszcze nie przyjęto';
  @override
  String get scheduleFrequencyDaily => 'Codziennie';
  @override
  String get scheduleFrequencyInterval => 'Odstęp';
  @override
  String get scheduleFrequencyWeekly => 'Co tydzień';
  @override
  String get scheduleFrequencyMonthly => 'Co miesiąc';
  @override
  String get newUpdateAvailable => 'Dostępna jest nowa aktualizacja!';
  @override
  String get goToSettings => 'Przejdź do ustawień';
  @override
  String get settingsTitle => 'Ustawienia';
  @override
  String get notifications => 'Powiadomienia';
  @override
  String get schedulesAndNotifications => 'Harmonogramy i powiadomienia';
  @override
  String get general => 'Ogólne';
  @override
  String get schedules => 'Harmonogramy';
  @override
  String get noSchedules => 'Brak harmonogramów';
  @override
  String get language => 'Język';
  @override
  String get languageFollowDevice => 'Użyj języka urządzenia';
  @override
  String get selectLanguage => 'Wybierz język';
  @override
  String get enableNotifications => 'Włącz powiadomienia';
  @override
  String get enableNotificationsDescription => 'Wysyłaj przypomnienia';
  @override
  String get anchorToLastIntake => 'Przelicz na podstawie ostatniego przyjęcia';
  @override
  String get anchorToLastIntakeDescription =>
      'Planuje kolejne przyjęcie o pełny odstęp czasu od ostatniego przyjęcia';
  @override
  String get notificationsDisabledTitle => 'Powiadomienia są wyłączone';
  @override
  String get clickToOpenSettings => 'Kliknij, aby otworzyć ustawienia';
  @override
  String get exactRemindersDisabled =>
      'Dokładne godziny przypomnień są wyłączone';
  @override
  String get remindersDelayed =>
      'Przypomnienia mogą być nieznacznie opóźnione. Dotknij, aby otworzyć ustawienia.';
  @override
  String get medicalSettings => 'Ustawienia medyczne';
  @override
  String get theme => 'Motyw';
  @override
  String get themeCustomizeColors => 'Dostosuj kolory aplikacji';
  @override
  String get customThemeEnabled => 'Niestandardowy motyw';
  @override
  String get themeGenerate => 'Generuj';
  @override
  String get themeVariant => 'Wariant';
  @override
  String get themeContrast => 'Kontrast';
  @override
  String get themeContrastStandard => 'Standardowy';
  @override
  String get themeContrastMedium => 'Średni';
  @override
  String get themeContrastHigh => 'Wysoki';
  @override
  String get autoUpdate => 'Automatyczna aktualizacja';
  @override
  String get autoUpdateDescription =>
      'Automatycznie sprawdzaj aktualizacje przy uruchomieniu aplikacji';
  @override
  String get checkForUpdates => 'Sprawdź aktualizacje';
  @override
  String get checkForUpdatesDescription =>
      'Sprawdź ręcznie najnowszą wersję\nSpowoduje to połączenie z Internetem\n(Żadne dane nie zostaną wysłane)';
  @override
  String appVersion({required Object version}) => 'Mona wersja ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Kopia zapasowa zapisana w: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Eksport nie powiódł się: ${error}';
  @override
  String get importDataTitle => 'Importuj dane';
  @override
  String get importDataSubtitle => 'Przywróć dane z kopii zapasowej JSON';
  @override
  String get importDataOverwriteWarning =>
      'Spowoduje to nadpisanie wszystkich obecnych danych kopią zapasową. Tej czynności nie można cofnąć. Czy chcesz kontynuować?';
  @override
  String get importConfirm => 'Importuj';
  @override
  String get importSuccessfulTitle => 'Import zakończony powodzeniem';
  @override
  String get importRestartRequired =>
      'Uruchom aplikację ponownie, aby zastosować przywrócone dane.';
  @override
  String get closeApp => 'Zamknij aplikację';
  @override
  String importFailed({required Object error}) =>
      'Import nie powiódł się: ${error}';
  @override
  String get updates => 'Aktualizacje';
  @override
  String get dataManagement => 'Zarządzanie danymi';
  @override
  String get exportDataTitle => 'Eksportuj dane';
  @override
  String get exportDataSubtitle => 'Zapisz dane do pliku JSON';
  @override
  String get units => 'Jednostki';
  @override
  String get updateNoCompatibleApk =>
      'Nie znaleziono aktualizacji zgodnej z Twoim urządzeniem.';
  @override
  String get updateAppUpToDate => 'Twoja aplikacja jest aktualna!';
  @override
  String get updateCheckNetworkError =>
      'Nie można teraz sprawdzić dostępności aktualizacji.';
  @override
  String get updateDialogTitle => 'Dostępna aktualizacja';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Dostępna jest wersja ${latest}! (Obecna: ${current})\n\nAktualizacja zgodna z Twoim urządzeniem jest gotowa do zainstalowania.';
  @override
  String get updateDownloadAndInstall => 'Pobierz i zainstaluj';
  @override
  String get updateInstallPermissionRequired =>
      'Do zainstalowania aktualizacji wymagane jest uprawnienie.';
  @override
  String get updateDownloadingTitle => 'Pobieranie aktualizacji...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Nie udało się otworzyć instalatora: ${message}';
  @override
  String get updateDownloadFailed =>
      'Pobieranie nie powiodło się. Sprawdź połączenie.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Czas na ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Zaplanowano na ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Zaplanowano na ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Zaplanowano na ${weekday}';
  @override
  String get addSchedule => 'Dodaj harmonogram';
  @override
  String get addScheduleToGetStarted => 'Dodaj harmonogram, aby zacząć.';
  @override
  String get newSchedule => 'Nowy harmonogram';
  @override
  String get every => 'Co';
  @override
  String get days => 'dni';
  @override
  String get dayOfMonth => 'Dzień miesiąca';
  @override
  String get months => 'miesięcy';
  @override
  String get startDate => 'Data rozpoczęcia';
  @override
  String get pickATime => 'Wybierz godzinę';
  @override
  String get addIntakeTime => 'Dodaj godzinę';
  @override
  String get editScheduleInfo => 'Edytuj informacje o harmonogramie';
  @override
  String get scheduling => 'Harmonogram';
  @override
  String get editSchedule => 'Edytuj harmonogram';
  @override
  String deleteSchedule({required Object name}) => 'Usunąć ${name}?';
  @override
  String get addNotification => 'Dodaj powiadomienie';
  @override
  String get empty_intakes => 'Przyjęte dawki pojawią się tutaj';
  @override
  String get HrtCounter => 'Czas na HTZ';
  @override
  String get HrtCounterDescription =>
      'Pokazuje, jak długo jesteś na HTZ oraz łączną liczbę przyjęć';
  @override
  String get hrtWidgetPlaceholder =>
      'Otwórz Monę, aby odnotować pierwsze przyjęcie';
  @override
  String get hrtWidgetPreviewSample => 'Na HTZ od 8 miesięcy';
  @override
  String get hrtWidgetPreviewIntakeSample => 'Odnotowano 16 przyjęć';
  @override
  String get startOfDay => 'Początek dnia';
  @override
  String startOfDayDescription({required Object time}) =>
      'Czas przed godziną ${time} liczy się do poprzedniego dnia';
  @override
  String get chooseSchedule => 'Wybierz harmonogram';
  @override
  String get addSchedulesFirst => 'Najpierw dodaj harmonogramy.';
  @override
  String get editIntake => 'Edytuj przyjęcie';
  @override
  String get date => 'Data';
  @override
  String get amount => 'Ilość';
  @override
  String get takenAmount => 'Przyjęta ilość';
  @override
  String get wastedAmount => 'Zmarnowana ilość';
  @override
  String get none => 'Brak';
  @override
  String get supplyItem => 'Zapas';
  @override
  String get chooseItem => 'Wybierz przedmiot';
  @override
  String get noItemsToAdd => 'Brak dostępnych przedmiotów';
  @override
  String get injectionSide => 'Strona iniekcji';
  @override
  String get deleteIntake => 'Usunąć to przyjęcie?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Przyjmij ${scheduleName}';
  @override
  String get takeIntake => 'Odnotuj przyjęcie';
  @override
  String get intakeRecorded => 'Przyjęcie odnotowane';
  @override
  String get needleDeadSpace => 'Martwa przestrzeń igły';
  @override
  String get notes => 'Notatki';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Badania krwi';
  @override
  String get empty_blood_tests =>
      'Wykonane badania krwi pojawią się tutaj. Zacznij od przycisku Dodaj!';
  @override
  String get addBloodTest => 'Dodaj badanie krwi';
  @override
  String get editBloodTest => 'Edytuj badanie krwi';
  @override
  String get newBloodTest => 'Nowe badanie krwi';
  @override
  String get deleteBloodTest => 'Usunąć to badanie krwi?';
  @override
  String get estradiolLevelLabel => 'Poziom estradiolu';
  @override
  String get testosteroneLevelLabel => 'Poziom testosteronu';
  @override
  String get bloodTestDateLabel => 'Data badania';
  @override
  String chartNowConcentration({required Object value}) => 'Teraz ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies => 'Brak zapasów. Dodaj przedmiot, aby zacząć.';
  @override
  String get newItem => 'Nowy przedmiot';
  @override
  String get adminRoute => 'Droga podania';
  @override
  String get totalAmount => 'Łączna ilość';
  @override
  String get concentration => 'Stężenie';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dawka na ${unit}';
  @override
  String get editItem => 'Edytuj przedmiot';
  @override
  String get usedAmount => 'Zużyta ilość';
  @override
  String deleteItem({required Object name}) => 'Usunąć ${name}?';
  @override
  String get allItemsFilter => 'Wszystkie';
  @override
  String get medicationItemsFilter => 'Leki';
  @override
  String get genericItems => 'Materiały zużywalne';
  @override
  String get medicationItemType => 'Lek';
  @override
  String get genericItemType => 'Materiał zużywalny';
  @override
  String get supplyType => 'Typ';
  @override
  String get syringe => 'Strzykawki';
  @override
  String get wipe => 'Chusteczki';
  @override
  String get needle => 'Igły';
  @override
  String get gloves => 'Rękawiczki';
  @override
  String get bandage => 'Bandaże';
  @override
  String get add => 'Dodaj';
  @override
  String get save => 'Zapisz';
  @override
  String get cancel => 'Anuluj';
  @override
  String get next => 'Dalej';
  @override
  String get delete => 'Usuń';
  @override
  String get deleteElement => 'Usunąć ten element?';
  @override
  String get irreversibleAction => 'Tej czynności nie można cofnąć.';
  @override
  String get name => 'Nazwa';
  @override
  String get molecule => 'Molekuła';
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
  String get spironolactone => 'Spironolakton';
  @override
  String get cyproteroneAcetate => 'Octan cyproteronu';
  @override
  String get leuprorelinAcetate => 'Octan leuproreliny';
  @override
  String get bicalutamide => 'Bikalutamid';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloksyfen';
  @override
  String get tamoxifen => 'Tamoksyfen';
  @override
  String get finasteride => 'Finasteryd';
  @override
  String get dutasteride => 'Dutasteryd';
  @override
  String get minoxidil => 'Minoksydyl';
  @override
  String get pioglitazone => 'Pioglitazon';
  @override
  String get enanthate => 'Enantan';
  @override
  String get valerate => 'Walerianian';
  @override
  String get cypionate => 'Cypionian';
  @override
  String get undecylate => 'Undecylan';
  @override
  String get benzoate => 'Benzoesan';
  @override
  String get cypionateSuspension => 'Zawiesina cypionianu';
  @override
  String get medicationEstradiolEnanthate => 'Enantan estradiolu';
  @override
  String get medicationEstradiolValerate => 'Walerianian estradiolu';
  @override
  String get medicationEstradiolCypionate => 'Cypionian estradiolu';
  @override
  String get medicationEstradiolUndecylate => 'Undecylan estradiolu';
  @override
  String get medicationEstradiolBenzoate => 'Benzoesan estradiolu';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Zawiesina cypionianu estradiolu';
  @override
  String get medicationTestosteroneEnanthate => 'Enantan testosteronu';
  @override
  String get medicationTestosteroneValerate => 'Walerianian testosteronu';
  @override
  String get medicationTestosteroneCypionate => 'Cypionian testosteronu';
  @override
  String get medicationTestosteroneUndecylate => 'Undecylan testosteronu';
  @override
  String get medicationTestosteroneBenzoate => 'Benzoesan testosteronu';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Zawiesina cypionianu testosteronu';
  @override
  String get injection => 'Iniekcja';
  @override
  String get oral => 'Doustnie';
  @override
  String get sublingual => 'Podjęzykowo';
  @override
  String get patch => 'Plaster';
  @override
  String get gel => 'Żel';
  @override
  String get implant => 'Implant';
  @override
  String get suppository => 'Czopek';
  @override
  String get transdermalSpray => 'Spray przezskórny';
  @override
  String get transdermalDrops => 'Krople przezskórne';
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
  String get injectionSideLeft => 'Lewa';
  @override
  String get injectionSideRight => 'Prawa';
  @override
  String get placementLeft => 'Lewa strona';
  @override
  String get placementRight => 'Prawa strona';
  @override
  String get placementLeftThigh => 'Lewe udo';
  @override
  String get placementRightThigh => 'Prawe udo';
  @override
  String get placementLeftArm => 'Lewe ramię';
  @override
  String get placementRightArm => 'Prawe ramię';
  @override
  String get placementLeftButtock => 'Lewy pośladek';
  @override
  String get placementRightButtock => 'Prawy pośladek';
  @override
  String get placementLeftAbdomen => 'Lewa część brzucha';
  @override
  String get placementRightAbdomen => 'Prawa część brzucha';
  @override
  String get injectionSites => 'Miejsca iniekcji';
  @override
  String get injectionSitesDescription =>
      'Zarządzaj miejscami, między którymi rotujesz';
  @override
  String get addInjectionSite => 'Dodaj miejsce';
  @override
  String get customSiteLabel => 'Własna nazwa miejsca';
  @override
  String get noInjectionSitesYet => 'Brak miejsc';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Dodaj miejsce poniżej, aby zacząć.';
  @override
  String get placementSuggestionPerScheduleTitle =>
      'Sugeruj według harmonogramu';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Opieraj sugestię kolejnego miejsca wyłącznie na historii tego harmonogramu.';
  @override
  String get requiredField => 'Pole wymagane';
  @override
  String get mustBePositiveNumber => 'Musi być liczbą dodatnią';
  @override
  String get mustBeBetween1And28 => 'Musi być liczbą od 1 do 28';
  @override
  String get invalidTotalAmount => 'Nieprawidłowa łączna ilość';
  @override
  String get cannotExceedTotalCapacity =>
      'Nie może przekraczać całkowitej pojemności';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: '${count} dzień temu',
        few: '${count} dni temu',
        many: '${count} dni temu',
        other: '${count} dni temu',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'za ${count} dzień',
        few: 'za ${count} dni',
        many: 'za ${count} dni',
        other: 'za ${count} dni',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Co dzień',
        few: 'Co ${count} dni',
        many: 'Co ${count} dni',
        other: 'Co ${count} dni',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Dzień ${day}, co miesiąc',
        few: 'Dzień ${day}, co ${count} miesiące',
        many: 'Dzień ${day}, co ${count} miesięcy',
        other: 'Dzień ${day}, co ${count} miesięcy',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Utworzono: ${count}',
        few: 'Utworzono: ${count}',
        many: 'Utworzono: ${count}',
        other: 'Utworzono: ${count}',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Na HTZ od 1 dnia',
        few: 'Na HTZ od ${count} dni',
        many: 'Na HTZ od ${count} dni',
        other: 'Na HTZ od ${count} dni',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Na HTZ od 1 tygodnia',
        few: 'Na HTZ od ${count} tygodni',
        many: 'Na HTZ od ${count} tygodni',
        other: 'Na HTZ od ${count} tygodni',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Na HTZ od 1 miesiąca',
        few: 'Na HTZ od ${count} miesięcy',
        many: 'Na HTZ od ${count} miesięcy',
        other: 'Na HTZ od ${count} miesięcy',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Na HTZ od 1 roku',
        few: 'Na HTZ od ${count} lat',
        many: 'Na HTZ od ${count} lat',
        other: 'Na HTZ od ${count} lat',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Odnotowano 1 przyjęcie',
        few: 'Odnotowano ${count} przyjęcia',
        many: 'Odnotowano ${count} przyjęć',
        other: 'Odnotowano ${count} przyjęć',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pozostało: ${count} ${unit}',
        few: 'Pozostało: ${count} ${unit}',
        many: 'Pozostało: ${count} ${unit}',
        other: 'Pozostało: ${count} ${unit}',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pozostało: 1 strzykawka',
        few: 'Pozostało: ${count} strzykawki',
        many: 'Pozostało: ${count} strzykawek',
        other: 'Pozostało: ${count} strzykawek',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pozostało: 1 chusteczka',
        few: 'Pozostało: ${count} chusteczki',
        many: 'Pozostało: ${count} chusteczek',
        other: 'Pozostało: ${count} chusteczek',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pozostało: 1 igła',
        few: 'Pozostało: ${count} igły',
        many: 'Pozostało: ${count} igieł',
        other: 'Pozostało: ${count} igieł',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pozostało: 1 rękawiczka',
        few: 'Pozostało: ${count} rękawiczki',
        many: 'Pozostało: ${count} rękawiczek',
        other: 'Pozostało: ${count} rękawiczek',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'Pozostało: 1 bandaż',
        few: 'Pozostało: ${count} bandaże',
        many: 'Pozostało: ${count} bandaży',
        other: 'Pozostało: ${count} bandaży',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'ml',
        few: 'ml',
        many: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'tabletka',
        few: 'tabletki',
        many: 'tabletek',
        other: 'tabletek',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'plaster',
        few: 'plastry',
        many: 'plastrów',
        other: 'plastrów',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'pompka',
        few: 'pompki',
        many: 'pompek',
        other: 'pompek',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'implant',
        few: 'implanty',
        many: 'implantów',
        other: 'implantów',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'czopek',
        few: 'czopki',
        many: 'czopków',
        other: 'czopków',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
        count,
        one: 'spryśnięcie',
        few: 'spryśnięcia',
        many: 'spryśnięć',
        other: 'spryśnięć',
      );
}

/// The flat map containing all translations for locale <pl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPl {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'nav_home' => 'Mona',
      'nav_intakes' => 'Przyjęcia',
      'nav_levels' => 'Poziomy',
      'nav_supplies' => 'Zapasy',
      'takeAnIntake' => 'Odnotuj przyjęcie',
      'addAnItem' => 'Dodaj przedmiot',
      'empty_home' => 'Rozpocznij od dodania harmonogramu w Ustawieniach',
      'allDone' => 'Wszystko gotowe!',
      'noIntakesDue' => 'Nie ma dziś żadnych przyjęć',
      'upcoming' => 'Nadchodzące',
      'taken' => 'Zażyte',
      'appTitle' => 'Mona',
      'yesterday' => 'wczoraj',
      'tomorrow' => 'jutro',
      'lastTaken' => 'Ostatnio przyjęte',
      'neverTakenYet' => 'Jeszcze nie przyjęto',
      'scheduleFrequencyDaily' => 'Codziennie',
      'scheduleFrequencyInterval' => 'Odstęp',
      'scheduleFrequencyWeekly' => 'Co tydzień',
      'scheduleFrequencyMonthly' => 'Co miesiąc',
      'newUpdateAvailable' => 'Dostępna jest nowa aktualizacja!',
      'goToSettings' => 'Przejdź do ustawień',
      'settingsTitle' => 'Ustawienia',
      'notifications' => 'Powiadomienia',
      'schedulesAndNotifications' => 'Harmonogramy i powiadomienia',
      'general' => 'Ogólne',
      'schedules' => 'Harmonogramy',
      'noSchedules' => 'Brak harmonogramów',
      'language' => 'Język',
      'languageFollowDevice' => 'Użyj języka urządzenia',
      'selectLanguage' => 'Wybierz język',
      'enableNotifications' => 'Włącz powiadomienia',
      'enableNotificationsDescription' => 'Wysyłaj przypomnienia',
      'anchorToLastIntake' => 'Przelicz na podstawie ostatniego przyjęcia',
      'anchorToLastIntakeDescription' =>
        'Planuje kolejne przyjęcie o pełny odstęp czasu od ostatniego przyjęcia',
      'notificationsDisabledTitle' => 'Powiadomienia są wyłączone',
      'clickToOpenSettings' => 'Kliknij, aby otworzyć ustawienia',
      'exactRemindersDisabled' => 'Dokładne godziny przypomnień są wyłączone',
      'remindersDelayed' =>
        'Przypomnienia mogą być nieznacznie opóźnione. Dotknij, aby otworzyć ustawienia.',
      'medicalSettings' => 'Ustawienia medyczne',
      'theme' => 'Motyw',
      'themeCustomizeColors' => 'Dostosuj kolory aplikacji',
      'customThemeEnabled' => 'Niestandardowy motyw',
      'themeGenerate' => 'Generuj',
      'themeVariant' => 'Wariant',
      'themeContrast' => 'Kontrast',
      'themeContrastStandard' => 'Standardowy',
      'themeContrastMedium' => 'Średni',
      'themeContrastHigh' => 'Wysoki',
      'autoUpdate' => 'Automatyczna aktualizacja',
      'autoUpdateDescription' =>
        'Automatycznie sprawdzaj aktualizacje przy uruchomieniu aplikacji',
      'checkForUpdates' => 'Sprawdź aktualizacje',
      'checkForUpdatesDescription' =>
        'Sprawdź ręcznie najnowszą wersję\nSpowoduje to połączenie z Internetem\n(Żadne dane nie zostaną wysłane)',
      'appVersion' => ({required Object version}) => 'Mona wersja ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Kopia zapasowa zapisana w: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Eksport nie powiódł się: ${error}',
      'importDataTitle' => 'Importuj dane',
      'importDataSubtitle' => 'Przywróć dane z kopii zapasowej JSON',
      'importDataOverwriteWarning' =>
        'Spowoduje to nadpisanie wszystkich obecnych danych kopią zapasową. Tej czynności nie można cofnąć. Czy chcesz kontynuować?',
      'importConfirm' => 'Importuj',
      'importSuccessfulTitle' => 'Import zakończony powodzeniem',
      'importRestartRequired' =>
        'Uruchom aplikację ponownie, aby zastosować przywrócone dane.',
      'closeApp' => 'Zamknij aplikację',
      'importFailed' => ({required Object error}) =>
          'Import nie powiódł się: ${error}',
      'updates' => 'Aktualizacje',
      'dataManagement' => 'Zarządzanie danymi',
      'exportDataTitle' => 'Eksportuj dane',
      'exportDataSubtitle' => 'Zapisz dane do pliku JSON',
      'units' => 'Jednostki',
      'updateNoCompatibleApk' =>
        'Nie znaleziono aktualizacji zgodnej z Twoim urządzeniem.',
      'updateAppUpToDate' => 'Twoja aplikacja jest aktualna!',
      'updateCheckNetworkError' =>
        'Nie można teraz sprawdzić dostępności aktualizacji.',
      'updateDialogTitle' => 'Dostępna aktualizacja',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Dostępna jest wersja ${latest}! (Obecna: ${current})\n\nAktualizacja zgodna z Twoim urządzeniem jest gotowa do zainstalowania.',
      'updateDownloadAndInstall' => 'Pobierz i zainstaluj',
      'updateInstallPermissionRequired' =>
        'Do zainstalowania aktualizacji wymagane jest uprawnienie.',
      'updateDownloadingTitle' => 'Pobieranie aktualizacji...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Nie udało się otworzyć instalatora: ${message}',
      'updateDownloadFailed' =>
        'Pobieranie nie powiodło się. Sprawdź połączenie.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Czas na ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Zaplanowano na ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Zaplanowano na ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Zaplanowano na ${weekday}',
      'addSchedule' => 'Dodaj harmonogram',
      'addScheduleToGetStarted' => 'Dodaj harmonogram, aby zacząć.',
      'newSchedule' => 'Nowy harmonogram',
      'every' => 'Co',
      'days' => 'dni',
      'dayOfMonth' => 'Dzień miesiąca',
      'months' => 'miesięcy',
      'startDate' => 'Data rozpoczęcia',
      'pickATime' => 'Wybierz godzinę',
      'addIntakeTime' => 'Dodaj godzinę',
      'editScheduleInfo' => 'Edytuj informacje o harmonogramie',
      'scheduling' => 'Harmonogram',
      'editSchedule' => 'Edytuj harmonogram',
      'deleteSchedule' => ({required Object name}) => 'Usunąć ${name}?',
      'addNotification' => 'Dodaj powiadomienie',
      'empty_intakes' => 'Przyjęte dawki pojawią się tutaj',
      'HrtCounter' => 'Czas na HTZ',
      'HrtCounterDescription' =>
        'Pokazuje, jak długo jesteś na HTZ oraz łączną liczbę przyjęć',
      'hrtWidgetPlaceholder' => 'Otwórz Monę, aby odnotować pierwsze przyjęcie',
      'hrtWidgetPreviewSample' => 'Na HTZ od 8 miesięcy',
      'hrtWidgetPreviewIntakeSample' => 'Odnotowano 16 przyjęć',
      'startOfDay' => 'Początek dnia',
      'startOfDayDescription' => ({required Object time}) =>
          'Czas przed godziną ${time} liczy się do poprzedniego dnia',
      'chooseSchedule' => 'Wybierz harmonogram',
      'addSchedulesFirst' => 'Najpierw dodaj harmonogramy.',
      'editIntake' => 'Edytuj przyjęcie',
      'date' => 'Data',
      'amount' => 'Ilość',
      'takenAmount' => 'Przyjęta ilość',
      'wastedAmount' => 'Zmarnowana ilość',
      'none' => 'Brak',
      'supplyItem' => 'Zapas',
      'chooseItem' => 'Wybierz przedmiot',
      'noItemsToAdd' => 'Brak dostępnych przedmiotów',
      'injectionSide' => 'Strona iniekcji',
      'deleteIntake' => 'Usunąć to przyjęcie?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Przyjmij ${scheduleName}',
      'takeIntake' => 'Odnotuj przyjęcie',
      'intakeRecorded' => 'Przyjęcie odnotowane',
      'needleDeadSpace' => 'Martwa przestrzeń igły',
      'notes' => 'Notatki',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Badania krwi',
      'empty_blood_tests' =>
        'Wykonane badania krwi pojawią się tutaj. Zacznij od przycisku Dodaj!',
      'addBloodTest' => 'Dodaj badanie krwi',
      'editBloodTest' => 'Edytuj badanie krwi',
      'newBloodTest' => 'Nowe badanie krwi',
      'deleteBloodTest' => 'Usunąć to badanie krwi?',
      'estradiolLevelLabel' => 'Poziom estradiolu',
      'testosteroneLevelLabel' => 'Poziom testosteronu',
      'bloodTestDateLabel' => 'Data badania',
      'chartNowConcentration' => ({required Object value}) => 'Teraz ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Brak zapasów. Dodaj przedmiot, aby zacząć.',
      'newItem' => 'Nowy przedmiot',
      'adminRoute' => 'Droga podania',
      'totalAmount' => 'Łączna ilość',
      'concentration' => 'Stężenie',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dawka na ${unit}',
      'editItem' => 'Edytuj przedmiot',
      'usedAmount' => 'Zużyta ilość',
      'deleteItem' => ({required Object name}) => 'Usunąć ${name}?',
      'allItemsFilter' => 'Wszystkie',
      'medicationItemsFilter' => 'Leki',
      'genericItems' => 'Materiały zużywalne',
      'medicationItemType' => 'Lek',
      'genericItemType' => 'Materiał zużywalny',
      'supplyType' => 'Typ',
      'syringe' => 'Strzykawki',
      'wipe' => 'Chusteczki',
      'needle' => 'Igły',
      'gloves' => 'Rękawiczki',
      'bandage' => 'Bandaże',
      'add' => 'Dodaj',
      'save' => 'Zapisz',
      'cancel' => 'Anuluj',
      'next' => 'Dalej',
      'delete' => 'Usuń',
      'deleteElement' => 'Usunąć ten element?',
      'irreversibleAction' => 'Tej czynności nie można cofnąć.',
      'name' => 'Nazwa',
      'molecule' => 'Molekuła',
      'ester' => 'Ester',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesteron',
      'testosterone' => 'Testosteron',
      'nandrolone' => 'Nandrolon',
      'dihydrotestosterone' => 'Dihydrotestosteron',
      'spironolactone' => 'Spironolakton',
      'cyproteroneAcetate' => 'Octan cyproteronu',
      'leuprorelinAcetate' => 'Octan leuproreliny',
      'bicalutamide' => 'Bikalutamid',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloksyfen',
      'tamoxifen' => 'Tamoksyfen',
      'finasteride' => 'Finasteryd',
      'dutasteride' => 'Dutasteryd',
      'minoxidil' => 'Minoksydyl',
      'pioglitazone' => 'Pioglitazon',
      'enanthate' => 'Enantan',
      'valerate' => 'Walerianian',
      'cypionate' => 'Cypionian',
      'undecylate' => 'Undecylan',
      'benzoate' => 'Benzoesan',
      'cypionateSuspension' => 'Zawiesina cypionianu',
      'medicationEstradiolEnanthate' => 'Enantan estradiolu',
      'medicationEstradiolValerate' => 'Walerianian estradiolu',
      'medicationEstradiolCypionate' => 'Cypionian estradiolu',
      'medicationEstradiolUndecylate' => 'Undecylan estradiolu',
      'medicationEstradiolBenzoate' => 'Benzoesan estradiolu',
      'medicationEstradiolCypionateSuspension' =>
        'Zawiesina cypionianu estradiolu',
      'medicationTestosteroneEnanthate' => 'Enantan testosteronu',
      'medicationTestosteroneValerate' => 'Walerianian testosteronu',
      'medicationTestosteroneCypionate' => 'Cypionian testosteronu',
      'medicationTestosteroneUndecylate' => 'Undecylan testosteronu',
      'medicationTestosteroneBenzoate' => 'Benzoesan testosteronu',
      'medicationTestosteroneCypionateSuspension' =>
        'Zawiesina cypionianu testosteronu',
      'injection' => 'Iniekcja',
      'oral' => 'Doustnie',
      'sublingual' => 'Podjęzykowo',
      'patch' => 'Plaster',
      'gel' => 'Żel',
      'implant' => 'Implant',
      'suppository' => 'Czopek',
      'transdermalSpray' => 'Spray przezskórny',
      'transdermalDrops' => 'Krople przezskórne',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'injectionSideLeft' => 'Lewa',
      'injectionSideRight' => 'Prawa',
      'placementLeft' => 'Lewa strona',
      'placementRight' => 'Prawa strona',
      'placementLeftThigh' => 'Lewe udo',
      'placementRightThigh' => 'Prawe udo',
      'placementLeftArm' => 'Lewe ramię',
      'placementRightArm' => 'Prawe ramię',
      'placementLeftButtock' => 'Lewy pośladek',
      'placementRightButtock' => 'Prawy pośladek',
      'placementLeftAbdomen' => 'Lewa część brzucha',
      'placementRightAbdomen' => 'Prawa część brzucha',
      'injectionSites' => 'Miejsca iniekcji',
      'injectionSitesDescription' =>
        'Zarządzaj miejscami, między którymi rotujesz',
      'addInjectionSite' => 'Dodaj miejsce',
      'customSiteLabel' => 'Własna nazwa miejsca',
      'noInjectionSitesYet' => 'Brak miejsc',
      'noInjectionAddOneToGetStarted' => 'Dodaj miejsce poniżej, aby zacząć.',
      'placementSuggestionPerScheduleTitle' => 'Sugeruj według harmonogramu',
      'placementSuggestionPerScheduleDescription' =>
        'Opieraj sugestię kolejnego miejsca wyłącznie na historii tego harmonogramu.',
      'requiredField' => 'Pole wymagane',
      'mustBePositiveNumber' => 'Musi być liczbą dodatnią',
      'mustBeBetween1And28' => 'Musi być liczbą od 1 do 28',
      'invalidTotalAmount' => 'Nieprawidłowa łączna ilość',
      'cannotExceedTotalCapacity' =>
        'Nie może przekraczać całkowitej pojemności',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: '${count} dzień temu',
            few: '${count} dni temu',
            many: '${count} dni temu',
            other: '${count} dni temu',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'za ${count} dzień',
            few: 'za ${count} dni',
            many: 'za ${count} dni',
            other: 'za ${count} dni',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Co dzień',
            few: 'Co ${count} dni',
            many: 'Co ${count} dni',
            other: 'Co ${count} dni',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Dzień ${day}, co miesiąc',
            few: 'Dzień ${day}, co ${count} miesiące',
            many: 'Dzień ${day}, co ${count} miesięcy',
            other: 'Dzień ${day}, co ${count} miesięcy',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Utworzono: ${count}',
            few: 'Utworzono: ${count}',
            many: 'Utworzono: ${count}',
            other: 'Utworzono: ${count}',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Na HTZ od 1 dnia',
            few: 'Na HTZ od ${count} dni',
            many: 'Na HTZ od ${count} dni',
            other: 'Na HTZ od ${count} dni',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Na HTZ od 1 tygodnia',
            few: 'Na HTZ od ${count} tygodni',
            many: 'Na HTZ od ${count} tygodni',
            other: 'Na HTZ od ${count} tygodni',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Na HTZ od 1 miesiąca',
            few: 'Na HTZ od ${count} miesięcy',
            many: 'Na HTZ od ${count} miesięcy',
            other: 'Na HTZ od ${count} miesięcy',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Na HTZ od 1 roku',
            few: 'Na HTZ od ${count} lat',
            many: 'Na HTZ od ${count} lat',
            other: 'Na HTZ od ${count} lat',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Odnotowano 1 przyjęcie',
            few: 'Odnotowano ${count} przyjęcia',
            many: 'Odnotowano ${count} przyjęć',
            other: 'Odnotowano ${count} przyjęć',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Pozostało: ${count} ${unit}',
            few: 'Pozostało: ${count} ${unit}',
            many: 'Pozostało: ${count} ${unit}',
            other: 'Pozostało: ${count} ${unit}',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Pozostało: 1 strzykawka',
            few: 'Pozostało: ${count} strzykawki',
            many: 'Pozostało: ${count} strzykawek',
            other: 'Pozostało: ${count} strzykawek',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Pozostało: 1 chusteczka',
            few: 'Pozostało: ${count} chusteczki',
            many: 'Pozostało: ${count} chusteczek',
            other: 'Pozostało: ${count} chusteczek',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Pozostało: 1 igła',
            few: 'Pozostało: ${count} igły',
            many: 'Pozostało: ${count} igieł',
            other: 'Pozostało: ${count} igieł',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Pozostało: 1 rękawiczka',
            few: 'Pozostało: ${count} rękawiczki',
            many: 'Pozostało: ${count} rękawiczek',
            other: 'Pozostało: ${count} rękawiczek',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'Pozostało: 1 bandaż',
            few: 'Pozostało: ${count} bandaże',
            many: 'Pozostało: ${count} bandaży',
            other: 'Pozostało: ${count} bandaży',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'ml',
            few: 'ml',
            many: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'tabletka',
            few: 'tabletki',
            many: 'tabletek',
            other: 'tabletek',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'plaster',
            few: 'plastry',
            many: 'plastrów',
            other: 'plastrów',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'pompka',
            few: 'pompki',
            many: 'pompek',
            other: 'pompek',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'implant',
            few: 'implanty',
            many: 'implantów',
            other: 'implantów',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'czopek',
            few: 'czopki',
            many: 'czopków',
            other: 'czopków',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pl'))(
            count,
            one: 'spryśnięcie',
            few: 'spryśnięcia',
            many: 'spryśnięć',
            other: 'spryśnięć',
          ),
      _ => null,
    };
  }
}
