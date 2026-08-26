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
  String get yesterday => 'вчора';
  @override
  String get tomorrow => 'завтра';
  @override
  String get lastTaken => 'Востаннє прийнято';
  @override
  String get neverTakenYet => 'Ще не приймалось';
  @override
  String get scheduleFrequencyDaily => 'Щодня';
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
      'Версія ${latest} доступна! (Поточна: ${current})\n\nОновлення, сумісне з вашим пристроєм, готове до завантаження!';
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
      'Завантаження не вдалося. Будь ласка, перевірте вашу мережу.';
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
  String get editSchedule => 'Змінити розклад';
  @override
  String deleteSchedule({required Object name}) => 'Видалити ${name}?';
  @override
  String get addNotification => 'Додати сповіщення';
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
  String chartLevelTooltip({required Object date, required Object level}) =>
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
      'Суспензія естрадіолу ципіонату';
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
      'Суспензія тестостерону ципіонату';
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
  String get injectionSideLeft => 'Ліва';
  @override
  String get injectionSideRight => 'Права';
  @override
  String get placementLeft => 'Ліва сторона';
  @override
  String get placementRight => 'Права сторона';
  @override
  String get requiredField => 'Обов\'язкове поле';
  @override
  String get mustBePositiveNumber => 'Має бути додатнім числом';
  @override
  String get invalidTotalAmount => 'Невірна сумарна кількість';
  @override
  String get cannotExceedTotalCapacity =>
      'Не може перевищувати загальну ємність';
  @override
  String get scheduleFrequencyMonthly => 'Щомісяця';
  @override
  String get anchorToLastIntake =>
      'Перераховувати на основі останнього прийому';
  @override
  String get anchorToLastIntakeDescription =>
      'Планує наступний прийом через повний інтервал після останнього прийому';
  @override
  String get medicalSettings => 'Медичні налаштування';
  @override
  String get theme => 'Тема';
  @override
  String get themeCustomizeColors => 'Налаштуйте кольори застосунку';
  @override
  String get customThemeEnabled => 'Власна тема';
  @override
  String get themeGenerate => 'Згенерувати';
  @override
  String get themeVariant => 'Варіант';
  @override
  String get themeContrast => 'Контраст';
  @override
  String get themeContrastStandard => 'Стандартний';
  @override
  String get themeContrastMedium => 'Середній';
  @override
  String get themeContrastHigh => 'Високий';
  @override
  String get dayOfMonth => 'День місяця';
  @override
  String get months => 'місяців';
  @override
  String get HrtCounter => 'Час на ЗГТ';
  @override
  String get HrtCounterDescription =>
      'Показує, скільки часу ви на ЗГТ, і загальну кількість прийомів';
  @override
  String get hrtWidgetPlaceholder =>
      'Відкрийте Mona, щоб записати перший прийом';
  @override
  String get hrtWidgetPreviewSample => 'На ЗГТ вже 8 місяців';
  @override
  String get hrtWidgetPreviewIntakeSample => 'Записано 16 прийомів';
  @override
  String get startOfDay => 'Початок дня';
  @override
  String startOfDayDescription({required Object time}) =>
      'Час до ${time} зараховується до попереднього дня';
  @override
  String get chooseItem => 'Виберіть препарат';
  @override
  String get noItemsToAdd => 'Немає доступних препаратів';
  @override
  String concentrationLabelPerUnit({required Object unit}) => 'Доза на ${unit}';
  @override
  String get allItemsFilter => 'Усі';
  @override
  String get medicationItemsFilter => 'Ліки';
  @override
  String get genericItems => 'Витратні матеріали';
  @override
  String get medicationItemType => 'Ліки';
  @override
  String get genericItemType => 'Витратний матеріал';
  @override
  String get placementLeftThigh => 'Ліве стегно';
  @override
  String get placementRightThigh => 'Праве стегно';
  @override
  String get placementLeftArm => 'Ліва рука';
  @override
  String get placementRightArm => 'Права рука';
  @override
  String get placementLeftButtock => 'Ліва сідниця';
  @override
  String get placementRightButtock => 'Права сідниця';
  @override
  String get placementLeftAbdomen => 'Ліва частина живота';
  @override
  String get placementRightAbdomen => 'Права частина живота';
  @override
  String get injectionSites => 'Місця ін\'єкцій';
  @override
  String get injectionSitesDescription =>
      'Керуйте місцями, між якими ви чергуєте';
  @override
  String get addInjectionSite => 'Додати місце';
  @override
  String get customSiteLabel => 'Власна назва місця';
  @override
  String get noInjectionSitesYet => 'Поки немає місць';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Додайте місце нижче, щоб почати.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Пропонувати за розкладом';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Базувати пропозицію наступного місця лише на історії цього розкладу.';
  @override
  String get mustBeBetween1And28 => 'Має бути від 1 до 28';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '${count} день тому',
        few: '${count} дні тому',
        many: '${count} днів тому',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'через ${count} день',
        few: 'через ${count} дні',
        many: 'через ${count} днів',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'Кожні ${count} днів',
        few: 'Кожні ${count} днів',
        many: 'Кожні ${count} днів',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'Створено ${count} розклад',
        few: 'Створено ${count} розклади',
        many: 'Створено ${count} розкладів',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '${count} ${unit} залишилось',
        few: '${count} ${unit} залишилось',
        many: '${count} ${unit} залишилось',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 шприц залишилось',
        few: '${count} шприца залишилось',
        many: '${count} шприців залишилось',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 серветка залишилось',
        few: '${count} серветки залишилось',
        many: '${count} серветок залишилось',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 голка залишилось',
        few: '${count} голки залишилось',
        many: '${count} голок залишилось',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 рукавичка залишилось',
        few: '${count} рукавички залишилось',
        many: '${count} рукавичок залишилось',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: '1 пластир залишилось',
        few: '${count} пластирі залишилось',
        many: '${count} пластирів залишилось',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'ml',
        few: 'ml',
        many: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'пігулка',
        few: 'пігулки',
        many: 'пігулок',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'патч',
        few: 'патчі',
        many: 'патчів',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'натискання',
        few: 'натискання',
        many: 'натискань',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'імплант',
        few: 'імпланти',
        many: 'імплантів',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'супозиторій',
        few: 'супозиторії',
        many: 'супозиторіїв',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'спрей',
        few: 'спреї',
        many: 'спреїв',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'День ${day}, кожен ${count} місяць',
        few: 'День ${day}, кожні ${count} місяці',
        many: 'День ${day}, кожні ${count} місяців',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'На ЗГТ вже ${count} день',
        few: 'На ЗГТ вже ${count} дні',
        many: 'На ЗГТ вже ${count} днів',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'На ЗГТ вже ${count} тиждень',
        few: 'На ЗГТ вже ${count} тижні',
        many: 'На ЗГТ вже ${count} тижнів',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'На ЗГТ вже ${count} місяць',
        few: 'На ЗГТ вже ${count} місяці',
        many: 'На ЗГТ вже ${count} місяців',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'На ЗГТ вже ${count} рік',
        few: 'На ЗГТ вже ${count} роки',
        many: 'На ЗГТ вже ${count} років',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
        count,
        one: 'Записано ${count} прийом',
        few: 'Записано ${count} прийоми',
        many: 'Записано ${count} прийомів',
      );
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
      'yesterday' => 'вчора',
      'tomorrow' => 'завтра',
      'lastTaken' => 'Востаннє прийнято',
      'neverTakenYet' => 'Ще не приймалось',
      'scheduleFrequencyDaily' => 'Щодня',
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
          'Версія ${latest} доступна! (Поточна: ${current})\n\nОновлення, сумісне з вашим пристроєм, готове до завантаження!',
      'updateDownloadAndInstall' => 'Завантажити та встановити',
      'updateInstallPermissionRequired' =>
        'Надайте дозвіл для встановлення оновлення.',
      'updateDownloadingTitle' => 'Встановлюємо оновлення...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Невдалося відкрити встановлювач: ${message}',
      'updateDownloadFailed' =>
        'Завантаження не вдалося. Будь ласка, перевірте вашу мережу.',
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
      'editSchedule' => 'Змінити розклад',
      'deleteSchedule' => ({required Object name}) => 'Видалити ${name}?',
      'addNotification' => 'Додати сповіщення',
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
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Додайте препарат, щоб почати.',
      'newItem' => 'Новий препарат',
      'adminRoute' => 'Шлях введення',
      'totalAmount' => 'Загальна кількість',
      'concentration' => 'Насиченість',
      'editItem' => 'Змінити',
      'usedAmount' => 'Використано',
      'deleteItem' => ({required Object name}) => 'Видалити ${name}?',
      'supplyType' => 'Тип',
      'syringe' => 'Шприци',
      'wipe' => 'Серветки',
      'needle' => 'Голки',
      'gloves' => 'Рукавички',
      'bandage' => 'Пластирі',
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
        'Суспензія естрадіолу ципіонату',
      'medicationTestosteroneEnanthate' => 'Тестостерон енантат',
      'medicationTestosteroneValerate' => 'Тестостерон валерат',
      'medicationTestosteroneCypionate' => 'Тестостерон ципіонат',
      'medicationTestosteroneUndecylate' => 'Тестостерон ундецилат',
      'medicationTestosteroneBenzoate' => 'Тестостерон бензоат',
      'medicationTestosteroneCypionateSuspension' =>
        'Суспензія тестостерону ципіонату',
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
      'injectionSideLeft' => 'Ліва',
      'injectionSideRight' => 'Права',
      'placementLeft' => 'Ліва сторона',
      'placementRight' => 'Права сторона',
      'requiredField' => 'Обов\'язкове поле',
      'mustBePositiveNumber' => 'Має бути додатнім числом',
      'invalidTotalAmount' => 'Невірна сумарна кількість',
      'cannotExceedTotalCapacity' => 'Не може перевищувати загальну ємність',
      'scheduleFrequencyMonthly' => 'Щомісяця',
      'anchorToLastIntake' => 'Перераховувати на основі останнього прийому',
      'anchorToLastIntakeDescription' =>
        'Планує наступний прийом через повний інтервал після останнього прийому',
      'medicalSettings' => 'Медичні налаштування',
      'theme' => 'Тема',
      'themeCustomizeColors' => 'Налаштуйте кольори застосунку',
      'customThemeEnabled' => 'Власна тема',
      'themeGenerate' => 'Згенерувати',
      'themeVariant' => 'Варіант',
      'themeContrast' => 'Контраст',
      'themeContrastStandard' => 'Стандартний',
      'themeContrastMedium' => 'Середній',
      'themeContrastHigh' => 'Високий',
      'dayOfMonth' => 'День місяця',
      'months' => 'місяців',
      'HrtCounter' => 'Час на ЗГТ',
      'HrtCounterDescription' =>
        'Показує, скільки часу ви на ЗГТ, і загальну кількість прийомів',
      'hrtWidgetPlaceholder' => 'Відкрийте Mona, щоб записати перший прийом',
      'hrtWidgetPreviewSample' => 'На ЗГТ вже 8 місяців',
      'hrtWidgetPreviewIntakeSample' => 'Записано 16 прийомів',
      'startOfDay' => 'Початок дня',
      'startOfDayDescription' => ({required Object time}) =>
          'Час до ${time} зараховується до попереднього дня',
      'chooseItem' => 'Виберіть препарат',
      'noItemsToAdd' => 'Немає доступних препаратів',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Доза на ${unit}',
      'allItemsFilter' => 'Усі',
      'medicationItemsFilter' => 'Ліки',
      'genericItems' => 'Витратні матеріали',
      'medicationItemType' => 'Ліки',
      'genericItemType' => 'Витратний матеріал',
      'placementLeftThigh' => 'Ліве стегно',
      'placementRightThigh' => 'Праве стегно',
      'placementLeftArm' => 'Ліва рука',
      'placementRightArm' => 'Права рука',
      'placementLeftButtock' => 'Ліва сідниця',
      'placementRightButtock' => 'Права сідниця',
      'placementLeftAbdomen' => 'Ліва частина живота',
      'placementRightAbdomen' => 'Права частина живота',
      'injectionSites' => 'Місця ін\'єкцій',
      'injectionSitesDescription' => 'Керуйте місцями, між якими ви чергуєте',
      'addInjectionSite' => 'Додати місце',
      'customSiteLabel' => 'Власна назва місця',
      'noInjectionSitesYet' => 'Поки немає місць',
      'noInjectionAddOneToGetStarted' => 'Додайте місце нижче, щоб почати.',
      'placementSuggestionPerScheduleTitle' => 'Пропонувати за розкладом',
      'placementSuggestionPerScheduleDescription' =>
        'Базувати пропозицію наступного місця лише на історії цього розкладу.',
      'mustBeBetween1And28' => 'Має бути від 1 до 28',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '${count} день тому',
            few: '${count} дні тому',
            many: '${count} днів тому',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'через ${count} день',
            few: 'через ${count} дні',
            many: 'через ${count} днів',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'Кожні ${count} днів',
            few: 'Кожні ${count} днів',
            many: 'Кожні ${count} днів',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'Створено ${count} розклад',
            few: 'Створено ${count} розклади',
            many: 'Створено ${count} розкладів',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '${count} ${unit} залишилось',
            few: '${count} ${unit} залишилось',
            many: '${count} ${unit} залишилось',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 шприц залишилось',
            few: '${count} шприца залишилось',
            many: '${count} шприців залишилось',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 серветка залишилось',
            few: '${count} серветки залишилось',
            many: '${count} серветок залишилось',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 голка залишилось',
            few: '${count} голки залишилось',
            many: '${count} голок залишилось',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 рукавичка залишилось',
            few: '${count} рукавички залишилось',
            many: '${count} рукавичок залишилось',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: '1 пластир залишилось',
            few: '${count} пластирі залишилось',
            many: '${count} пластирів залишилось',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'ml',
            few: 'ml',
            many: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'пігулка',
            few: 'пігулки',
            many: 'пігулок',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'патч',
            few: 'патчі',
            many: 'патчів',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'натискання',
            few: 'натискання',
            many: 'натискань',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'імплант',
            few: 'імпланти',
            many: 'імплантів',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'супозиторій',
            few: 'супозиторії',
            many: 'супозиторіїв',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'спрей',
            few: 'спреї',
            many: 'спреїв',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'День ${day}, кожен ${count} місяць',
            few: 'День ${day}, кожні ${count} місяці',
            many: 'День ${day}, кожні ${count} місяців',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'На ЗГТ вже ${count} день',
            few: 'На ЗГТ вже ${count} дні',
            many: 'На ЗГТ вже ${count} днів',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'На ЗГТ вже ${count} тиждень',
            few: 'На ЗГТ вже ${count} тижні',
            many: 'На ЗГТ вже ${count} тижнів',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'На ЗГТ вже ${count} місяць',
            few: 'На ЗГТ вже ${count} місяці',
            many: 'На ЗГТ вже ${count} місяців',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'На ЗГТ вже ${count} рік',
            few: 'На ЗГТ вже ${count} роки',
            many: 'На ЗГТ вже ${count} років',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('uk'))(
            count,
            one: 'Записано ${count} прийом',
            few: 'Записано ${count} прийоми',
            many: 'Записано ${count} прийомів',
          ),
      _ => null,
    };
  }
}
