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
class TranslationsRu extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsRu(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.ru,
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

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsRu _root = this; // ignore: unused_field

  @override
  TranslationsRu $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsRu(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Приёмы';
  @override
  String get nav_levels => 'Уровни';
  @override
  String get nav_supplies => 'Препараты';
  @override
  String get takeAnIntake => 'Добавить приём';
  @override
  String get addAnItem => 'Добавить препарат';
  @override
  String get empty_home => 'Начните с добавления расписания в настройках';
  @override
  String get allDone => 'Всё принято!';
  @override
  String get noIntakesDue => 'На сегодня нет приёмов';
  @override
  String get upcoming => 'Ближайшие';
  @override
  String get taken => 'Принято';
  @override
  String get yesterday => 'вчера';
  @override
  String get tomorrow => 'завтра';
  @override
  String get lastTaken => 'Последний приём';
  @override
  String get neverTakenYet => 'Ещё не принято';
  @override
  String get scheduleFrequencyDaily => 'Ежедневно';
  @override
  String get scheduleFrequencyInterval => 'Интервально';
  @override
  String get scheduleFrequencyWeekly => 'Еженедельно';
  @override
  String get newUpdateAvailable => 'Доступно новое обновление!';
  @override
  String get goToSettings => 'Перейти в настройки';
  @override
  String get settingsTitle => 'Настройки';
  @override
  String get notifications => 'Уведомления';
  @override
  String get schedulesAndNotifications => 'Расписания и уведомления';
  @override
  String get general => 'Общее';
  @override
  String get schedules => 'Расписания';
  @override
  String get noSchedules => 'Нет расписаний';
  @override
  String get language => 'Язык';
  @override
  String get languageFollowDevice => 'Язык устройства';
  @override
  String get selectLanguage => 'Выбрать язык';
  @override
  String get enableNotifications => 'Включить уведомления';
  @override
  String get enableNotificationsDescription => 'Отправлять напоминания';
  @override
  String get notificationsDisabledTitle => 'Уведомления отключены';
  @override
  String get clickToOpenSettings => 'Нажмите для открытия настроек';
  @override
  String get exactRemindersDisabled => 'Точные напоминания недоступны';
  @override
  String get remindersDelayed =>
      'Напоминания могут отставать. Нажмите для открытия настроек.';
  @override
  String get autoUpdate => 'Авто-обновления';
  @override
  String get autoUpdateDescription =>
      'Автоматически проверять наличие обновлений при запуске приложения';
  @override
  String get checkForUpdates => 'Проверить наличие обновлений';
  @override
  String get checkForUpdatesDescription =>
      'Вручную проверить наличие обновлений\nДанное действие подключит вас к интернету\n(Данные переданы не будут)';
  @override
  String appVersion({required Object version}) => 'Mona, версия ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Копия данных сохранена в ${path}';
  @override
  String exportFailed({required Object error}) => 'Ошибка экспорта: ${error}';
  @override
  String get importDataTitle => 'Импорт данных';
  @override
  String get importDataSubtitle => 'Восстановить копию данных из JSON-файла';
  @override
  String get importDataOverwriteWarning =>
      'Восстановление старой копии данных перезапишет все текущие данные, что невозможно отменить. Продолжить?';
  @override
  String get importConfirm => 'Импортировать';
  @override
  String get importSuccessfulTitle => 'Импорт успешен';
  @override
  String get importRestartRequired =>
      'Перезапустите приложение для завершения восстановления данных.';
  @override
  String get closeApp => 'Закрыть';
  @override
  String importFailed({required Object error}) =>
      'Ошибка восстановления: ${error}';
  @override
  String get updates => 'Обновления';
  @override
  String get dataManagement => 'Управление данными';
  @override
  String get exportDataTitle => 'Экспорт данных';
  @override
  String get exportDataSubtitle => 'Сохранить копию данных в JSON-файл';
  @override
  String get units => 'Единицы измерения';
  @override
  String get updateNoCompatibleApk => 'Совместимых обновлений не найдено.';
  @override
  String get updateAppUpToDate => 'Установлена последняя версия приложения!';
  @override
  String get updateCheckNetworkError =>
      'Не удалось проверить наличие обновлений.';
  @override
  String get updateDialogTitle => 'Доступно обновление';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Доступна версия ${latest}! (Текущая: ${current})\n\nСовместимое с Вашим устройством обновление доступно к установке.';
  @override
  String get updateDownloadAndInstall => 'Обновить';
  @override
  String get updateInstallPermissionRequired =>
      'Для установки обновления необходимо выдать разрешение.';
  @override
  String get updateDownloadingTitle => 'Обновление скачивается...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Ошибка при открытии установщика: ${message}';
  @override
  String get updateDownloadFailed =>
      'Ошибка скачивания. Пожалуйста, проверьте своё интернет соединение.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Пора принять ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Запланировано на ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Запланировано на ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Запланировано на ${weekday}';
  @override
  String get addSchedule => 'Добавить расписание';
  @override
  String get addScheduleToGetStarted => 'Добавьте расписание для начала.';
  @override
  String get newSchedule => 'Новое расписание';
  @override
  String get every => 'Каждые';
  @override
  String get days => 'дней';
  @override
  String get startDate => 'Дата начала';
  @override
  String get pickATime => 'Выберите время';
  @override
  String get addIntakeTime => 'Добавить время';
  @override
  String get editScheduleInfo => 'Изменить информацию расписания';
  @override
  String get scheduling => 'Расписание';
  @override
  String get editSchedule => 'Изменение расписания';
  @override
  String deleteSchedule({required Object name}) => 'Удалить ${name}?';
  @override
  String get addNotification => 'Добавить уведомление';
  @override
  String get empty_intakes => 'Добавленные приёмы будут отображаться тут';
  @override
  String get chooseSchedule => 'Выберите расписание';
  @override
  String get addSchedulesFirst => 'Сначала добавьте расписание.';
  @override
  String get editIntake => 'Изменение приёма';
  @override
  String get date => 'Время';
  @override
  String get amount => 'Количество';
  @override
  String get takenAmount => 'Принятое количество';
  @override
  String get wastedAmount => 'Потерянное количество';
  @override
  String get none => 'Не выбрано';
  @override
  String get supplyItem => 'Препарат';
  @override
  String get injectionSide => 'Сторона';
  @override
  String get deleteIntake => 'Удалить приём?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Принять ${scheduleName}';
  @override
  String get takeIntake => 'Записать приём';
  @override
  String get intakeRecorded => 'Приём записан';
  @override
  String get needleDeadSpace => 'Мёртвое (пустое) пространство иглы';
  @override
  String get notes => 'Заметки';
  @override
  String get microliters => 'мкл';
  @override
  String get milliliters => 'мл';
  @override
  String get bloodTestsTitle => 'Анализы крови';
  @override
  String get empty_blood_tests =>
      'Записанные результаты анализов будут отображаться тут. Вы можете создать их с помощью кнопки внизу!';
  @override
  String get addBloodTest => 'Добавить анализ';
  @override
  String get editBloodTest => 'Изменение результатов анализа';
  @override
  String get newBloodTest => 'Запись результатов анализа';
  @override
  String get deleteBloodTest => 'Удалить данный результат анализа?';
  @override
  String get estradiolLevelLabel => 'Уровень эстрадиола';
  @override
  String get testosteroneLevelLabel => 'Уровень тестостерона';
  @override
  String get bloodTestDateLabel => 'Дата анализа';
  @override
  String chartNowConcentration({required Object value}) => 'Сейчас ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Нет препаратов. Для начала работы добавьте препарат.';
  @override
  String get newItem => 'Новый препарат';
  @override
  String get adminRoute => 'Способ приёма';
  @override
  String get totalAmount => 'Общее количество';
  @override
  String get concentration => 'Концентрация';
  @override
  String get editItem => 'Изменение препарата';
  @override
  String get usedAmount => 'Использовано';
  @override
  String deleteItem({required Object name}) => 'Удалить ${name}?';
  @override
  String get supplyType => 'Тип';
  @override
  String get syringe => 'Шприцы';
  @override
  String get wipe => 'Салфетки';
  @override
  String get needle => 'Иглы';
  @override
  String get gloves => 'Перчатки';
  @override
  String get bandage => 'Пластыри';
  @override
  String get add => 'Добавить';
  @override
  String get save => 'Сохранить';
  @override
  String get cancel => 'Отменить';
  @override
  String get next => 'Далее';
  @override
  String get delete => 'Удалить';
  @override
  String get deleteElement => 'Удалить данный препарат?';
  @override
  String get irreversibleAction => 'Данное действие отменить невозможно.';
  @override
  String get name => 'Название';
  @override
  String get molecule => 'Молекула';
  @override
  String get ester => 'Эфир';
  @override
  String get estradiol => 'Эстрадиол';
  @override
  String get progesterone => 'Прогестерон';
  @override
  String get testosterone => 'Тестостерон';
  @override
  String get nandrolone => 'Нандролон';
  @override
  String get dihydrotestosterone => 'Дигидротестостерон';
  @override
  String get spironolactone => 'Спиронолактон';
  @override
  String get cyproteroneAcetate => 'Ципротерона ацетат';
  @override
  String get leuprorelinAcetate => 'Леупрорелина ацетат';
  @override
  String get bicalutamide => 'Бикалутамид';
  @override
  String get decapeptyl => 'Декапептил';
  @override
  String get raloxifene => 'Ралоксифен';
  @override
  String get tamoxifen => 'Тамоксифен';
  @override
  String get finasteride => 'Финастерид';
  @override
  String get dutasteride => 'Дутастерид';
  @override
  String get minoxidil => 'Миноксидил';
  @override
  String get pioglitazone => 'Пиоглитазон';
  @override
  String get enanthate => 'Энантат';
  @override
  String get valerate => 'Валерат';
  @override
  String get cypionate => 'Ципионат';
  @override
  String get undecylate => 'Ундецилат';
  @override
  String get benzoate => 'Бензоат';
  @override
  String get cypionateSuspension => 'Суспензия ципионата';
  @override
  String get medicationEstradiolEnanthate => 'Эстрадиола энантат';
  @override
  String get medicationEstradiolValerate => 'Эстрадиола валерат';
  @override
  String get medicationEstradiolCypionate => 'Эстрадиола ципионат';
  @override
  String get medicationEstradiolUndecylate => 'Эстрадиола ундецилат';
  @override
  String get medicationEstradiolBenzoate => 'Эстрадиола бензоат';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Суспензия эстрадиола ципионата';
  @override
  String get medicationTestosteroneEnanthate => 'Тестостерона энантат';
  @override
  String get medicationTestosteroneValerate => 'Тестостерона валерат';
  @override
  String get medicationTestosteroneCypionate => 'Тестостерона ципионат';
  @override
  String get medicationTestosteroneUndecylate => 'Тестостерона ундецилат';
  @override
  String get medicationTestosteroneBenzoate => 'Тестостерона бензоат';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Суспензия тестостерона ципионата';
  @override
  String get injection => 'Инъекционно';
  @override
  String get oral => 'Орально';
  @override
  String get sublingual => 'Сублингвально';
  @override
  String get patch => 'Пластырь';
  @override
  String get gel => 'Гель';
  @override
  String get implant => 'Имплант';
  @override
  String get suppository => 'Суппозитория';
  @override
  String get transdermalSpray => 'Трансдермальный спрей';
  @override
  String get transdermalDrops => 'Трансдермальные капли';
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
  String get injectionSideLeft => 'Левая';
  @override
  String get injectionSideRight => 'Правая';
  @override
  String get placementLeft => 'Левая сторона';
  @override
  String get placementRight => 'Правая сторона';
  @override
  String get requiredField => 'Обязательное поле';
  @override
  String get mustBePositiveNumber => 'Число должно быть положительным';
  @override
  String get invalidTotalAmount => 'Неверное общее количество';
  @override
  String get cannotExceedTotalCapacity => 'Не может превышать общее количество';
  @override
  String get scheduleFrequencyMonthly => 'Ежемесячно';
  @override
  String get anchorToLastIntake => 'Пересчитывать на основе последнего приёма';
  @override
  String get anchorToLastIntakeDescription =>
      'Планирует следующий приём через полный интервал после последнего приёма';
  @override
  String get medicalSettings => 'Медицинские настройки';
  @override
  String get theme => 'Тема';
  @override
  String get themeCustomizeColors => 'Настройте цвета приложения';
  @override
  String get customThemeEnabled => 'Пользовательская тема';
  @override
  String get themeGenerate => 'Создать';
  @override
  String get themeVariant => 'Вариант';
  @override
  String get themeContrast => 'Контраст';
  @override
  String get themeContrastStandard => 'Стандартный';
  @override
  String get themeContrastMedium => 'Средний';
  @override
  String get themeContrastHigh => 'Высокий';
  @override
  String get dayOfMonth => 'День месяца';
  @override
  String get months => 'месяцев';
  @override
  String get HrtCounter => 'Время на ЗГТ';
  @override
  String get HrtCounterDescription =>
      'Показывает, сколько времени вы на ЗГТ, и общее количество приёмов';
  @override
  String get hrtWidgetPlaceholder =>
      'Откройте Mona, чтобы записать первый приём';
  @override
  String get hrtWidgetPreviewSample => 'На ЗГТ уже 8 месяцев';
  @override
  String get hrtWidgetPreviewIntakeSample => 'Записано 16 приёмов';
  @override
  String get startOfDay => 'Начало дня';
  @override
  String startOfDayDescription({required Object time}) =>
      'Время до ${time} засчитывается к предыдущему дню';
  @override
  String get chooseItem => 'Выберите препарат';
  @override
  String get noItemsToAdd => 'Нет доступных препаратов';
  @override
  String concentrationLabelPerUnit({required Object unit}) => 'Доза на ${unit}';
  @override
  String get allItemsFilter => 'Все';
  @override
  String get medicationItemsFilter => 'Лекарства';
  @override
  String get genericItems => 'Расходники';
  @override
  String get medicationItemType => 'Лекарство';
  @override
  String get genericItemType => 'Расходный материал';
  @override
  String get placementLeftThigh => 'Левое бедро';
  @override
  String get placementRightThigh => 'Правое бедро';
  @override
  String get placementLeftArm => 'Левая рука';
  @override
  String get placementRightArm => 'Правая рука';
  @override
  String get placementLeftButtock => 'Левая ягодица';
  @override
  String get placementRightButtock => 'Правая ягодица';
  @override
  String get placementLeftAbdomen => 'Левая часть живота';
  @override
  String get placementRightAbdomen => 'Правая часть живота';
  @override
  String get injectionSites => 'Места инъекций';
  @override
  String get injectionSitesDescription =>
      'Управляйте местами, между которыми вы чередуете';
  @override
  String get addInjectionSite => 'Добавить место';
  @override
  String get customSiteLabel => 'Название места';
  @override
  String get noInjectionSitesYet => 'Пока нет мест';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Добавьте место ниже, чтобы начать.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Предлагать по расписанию';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Основывать предложение следующего места только на истории этого расписания.';
  @override
  String get mustBeBetween1And28 => 'Должно быть от 1 до 28';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '${count} день назад',
        few: '${count} дня назад',
        many: '${count} дней назад',
        other: '${count} дней назад',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'через ${count} день',
        few: 'через ${count} дня',
        many: 'через ${count} дней',
        other: 'через ${count} дней',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Каждые ${count} дней',
        few: 'Каждые ${count} дней',
        many: 'Каждые ${count} дней',
        other: 'Каждые ${count} дней',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '${count} создано',
        few: '${count} создано',
        many: '${count} создано',
        other: '${count} создано',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '${count} ${unit} осталось',
        few: '${count} ${unit} осталось',
        many: '${count} ${unit} осталось',
        other: '${count} ${unit} осталось',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 шприц осталось',
        few: '${count} шприца осталось',
        many: '${count} шприцев осталось',
        other: '${count} шприцев осталось',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 салфетка осталось',
        few: '${count} салфетки осталось',
        many: '${count} салфеток осталось',
        other: '${count} салфеток осталось',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 игла осталось',
        few: '${count} иглы осталось',
        many: '${count} игл осталось',
        other: '${count} игл осталось',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 перчатка осталось',
        few: '${count} перчатки осталось',
        many: '${count} перчаток осталось',
        other: '${count} перчаток осталось',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 пластырь осталось',
        few: '${count} пластыря осталось',
        many: '${count} пластырей осталось',
        other: '${count} пластырей осталось',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'мл',
        few: 'мл',
        many: 'мл',
        other: 'мл',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'таблетка',
        few: 'таблетки',
        many: 'таблеток',
        other: 'таблеток',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'пластырь',
        few: 'пластыря',
        many: 'пластырей',
        other: 'пластырей',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'помпа',
        few: 'помпы',
        many: 'помп',
        other: 'помп',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'имплант',
        few: 'импланта',
        many: 'имплантов',
        other: 'имплантов',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'суппозитория',
        few: 'суппозитории',
        many: 'суппозиторий',
        other: 'суппозиторий',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'брызг',
        few: 'брызг',
        many: 'брызгов',
        other: 'брызгов',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'День ${day}, каждый ${count} месяц',
        few: 'День ${day}, каждые ${count} месяца',
        many: 'День ${day}, каждые ${count} месяцев',
        other: 'День ${day}, каждые ${count} месяцев',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'На ЗГТ уже ${count} день',
        few: 'На ЗГТ уже ${count} дня',
        many: 'На ЗГТ уже ${count} дней',
        other: 'На ЗГТ уже ${count} дней',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'На ЗГТ уже ${count} неделю',
        few: 'На ЗГТ уже ${count} недели',
        many: 'На ЗГТ уже ${count} недель',
        other: 'На ЗГТ уже ${count} недель',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'На ЗГТ уже ${count} месяц',
        few: 'На ЗГТ уже ${count} месяца',
        many: 'На ЗГТ уже ${count} месяцев',
        other: 'На ЗГТ уже ${count} месяцев',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'На ЗГТ уже ${count} год',
        few: 'На ЗГТ уже ${count} года',
        many: 'На ЗГТ уже ${count} лет',
        other: 'На ЗГТ уже ${count} лет',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'Записан ${count} приём',
        few: 'Записано ${count} приёма',
        many: 'Записано ${count} приёмов',
        other: 'Записано ${count} приёмов',
      );
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Приёмы',
      'nav_levels' => 'Уровни',
      'nav_supplies' => 'Препараты',
      'takeAnIntake' => 'Добавить приём',
      'addAnItem' => 'Добавить препарат',
      'empty_home' => 'Начните с добавления расписания в настройках',
      'allDone' => 'Всё принято!',
      'noIntakesDue' => 'На сегодня нет приёмов',
      'upcoming' => 'Ближайшие',
      'taken' => 'Принято',
      'yesterday' => 'вчера',
      'tomorrow' => 'завтра',
      'lastTaken' => 'Последний приём',
      'neverTakenYet' => 'Ещё не принято',
      'scheduleFrequencyDaily' => 'Ежедневно',
      'scheduleFrequencyInterval' => 'Интервально',
      'scheduleFrequencyWeekly' => 'Еженедельно',
      'newUpdateAvailable' => 'Доступно новое обновление!',
      'goToSettings' => 'Перейти в настройки',
      'settingsTitle' => 'Настройки',
      'notifications' => 'Уведомления',
      'schedulesAndNotifications' => 'Расписания и уведомления',
      'general' => 'Общее',
      'schedules' => 'Расписания',
      'noSchedules' => 'Нет расписаний',
      'language' => 'Язык',
      'languageFollowDevice' => 'Язык устройства',
      'selectLanguage' => 'Выбрать язык',
      'enableNotifications' => 'Включить уведомления',
      'enableNotificationsDescription' => 'Отправлять напоминания',
      'notificationsDisabledTitle' => 'Уведомления отключены',
      'clickToOpenSettings' => 'Нажмите для открытия настроек',
      'exactRemindersDisabled' => 'Точные напоминания недоступны',
      'remindersDelayed' =>
        'Напоминания могут отставать. Нажмите для открытия настроек.',
      'autoUpdate' => 'Авто-обновления',
      'autoUpdateDescription' =>
        'Автоматически проверять наличие обновлений при запуске приложения',
      'checkForUpdates' => 'Проверить наличие обновлений',
      'checkForUpdatesDescription' =>
        'Вручную проверить наличие обновлений\nДанное действие подключит вас к интернету\n(Данные переданы не будут)',
      'appVersion' => ({required Object version}) => 'Mona, версия ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Копия данных сохранена в ${path}',
      'exportFailed' => ({required Object error}) =>
          'Ошибка экспорта: ${error}',
      'importDataTitle' => 'Импорт данных',
      'importDataSubtitle' => 'Восстановить копию данных из JSON-файла',
      'importDataOverwriteWarning' =>
        'Восстановление старой копии данных перезапишет все текущие данные, что невозможно отменить. Продолжить?',
      'importConfirm' => 'Импортировать',
      'importSuccessfulTitle' => 'Импорт успешен',
      'importRestartRequired' =>
        'Перезапустите приложение для завершения восстановления данных.',
      'closeApp' => 'Закрыть',
      'importFailed' => ({required Object error}) =>
          'Ошибка восстановления: ${error}',
      'updates' => 'Обновления',
      'dataManagement' => 'Управление данными',
      'exportDataTitle' => 'Экспорт данных',
      'exportDataSubtitle' => 'Сохранить копию данных в JSON-файл',
      'units' => 'Единицы измерения',
      'updateNoCompatibleApk' => 'Совместимых обновлений не найдено.',
      'updateAppUpToDate' => 'Установлена последняя версия приложения!',
      'updateCheckNetworkError' => 'Не удалось проверить наличие обновлений.',
      'updateDialogTitle' => 'Доступно обновление',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Доступна версия ${latest}! (Текущая: ${current})\n\nСовместимое с Вашим устройством обновление доступно к установке.',
      'updateDownloadAndInstall' => 'Обновить',
      'updateInstallPermissionRequired' =>
        'Для установки обновления необходимо выдать разрешение.',
      'updateDownloadingTitle' => 'Обновление скачивается...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Ошибка при открытии установщика: ${message}',
      'updateDownloadFailed' =>
        'Ошибка скачивания. Пожалуйста, проверьте своё интернет соединение.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Пора принять ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Запланировано на ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Запланировано на ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Запланировано на ${weekday}',
      'addSchedule' => 'Добавить расписание',
      'addScheduleToGetStarted' => 'Добавьте расписание для начала.',
      'newSchedule' => 'Новое расписание',
      'every' => 'Каждые',
      'days' => 'дней',
      'startDate' => 'Дата начала',
      'pickATime' => 'Выберите время',
      'addIntakeTime' => 'Добавить время',
      'editScheduleInfo' => 'Изменить информацию расписания',
      'scheduling' => 'Расписание',
      'editSchedule' => 'Изменение расписания',
      'deleteSchedule' => ({required Object name}) => 'Удалить ${name}?',
      'addNotification' => 'Добавить уведомление',
      'empty_intakes' => 'Добавленные приёмы будут отображаться тут',
      'chooseSchedule' => 'Выберите расписание',
      'addSchedulesFirst' => 'Сначала добавьте расписание.',
      'editIntake' => 'Изменение приёма',
      'date' => 'Время',
      'amount' => 'Количество',
      'takenAmount' => 'Принятое количество',
      'wastedAmount' => 'Потерянное количество',
      'none' => 'Не выбрано',
      'supplyItem' => 'Препарат',
      'injectionSide' => 'Сторона',
      'deleteIntake' => 'Удалить приём?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Принять ${scheduleName}',
      'takeIntake' => 'Записать приём',
      'intakeRecorded' => 'Приём записан',
      'needleDeadSpace' => 'Мёртвое (пустое) пространство иглы',
      'notes' => 'Заметки',
      'microliters' => 'мкл',
      'milliliters' => 'мл',
      'bloodTestsTitle' => 'Анализы крови',
      'empty_blood_tests' =>
        'Записанные результаты анализов будут отображаться тут. Вы можете создать их с помощью кнопки внизу!',
      'addBloodTest' => 'Добавить анализ',
      'editBloodTest' => 'Изменение результатов анализа',
      'newBloodTest' => 'Запись результатов анализа',
      'deleteBloodTest' => 'Удалить данный результат анализа?',
      'estradiolLevelLabel' => 'Уровень эстрадиола',
      'testosteroneLevelLabel' => 'Уровень тестостерона',
      'bloodTestDateLabel' => 'Дата анализа',
      'chartNowConcentration' => ({required Object value}) => 'Сейчас ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' =>
        'Нет препаратов. Для начала работы добавьте препарат.',
      'newItem' => 'Новый препарат',
      'adminRoute' => 'Способ приёма',
      'totalAmount' => 'Общее количество',
      'concentration' => 'Концентрация',
      'editItem' => 'Изменение препарата',
      'usedAmount' => 'Использовано',
      'deleteItem' => ({required Object name}) => 'Удалить ${name}?',
      'supplyType' => 'Тип',
      'syringe' => 'Шприцы',
      'wipe' => 'Салфетки',
      'needle' => 'Иглы',
      'gloves' => 'Перчатки',
      'bandage' => 'Пластыри',
      'add' => 'Добавить',
      'save' => 'Сохранить',
      'cancel' => 'Отменить',
      'next' => 'Далее',
      'delete' => 'Удалить',
      'deleteElement' => 'Удалить данный препарат?',
      'irreversibleAction' => 'Данное действие отменить невозможно.',
      'name' => 'Название',
      'molecule' => 'Молекула',
      'ester' => 'Эфир',
      'estradiol' => 'Эстрадиол',
      'progesterone' => 'Прогестерон',
      'testosterone' => 'Тестостерон',
      'nandrolone' => 'Нандролон',
      'dihydrotestosterone' => 'Дигидротестостерон',
      'spironolactone' => 'Спиронолактон',
      'cyproteroneAcetate' => 'Ципротерона ацетат',
      'leuprorelinAcetate' => 'Леупрорелина ацетат',
      'bicalutamide' => 'Бикалутамид',
      'decapeptyl' => 'Декапептил',
      'raloxifene' => 'Ралоксифен',
      'tamoxifen' => 'Тамоксифен',
      'finasteride' => 'Финастерид',
      'dutasteride' => 'Дутастерид',
      'minoxidil' => 'Миноксидил',
      'pioglitazone' => 'Пиоглитазон',
      'enanthate' => 'Энантат',
      'valerate' => 'Валерат',
      'cypionate' => 'Ципионат',
      'undecylate' => 'Ундецилат',
      'benzoate' => 'Бензоат',
      'cypionateSuspension' => 'Суспензия ципионата',
      'medicationEstradiolEnanthate' => 'Эстрадиола энантат',
      'medicationEstradiolValerate' => 'Эстрадиола валерат',
      'medicationEstradiolCypionate' => 'Эстрадиола ципионат',
      'medicationEstradiolUndecylate' => 'Эстрадиола ундецилат',
      'medicationEstradiolBenzoate' => 'Эстрадиола бензоат',
      'medicationEstradiolCypionateSuspension' =>
        'Суспензия эстрадиола ципионата',
      'medicationTestosteroneEnanthate' => 'Тестостерона энантат',
      'medicationTestosteroneValerate' => 'Тестостерона валерат',
      'medicationTestosteroneCypionate' => 'Тестостерона ципионат',
      'medicationTestosteroneUndecylate' => 'Тестостерона ундецилат',
      'medicationTestosteroneBenzoate' => 'Тестостерона бензоат',
      'medicationTestosteroneCypionateSuspension' =>
        'Суспензия тестостерона ципионата',
      'injection' => 'Инъекционно',
      'oral' => 'Орально',
      'sublingual' => 'Сублингвально',
      'patch' => 'Пластырь',
      'gel' => 'Гель',
      'implant' => 'Имплант',
      'suppository' => 'Суппозитория',
      'transdermalSpray' => 'Трансдермальный спрей',
      'transdermalDrops' => 'Трансдермальные капли',
      'unitMilligram' => 'мг',
      'unitPgPerMl' => 'пг/мл',
      'unitPmolPerL' => 'пмоль/л',
      'unitNgPerDl' => 'нг/дл',
      'unitNmolPerL' => 'нмоль/л',
      'injectionSideLeft' => 'Левая',
      'injectionSideRight' => 'Правая',
      'placementLeft' => 'Левая сторона',
      'placementRight' => 'Правая сторона',
      'requiredField' => 'Обязательное поле',
      'mustBePositiveNumber' => 'Число должно быть положительным',
      'invalidTotalAmount' => 'Неверное общее количество',
      'cannotExceedTotalCapacity' => 'Не может превышать общее количество',
      'scheduleFrequencyMonthly' => 'Ежемесячно',
      'anchorToLastIntake' => 'Пересчитывать на основе последнего приёма',
      'anchorToLastIntakeDescription' =>
        'Планирует следующий приём через полный интервал после последнего приёма',
      'medicalSettings' => 'Медицинские настройки',
      'theme' => 'Тема',
      'themeCustomizeColors' => 'Настройте цвета приложения',
      'customThemeEnabled' => 'Пользовательская тема',
      'themeGenerate' => 'Создать',
      'themeVariant' => 'Вариант',
      'themeContrast' => 'Контраст',
      'themeContrastStandard' => 'Стандартный',
      'themeContrastMedium' => 'Средний',
      'themeContrastHigh' => 'Высокий',
      'dayOfMonth' => 'День месяца',
      'months' => 'месяцев',
      'HrtCounter' => 'Время на ЗГТ',
      'HrtCounterDescription' =>
        'Показывает, сколько времени вы на ЗГТ, и общее количество приёмов',
      'hrtWidgetPlaceholder' => 'Откройте Mona, чтобы записать первый приём',
      'hrtWidgetPreviewSample' => 'На ЗГТ уже 8 месяцев',
      'hrtWidgetPreviewIntakeSample' => 'Записано 16 приёмов',
      'startOfDay' => 'Начало дня',
      'startOfDayDescription' => ({required Object time}) =>
          'Время до ${time} засчитывается к предыдущему дню',
      'chooseItem' => 'Выберите препарат',
      'noItemsToAdd' => 'Нет доступных препаратов',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Доза на ${unit}',
      'allItemsFilter' => 'Все',
      'medicationItemsFilter' => 'Лекарства',
      'genericItems' => 'Расходники',
      'medicationItemType' => 'Лекарство',
      'genericItemType' => 'Расходный материал',
      'placementLeftThigh' => 'Левое бедро',
      'placementRightThigh' => 'Правое бедро',
      'placementLeftArm' => 'Левая рука',
      'placementRightArm' => 'Правая рука',
      'placementLeftButtock' => 'Левая ягодица',
      'placementRightButtock' => 'Правая ягодица',
      'placementLeftAbdomen' => 'Левая часть живота',
      'placementRightAbdomen' => 'Правая часть живота',
      'injectionSites' => 'Места инъекций',
      'injectionSitesDescription' =>
        'Управляйте местами, между которыми вы чередуете',
      'addInjectionSite' => 'Добавить место',
      'customSiteLabel' => 'Название места',
      'noInjectionSitesYet' => 'Пока нет мест',
      'noInjectionAddOneToGetStarted' => 'Добавьте место ниже, чтобы начать.',
      'placementSuggestionPerScheduleTitle' => 'Предлагать по расписанию',
      'placementSuggestionPerScheduleDescription' =>
        'Основывать предложение следующего места только на истории этого расписания.',
      'mustBeBetween1And28' => 'Должно быть от 1 до 28',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '${count} день назад',
            few: '${count} дня назад',
            many: '${count} дней назад',
            other: '${count} дней назад',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'через ${count} день',
            few: 'через ${count} дня',
            many: 'через ${count} дней',
            other: 'через ${count} дней',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'Каждые ${count} дней',
            few: 'Каждые ${count} дней',
            many: 'Каждые ${count} дней',
            other: 'Каждые ${count} дней',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '${count} создано',
            few: '${count} создано',
            many: '${count} создано',
            other: '${count} создано',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '${count} ${unit} осталось',
            few: '${count} ${unit} осталось',
            many: '${count} ${unit} осталось',
            other: '${count} ${unit} осталось',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 шприц осталось',
            few: '${count} шприца осталось',
            many: '${count} шприцев осталось',
            other: '${count} шприцев осталось',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 салфетка осталось',
            few: '${count} салфетки осталось',
            many: '${count} салфеток осталось',
            other: '${count} салфеток осталось',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 игла осталось',
            few: '${count} иглы осталось',
            many: '${count} игл осталось',
            other: '${count} игл осталось',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 перчатка осталось',
            few: '${count} перчатки осталось',
            many: '${count} перчаток осталось',
            other: '${count} перчаток осталось',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 пластырь осталось',
            few: '${count} пластыря осталось',
            many: '${count} пластырей осталось',
            other: '${count} пластырей осталось',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'мл',
            few: 'мл',
            many: 'мл',
            other: 'мл',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'таблетка',
            few: 'таблетки',
            many: 'таблеток',
            other: 'таблеток',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'пластырь',
            few: 'пластыря',
            many: 'пластырей',
            other: 'пластырей',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'помпа',
            few: 'помпы',
            many: 'помп',
            other: 'помп',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'имплант',
            few: 'импланта',
            many: 'имплантов',
            other: 'имплантов',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'суппозитория',
            few: 'суппозитории',
            many: 'суппозиторий',
            other: 'суппозиторий',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'брызг',
            few: 'брызг',
            many: 'брызгов',
            other: 'брызгов',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'День ${day}, каждый ${count} месяц',
            few: 'День ${day}, каждые ${count} месяца',
            many: 'День ${day}, каждые ${count} месяцев',
            other: 'День ${day}, каждые ${count} месяцев',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'На ЗГТ уже ${count} день',
            few: 'На ЗГТ уже ${count} дня',
            many: 'На ЗГТ уже ${count} дней',
            other: 'На ЗГТ уже ${count} дней',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'На ЗГТ уже ${count} неделю',
            few: 'На ЗГТ уже ${count} недели',
            many: 'На ЗГТ уже ${count} недель',
            other: 'На ЗГТ уже ${count} недель',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'На ЗГТ уже ${count} месяц',
            few: 'На ЗГТ уже ${count} месяца',
            many: 'На ЗГТ уже ${count} месяцев',
            other: 'На ЗГТ уже ${count} месяцев',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'На ЗГТ уже ${count} год',
            few: 'На ЗГТ уже ${count} года',
            many: 'На ЗГТ уже ${count} лет',
            other: 'На ЗГТ уже ${count} лет',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'Записан ${count} приём',
            few: 'Записано ${count} приёма',
            many: 'Записано ${count} приёмов',
            other: 'Записано ${count} приёмов',
          ),
      _ => null,
    };
  }
}
