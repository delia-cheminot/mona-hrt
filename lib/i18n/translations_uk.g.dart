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
class TranslationsUk extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsUk(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.uk,
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

  /// Metadata for the translations of <uk>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsUk _root = this; // ignore: unused_field

  @override
  TranslationsUk $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsUk(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Прийоми';
  @override
  String get nav_levels => 'Рівні';
  @override
  String get nav_supplies => 'Препарати';
  @override
  String get takeAnIntake => 'Прийняти препарат';
  @override
  String get addAnItem => 'Додати елемент';
  @override
  String get empty_home => 'Почніть з додавання розкладу в Налаштуваннях';
  @override
  String get allDone => 'Все прийнято!';
  @override
  String get noIntakesDue => 'На сьогодні все прийнято';
  @override
  String get upcoming => 'Найближче';
  @override
  String get taken => 'Прийнято';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        few: '${count} дні тому',
        other: '${count} днів тому',
      );
  @override
  String get yesterday => 'вчора';
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        few: 'через ${count} дні',
        many: 'через ${count} днів',
        other: 'через ${count} днів',
      );
  @override
  String get tomorrow => 'завтра';
  @override
  String get lastTaken => 'Востаннє прийнято';
  @override
  String get neverTakenYet => 'Ще не приймалось';
  @override
  String get scheduleFrequencyDaily => 'Щодня';
  @override
  String scheduleFrequencyEveryNDays({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        days,
        other: 'Кожні ${days} днів',
      );
  @override
  String get scheduleFrequencyInterval => 'Інтервал';
  @override
  String get scheduleFrequencyWeekly => 'Щотижня';
  @override
  String get newUpdateAvailable => 'Нове оновлення!';
  @override
  String get goToSettings => 'Перейти в Налаштування';
  @override
  String get settingsTitle => 'Налаштування';
  @override
  String get notifications => 'Сповіщення';
  @override
  String get schedulesAndNotifications => 'Розклади та Сповіщення';
  @override
  String get general => 'Загальне';
  @override
  String get schedules => 'Розклад';
  @override
  String get noSchedules => 'Розкладів немає';
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'Створено ${count} розклад',
        few: 'Створено ${count} розклади',
        other: 'Створено ${count} розкладів',
      );
  @override
  String get language => 'Мова';
  @override
  String get languageFollowDevice => 'Мова пристрою';
  @override
  String get selectLanguage => 'Вибрати мову';
  @override
  String get enableNotifications => 'Увімкнути сповіщення';
  @override
  String get enableNotificationsDescription => 'Надсилати нагадування';
  @override
  String get notificationsDisabledTitle => 'Сповіщення вимкнено';
  @override
  String get clickToOpenSettings => 'Натисніть для відкриття налаштувань';
  @override
  String get exactRemindersDisabled => 'Точний час нагадувань вимкнено';
  @override
  String get remindersDelayed =>
      'Нагадування можуть злегка затримуватись. Натисніть щоб відкрити сповіщення.';
  @override
  String get autoUpdate => 'Само-Оновлення';
  @override
  String get autoUpdateDescription =>
      'Самочинно перевіряти на оновлення коли застосунок запущено';
  @override
  String get checkForUpdates => 'Перевірити на оновлення';
  @override
  String get checkForUpdatesDescription =>
      'Перевірити на наявність крайньої версії вручну\nЦе підключить вас до мережі\n(Жодних даних не буде надіслано)';
  @override
  String appVersion({required Object version}) => 'Версія Mona - ${version}';
  @override
  String backupSavedTo({required Object path}) => 'Бекап збережено до: ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Не вдалося експортувати: ${error}';
  @override
  String get importDataTitle => 'Імпортувати дані';
  @override
  String get importDataSubtitle => 'Відновити дані з JSON бекапу';
  @override
  String get importDataOverwriteWarning =>
      'Бекап перепише усі ваші поточні дані. Цю дію неможливо скасувати. Продовжити?';
  @override
  String get importConfirm => 'Імпорт';
  @override
  String get importSuccessfulTitle => 'Успішно імпортовано';
  @override
  String get importRestartRequired =>
      'Будь ласка, перезапустіть застосунок для застосування відновлених даних.';
  @override
  String get closeApp => 'Закрити Застосунок';
  @override
  String importFailed({required Object error}) => 'Невдача: ${error}';
  @override
  String get updates => 'Оновлення';
  @override
  String get dataManagement => 'Керування даними';
  @override
  String get exportDataTitle => 'Експортувати дані';
  @override
  String get exportDataSubtitle => 'Зберегти дані в JSON файл';
  @override
  String get units => 'Одиниці виміру';
  @override
  String get updateNoCompatibleApk =>
      'Сумісних оновлень для вашого пристрою не знайдено.';
  @override
  String get updateAppUpToDate => 'Ваш застосунок останньої версії!';
  @override
  String get updateCheckNetworkError => 'Невдалося перевірити на оновлення.';
  @override
  String get updateDialogTitle => 'Доступне оновлення';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Версія ${latest} доступна! (Поточна: ${current})\n\nОновлення, сумісне з вашим пристроєм, готове до завантаження!.';
  @override
  String get updateDownloadAndInstall => 'Завантажити та встановити';
  @override
  String get updateInstallPermissionRequired =>
      'Надайте дозвіл для встановлення оновлення.';
  @override
  String get updateDownloadingTitle => 'Встановлюємо оновлення...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Невдалося відкрити встановлювач: ${message}';
  @override
  String get updateDownloadFailed =>
      'Завантаження невдалося. Будь ласка, перевірте вашу мережу..';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Час прийняти ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Заплановано на ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Заплановано на ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Заплановано на ${weekday}';
  @override
  String get addSchedule => 'Додати розклад';
  @override
  String get addScheduleToGetStarted => 'Додайте розклад щоб почати.';
  @override
  String get newSchedule => 'Новий розклад';
  @override
  String get every => 'Кожні';
  @override
  String get days => 'дні';
  @override
  String get startDate => 'Дата початку';
  @override
  String get pickATime => 'Вибрати час';
  @override
  String get addIntakeTime => 'Додати час';
  @override
  String get editScheduleInfo => 'Виправити інформацію';
  @override
  String get scheduling => 'Планування';
  @override
  String get noNotifications => 'Сповіщення відсутні';
  @override
  String notificationsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        other: '${count} сповіщень',
      );
  @override
  String get editSchedule => 'Змінити розклад';
  @override
  String deleteSchedule({required Object name}) => 'Видалити ${name}?';
  @override
  String get scheduleNotifications => 'Сповіщення розкладу';
  @override
  String get addNotification => 'Додати сповіщення';
  @override
  String noNotificationsForSchedule({required Object scheduleName}) =>
      'Сповіщення для ${scheduleName} відсутні. Натисніть Додати.';
  @override
  String get notificationsUpdated => 'Оновлено сповіщення!';
  @override
  String get notificationsUpdatedDescription =>
      'Кожний розклад тепер має свої сповіщення.\n\nБажано увімкнути сповіщення для ваших розкладів щоб нічого не пропустити.';
  @override
  String get dontShowAgain => 'Більше не показувати';
  @override
  String get scheduleSettings => 'Налаштування розкладу';
  @override
  String get empty_intakes => 'Прийняті дози відображатимуться тут';
  @override
  String get chooseSchedule => 'Вибрати розклад';
  @override
  String get addSchedulesFirst => 'Спочатку додайте розклади.';
  @override
  String get editIntake => 'Редагування прийому';
  @override
  String get date => 'Дата';
  @override
  String get amount => 'Кількість';
  @override
  String get takenAmount => 'Прийнята кількість';
  @override
  String get wastedAmount => 'Втрачена кількість';
  @override
  String get none => 'Відсутнє';
  @override
  String get supplyItem => 'Препарат';
  @override
  String get injectionSide => 'Сторона';
  @override
  String get deleteIntake => 'Видалити прийом?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Прийняти ${scheduleName}';
  @override
  String get takeIntake => 'Прийняти препарат';
  @override
  String get intakeRecorded => 'Прийом записано';
  @override
  String get needleDeadSpace => 'Мертва зона голки';
  @override
  String get notes => 'Примітки';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get empty_levels => 'Ін\'єкції відображатимуться тут';
  @override
  String get bloodTestsTitle => 'Аналізи крові';
  @override
  String get empty_blood_tests =>
      'Висновки з аналізів крові з\'являтимуться тут. Натисніть Додати!';
  @override
  String get addBloodTest => 'Додати аналіз крові';
  @override
  String get editBloodTest => 'Редагувати аналіз крові';
  @override
  String get newBloodTest => 'Новий аналіз крові';
  @override
  String get deleteBloodTest => 'Видалити аналіз?';
  @override
  String get estradiolLevelLabel => 'Рівень Естрадіолу';
  @override
  String get testosteroneLevelLabel => 'Рівень Тестостерону';
  @override
  String get bloodTestDateLabel => 'Дата аналізу';
  @override
  String chartNowConcentration({required Object value}) => 'Поточна ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies => 'Додайте препарат, щоб почати.';
  @override
  String get newItem => 'Новий препарат';
  @override
  String get adminRoute => 'Шлях введення';
  @override
  String get totalAmount => 'Загальна кількість';
  @override
  String get concentration => 'Насиченість';
  @override
  String get editItem => 'Змінити';
  @override
  String get usedAmount => 'Використано';
  @override
  String deleteItem({required Object name}) => 'Видалити ${name}?';
  @override
  String remaining({required num amount, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        amount,
        other: '${amount} ${unit} залишилось',
      );
  @override
  String get supplyType => 'Тип';
  @override
  String get syringe => 'Шприци';
  @override
  String get wipe => 'Серветки';
  @override
  String get needle => 'Голки';
  @override
  String get gloves => 'Рукавички';
  @override
  String get bandage => 'Пластирі';
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 шприц залишилось',
        few: '${count} шприца залишилось',
        other: '${count} шприців залишилось',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 серветка залишилось',
        few: '${count} серветки залишилось',
        other: '${count} серветок залишилось',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 голка залишилось',
        few: '${count} голки залишилось',
        other: '${count} голок залишилось',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 рукавичка залишилось',
        few: '${count} рукавички залишилось',
        other: '${count} рукавичок залишилось',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 пластир залишилось',
        few: '${count} пластирі залишилось',
        other: '${count} пластирів залишилось',
      );
  @override
  String get add => 'Додати';
  @override
  String get save => 'Зберегти';
  @override
  String get cancel => 'Скасувати';
  @override
  String get next => 'Далі';
  @override
  String get delete => 'Видалити';
  @override
  String get deleteElement => 'Видалити цей елемент?';
  @override
  String get irreversibleAction => 'Цю дію неможливо скасувати.';
  @override
  String get name => 'Назва';
  @override
  String get molecule => 'Молекула';
  @override
  String get ester => 'Естер';
  @override
  String get estradiol => 'Естрадіол';
  @override
  String get progesterone => 'Прогестерон';
  @override
  String get testosterone => 'Тестостерон';
  @override
  String get nandrolone => 'Нандролон';
  @override
  String get dihydrotestosterone => 'Дигідротестостерон';
  @override
  String get spironolactone => 'Спіронолактон';
  @override
  String get cyproteroneAcetate => 'Ципротерон ацетат';
  @override
  String get leuprorelinAcetate => 'Лейпрорелін ацетат';
  @override
  String get bicalutamide => 'Бікалутамід';
  @override
  String get decapeptyl => 'Декапептил';
  @override
  String get raloxifene => 'Ралоксифен';
  @override
  String get tamoxifen => 'Тамоксифен';
  @override
  String get finasteride => 'Фінастерид';
  @override
  String get dutasteride => 'Дутастерид';
  @override
  String get minoxidil => 'Міноксидил';
  @override
  String get pioglitazone => 'Піоґлітазон';
  @override
  String get enanthate => 'Енантат';
  @override
  String get valerate => 'Валерат';
  @override
  String get cypionate => 'Ципіонат';
  @override
  String get undecylate => 'Ундецилат';
  @override
  String get benzoate => 'Бензоат';
  @override
  String get cypionateSuspension => 'Суспенція Ципіонату';
  @override
  String get medicationEstradiolEnanthate => 'Естрадіол енантат';
  @override
  String get medicationEstradiolValerate => 'Естрадіол валерат';
  @override
  String get medicationEstradiolCypionate => 'Естрадіол ципіонат';
  @override
  String get medicationEstradiolUndecylate => 'Естрадіол ундецилат';
  @override
  String get medicationEstradiolBenzoate => 'Естрадіол бензоат';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Естрадіол суспенція ципіонату';
  @override
  String get medicationTestosteroneEnanthate => 'Тестостерон енантат';
  @override
  String get medicationTestosteroneValerate => 'Тестостерон валерат';
  @override
  String get medicationTestosteroneCypionate => 'Тестостерон ципіонат';
  @override
  String get medicationTestosteroneUndecylate => 'Тестостерон ундецилат';
  @override
  String get medicationTestosteroneBenzoate => 'Тестостерон бензоат';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Тестостерон суспенція ципіонату';
  @override
  String get injection => 'Ін\'єкції';
  @override
  String get oral => 'Орально';
  @override
  String get sublingual => 'Під\'язиково';
  @override
  String get patch => 'Патч';
  @override
  String get gel => 'Гель';
  @override
  String get implant => 'Імплант';
  @override
  String get suppository => 'Супозиторій';
  @override
  String get transdermalSpray => 'Трансдермальний спрей';
  @override
  String get transdermalDrops => 'Трансдермальні краплі';
  @override
  String get unitMilligram => 'мг';
  @override
  String get unitPgPerMl => 'пг/мл';
  @override
  String get unitPmolPerL => 'пмоль/л';
  @override
  String get unitNgPerDl => 'нг/дл';
  @override
  String get unitNmolPerL => 'нмоль/л';
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'пігулка',
        few: 'пігулки',
        other: 'пігулок',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'патч',
        few: 'патчі',
        other: 'патчів',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'натискання',
        few: 'натискання',
        other: 'натискань',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'імплант',
        few: 'імпланти',
        other: 'імплантів',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'супозиторій',
        few: 'супозиторії',
        other: 'супозиторіїв',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'спрей',
        few: 'спреї',
        other: 'спреїв',
      );
  @override
  String get injectionSideLeft => 'Ліва';
  @override
  String get injectionSideRight => 'Права';
  @override
  String get intakeSummaryInjectionSideLeft => 'Ліва сторона';
  @override
  String get intakeSummaryInjectionSideRight => 'Права сторона';
  @override
  String get requiredField => 'Обов\'язкове поле';
  @override
  String get mustBePositiveNumber => 'Має бути додатнім числом';
  @override
  String get invalidTotalAmount => 'Невірна сумарна кількість';
  @override
  String get cannotExceedTotalCapacity =>
      'Не може перевищувати загальну ємність';
}

/// The flat map containing all translations for locale <uk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsUk {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Прийоми',
      'nav_levels' => 'Рівні',
      'nav_supplies' => 'Препарати',
      'takeAnIntake' => 'Прийняти препарат',
      'addAnItem' => 'Додати елемент',
      'empty_home' => 'Почніть з додавання розкладу в Налаштуваннях',
      'allDone' => 'Все прийнято!',
      'noIntakesDue' => 'На сьогодні все прийнято',
      'upcoming' => 'Найближче',
      'taken' => 'Прийнято',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            few: '${count} дні тому',
            other: '${count} днів тому',
          ),
      'yesterday' => 'вчора',
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            few: 'через ${count} дні',
            many: 'через ${count} днів',
            other: 'через ${count} днів',
          ),
      'tomorrow' => 'завтра',
      'lastTaken' => 'Востаннє прийнято',
      'neverTakenYet' => 'Ще не приймалось',
      'scheduleFrequencyDaily' => 'Щодня',
      'scheduleFrequencyEveryNDays' => ({required num days}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            days,
            other: 'Кожні ${days} днів',
          ),
      'scheduleFrequencyInterval' => 'Інтервал',
      'scheduleFrequencyWeekly' => 'Щотижня',
      'newUpdateAvailable' => 'Нове оновлення!',
      'goToSettings' => 'Перейти в Налаштування',
      'settingsTitle' => 'Налаштування',
      'notifications' => 'Сповіщення',
      'schedulesAndNotifications' => 'Розклади та Сповіщення',
      'general' => 'Загальне',
      'schedules' => 'Розклад',
      'noSchedules' => 'Розкладів немає',
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'Створено ${count} розклад',
            few: 'Створено ${count} розклади',
            other: 'Створено ${count} розкладів',
          ),
      'language' => 'Мова',
      'languageFollowDevice' => 'Мова пристрою',
      'selectLanguage' => 'Вибрати мову',
      'enableNotifications' => 'Увімкнути сповіщення',
      'enableNotificationsDescription' => 'Надсилати нагадування',
      'notificationsDisabledTitle' => 'Сповіщення вимкнено',
      'clickToOpenSettings' => 'Натисніть для відкриття налаштувань',
      'exactRemindersDisabled' => 'Точний час нагадувань вимкнено',
      'remindersDelayed' =>
        'Нагадування можуть злегка затримуватись. Натисніть щоб відкрити сповіщення.',
      'autoUpdate' => 'Само-Оновлення',
      'autoUpdateDescription' =>
        'Самочинно перевіряти на оновлення коли застосунок запущено',
      'checkForUpdates' => 'Перевірити на оновлення',
      'checkForUpdatesDescription' =>
        'Перевірити на наявність крайньої версії вручну\nЦе підключить вас до мережі\n(Жодних даних не буде надіслано)',
      'appVersion' => ({required Object version}) => 'Версія Mona - ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Бекап збережено до: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Не вдалося експортувати: ${error}',
      'importDataTitle' => 'Імпортувати дані',
      'importDataSubtitle' => 'Відновити дані з JSON бекапу',
      'importDataOverwriteWarning' =>
        'Бекап перепише усі ваші поточні дані. Цю дію неможливо скасувати. Продовжити?',
      'importConfirm' => 'Імпорт',
      'importSuccessfulTitle' => 'Успішно імпортовано',
      'importRestartRequired' =>
        'Будь ласка, перезапустіть застосунок для застосування відновлених даних.',
      'closeApp' => 'Закрити Застосунок',
      'importFailed' => ({required Object error}) => 'Невдача: ${error}',
      'updates' => 'Оновлення',
      'dataManagement' => 'Керування даними',
      'exportDataTitle' => 'Експортувати дані',
      'exportDataSubtitle' => 'Зберегти дані в JSON файл',
      'units' => 'Одиниці виміру',
      'updateNoCompatibleApk' =>
        'Сумісних оновлень для вашого пристрою не знайдено.',
      'updateAppUpToDate' => 'Ваш застосунок останньої версії!',
      'updateCheckNetworkError' => 'Невдалося перевірити на оновлення.',
      'updateDialogTitle' => 'Доступне оновлення',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Версія ${latest} доступна! (Поточна: ${current})\n\nОновлення, сумісне з вашим пристроєм, готове до завантаження!.',
      'updateDownloadAndInstall' => 'Завантажити та встановити',
      'updateInstallPermissionRequired' =>
        'Надайте дозвіл для встановлення оновлення.',
      'updateDownloadingTitle' => 'Встановлюємо оновлення...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Невдалося відкрити встановлювач: ${message}',
      'updateDownloadFailed' =>
        'Завантаження невдалося. Будь ласка, перевірте вашу мережу..',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Час прийняти ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Заплановано на ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Заплановано на ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Заплановано на ${weekday}',
      'addSchedule' => 'Додати розклад',
      'addScheduleToGetStarted' => 'Додайте розклад щоб почати.',
      'newSchedule' => 'Новий розклад',
      'every' => 'Кожні',
      'days' => 'дні',
      'startDate' => 'Дата початку',
      'pickATime' => 'Вибрати час',
      'addIntakeTime' => 'Додати час',
      'editScheduleInfo' => 'Виправити інформацію',
      'scheduling' => 'Планування',
      'noNotifications' => 'Сповіщення відсутні',
      'notificationsCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            other: '${count} сповіщень',
          ),
      'editSchedule' => 'Змінити розклад',
      'deleteSchedule' => ({required Object name}) => 'Видалити ${name}?',
      'scheduleNotifications' => 'Сповіщення розкладу',
      'addNotification' => 'Додати сповіщення',
      'noNotificationsForSchedule' => ({required Object scheduleName}) =>
          'Сповіщення для ${scheduleName} відсутні. Натисніть Додати.',
      'notificationsUpdated' => 'Оновлено сповіщення!',
      'notificationsUpdatedDescription' =>
        'Кожний розклад тепер має свої сповіщення.\n\nБажано увімкнути сповіщення для ваших розкладів щоб нічого не пропустити.',
      'dontShowAgain' => 'Більше не показувати',
      'scheduleSettings' => 'Налаштування розкладу',
      'empty_intakes' => 'Прийняті дози відображатимуться тут',
      'chooseSchedule' => 'Вибрати розклад',
      'addSchedulesFirst' => 'Спочатку додайте розклади.',
      'editIntake' => 'Редагування прийому',
      'date' => 'Дата',
      'amount' => 'Кількість',
      'takenAmount' => 'Прийнята кількість',
      'wastedAmount' => 'Втрачена кількість',
      'none' => 'Відсутнє',
      'supplyItem' => 'Препарат',
      'injectionSide' => 'Сторона',
      'deleteIntake' => 'Видалити прийом?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Прийняти ${scheduleName}',
      'takeIntake' => 'Прийняти препарат',
      'intakeRecorded' => 'Прийом записано',
      'needleDeadSpace' => 'Мертва зона голки',
      'notes' => 'Примітки',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'empty_levels' => 'Ін\'єкції відображатимуться тут',
      'bloodTestsTitle' => 'Аналізи крові',
      'empty_blood_tests' =>
        'Висновки з аналізів крові з\'являтимуться тут. Натисніть Додати!',
      'addBloodTest' => 'Додати аналіз крові',
      'editBloodTest' => 'Редагувати аналіз крові',
      'newBloodTest' => 'Новий аналіз крові',
      'deleteBloodTest' => 'Видалити аналіз?',
      'estradiolLevelLabel' => 'Рівень Естрадіолу',
      'testosteroneLevelLabel' => 'Рівень Тестостерону',
      'bloodTestDateLabel' => 'Дата аналізу',
      'chartNowConcentration' => ({required Object value}) =>
          'Поточна ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'empty_supplies' => 'Додайте препарат, щоб почати.',
      'newItem' => 'Новий препарат',
      'adminRoute' => 'Шлях введення',
      'totalAmount' => 'Загальна кількість',
      'concentration' => 'Насиченість',
      'editItem' => 'Змінити',
      'usedAmount' => 'Використано',
      'deleteItem' => ({required Object name}) => 'Видалити ${name}?',
      'remaining' => ({required num amount, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            amount,
            other: '${amount} ${unit} залишилось',
          ),
      'supplyType' => 'Тип',
      'syringe' => 'Шприци',
      'wipe' => 'Серветки',
      'needle' => 'Голки',
      'gloves' => 'Рукавички',
      'bandage' => 'Пластирі',
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 шприц залишилось',
            few: '${count} шприца залишилось',
            other: '${count} шприців залишилось',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 серветка залишилось',
            few: '${count} серветки залишилось',
            other: '${count} серветок залишилось',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 голка залишилось',
            few: '${count} голки залишилось',
            other: '${count} голок залишилось',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 рукавичка залишилось',
            few: '${count} рукавички залишилось',
            other: '${count} рукавичок залишилось',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 пластир залишилось',
            few: '${count} пластирі залишилось',
            other: '${count} пластирів залишилось',
          ),
      'add' => 'Додати',
      'save' => 'Зберегти',
      'cancel' => 'Скасувати',
      'next' => 'Далі',
      'delete' => 'Видалити',
      'deleteElement' => 'Видалити цей елемент?',
      'irreversibleAction' => 'Цю дію неможливо скасувати.',
      'name' => 'Назва',
      'molecule' => 'Молекула',
      'ester' => 'Естер',
      'estradiol' => 'Естрадіол',
      'progesterone' => 'Прогестерон',
      'testosterone' => 'Тестостерон',
      'nandrolone' => 'Нандролон',
      'dihydrotestosterone' => 'Дигідротестостерон',
      'spironolactone' => 'Спіронолактон',
      'cyproteroneAcetate' => 'Ципротерон ацетат',
      'leuprorelinAcetate' => 'Лейпрорелін ацетат',
      'bicalutamide' => 'Бікалутамід',
      'decapeptyl' => 'Декапептил',
      'raloxifene' => 'Ралоксифен',
      'tamoxifen' => 'Тамоксифен',
      'finasteride' => 'Фінастерид',
      'dutasteride' => 'Дутастерид',
      'minoxidil' => 'Міноксидил',
      'pioglitazone' => 'Піоґлітазон',
      'enanthate' => 'Енантат',
      'valerate' => 'Валерат',
      'cypionate' => 'Ципіонат',
      'undecylate' => 'Ундецилат',
      'benzoate' => 'Бензоат',
      'cypionateSuspension' => 'Суспенція Ципіонату',
      'medicationEstradiolEnanthate' => 'Естрадіол енантат',
      'medicationEstradiolValerate' => 'Естрадіол валерат',
      'medicationEstradiolCypionate' => 'Естрадіол ципіонат',
      'medicationEstradiolUndecylate' => 'Естрадіол ундецилат',
      'medicationEstradiolBenzoate' => 'Естрадіол бензоат',
      'medicationEstradiolCypionateSuspension' =>
        'Естрадіол суспенція ципіонату',
      'medicationTestosteroneEnanthate' => 'Тестостерон енантат',
      'medicationTestosteroneValerate' => 'Тестостерон валерат',
      'medicationTestosteroneCypionate' => 'Тестостерон ципіонат',
      'medicationTestosteroneUndecylate' => 'Тестостерон ундецилат',
      'medicationTestosteroneBenzoate' => 'Тестостерон бензоат',
      'medicationTestosteroneCypionateSuspension' =>
        'Тестостерон суспенція ципіонату',
      'injection' => 'Ін\'єкції',
      'oral' => 'Орально',
      'sublingual' => 'Під\'язиково',
      'patch' => 'Патч',
      'gel' => 'Гель',
      'implant' => 'Імплант',
      'suppository' => 'Супозиторій',
      'transdermalSpray' => 'Трансдермальний спрей',
      'transdermalDrops' => 'Трансдермальні краплі',
      'unitMilligram' => 'мг',
      'unitPgPerMl' => 'пг/мл',
      'unitPmolPerL' => 'пмоль/л',
      'unitNgPerDl' => 'нг/дл',
      'unitNmolPerL' => 'нмоль/л',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'пігулка',
            few: 'пігулки',
            other: 'пігулок',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'патч',
            few: 'патчі',
            other: 'патчів',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'натискання',
            few: 'натискання',
            other: 'натискань',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'імплант',
            few: 'імпланти',
            other: 'імплантів',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'супозиторій',
            few: 'супозиторії',
            other: 'супозиторіїв',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'спрей',
            few: 'спреї',
            other: 'спреїв',
          ),
      'injectionSideLeft' => 'Ліва',
      'injectionSideRight' => 'Права',
      'intakeSummaryInjectionSideLeft' => 'Ліва сторона',
      'intakeSummaryInjectionSideRight' => 'Права сторона',
      'requiredField' => 'Обов\'язкове поле',
      'mustBePositiveNumber' => 'Має бути додатнім числом',
      'invalidTotalAmount' => 'Невірна сумарна кількість',
      'cannotExceedTotalCapacity' => 'Не може перевищувати загальну ємність',
      _ => null,
    };
  }
}
