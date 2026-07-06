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
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '${count} день назад',
        few: '${count} дня назад',
        other: '${count} дней назад',
      );
  @override
  String get yesterday => 'вчера';
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'через ${count} день',
        few: 'через ${count} дня',
        other: 'через ${count} дней',
      );
  @override
  String get tomorrow => 'завтра';
  @override
  String get lastTaken => 'Последний приём';
  @override
  String get neverTakenYet => 'Ещё не принято';
  @override
  String get scheduleFrequencyDaily => 'Ежедневно';
  @override
  String scheduleFrequencyEveryNDays({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        days,
        other: 'Каждые ${days} дней',
      );
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
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        other: '${count} создано',
      );
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
  String get noNotifications => 'Нет уведомлений';
  @override
  String notificationsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '${count} уведомление',
        few: '${count} уведомления',
        other: '${count} уведомлений',
      );
  @override
  String get editSchedule => 'Изменение расписания';
  @override
  String deleteSchedule({required Object name}) => 'Удалить ${name}?';
  @override
  String get scheduleNotifications => 'Уведомления расписания';
  @override
  String get addNotification => 'Добавить уведомление';
  @override
  String noNotificationsForSchedule({required Object scheduleName}) =>
      'Для ${scheduleName} нет уведомлений. Вы можете создать их с помощью кнопки внизу.';
  @override
  String get notificationsUpdated => 'Уведомления были обновлены!';
  @override
  String get notificationsUpdatedDescription =>
      'Каждое расписание теперь имеет свои уведомления.\n\nПожалуйста, (пере)настройте уведомления для своих расписаний.';
  @override
  String get dontShowAgain => 'Больше не показывать';
  @override
  String get scheduleSettings => 'Настройки расписания';
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
  String get empty_levels =>
      'Приёмы эстрадиола будут отображаться в данной вкладке';
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
  String remaining({required num amount, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        amount,
        other: '${amount} ${unit} осталось',
      );
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
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 шприц осталось',
        few: '${count} шприца осталось',
        other: '${count} шприцев осталось',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 салфетка осталось',
        few: '${count} салфетки осталось',
        other: '${count} салфеток осталось',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 игла осталось',
        few: '${count} иглы осталось',
        other: '${count} игл осталось',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 перчатка осталось',
        few: '${count} перчатки осталось',
        other: '${count} перчаток осталось',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: '1 пластырь осталось',
        few: '${count} пластыря осталось',
        other: '${count} пластырей осталось',
      );
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
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        other: 'мл',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'таблетка',
        few: 'таблетки',
        other: 'таблеток',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'пластырь',
        few: 'пластыря',
        other: 'пластырей',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'помпа',
        few: 'помпы',
        other: 'помп',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'имплант',
        few: 'импланта',
        other: 'имплантов',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'суппозитория',
        few: 'суппозитории',
        other: 'суппозиторий',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
        count,
        one: 'брызг',
        few: 'брызг',
        other: 'брызгов',
      );
  @override
  String get injectionSideLeft => 'Левая';
  @override
  String get injectionSideRight => 'Правая';
  @override
  String get intakeSummaryInjectionSideLeft => 'Левая сторона';
  @override
  String get intakeSummaryInjectionSideRight => 'Правая сторона';
  @override
  String get requiredField => 'Обязательное поле';
  @override
  String get mustBePositiveNumber => 'Число должно быть положительным';
  @override
  String get invalidTotalAmount => 'Неверное общее количество';
  @override
  String get cannotExceedTotalCapacity => 'Не может превышать общее количество';
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
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '${count} день назад',
            few: '${count} дня назад',
            other: '${count} дней назад',
          ),
      'yesterday' => 'вчера',
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'через ${count} день',
            few: 'через ${count} дня',
            other: 'через ${count} дней',
          ),
      'tomorrow' => 'завтра',
      'lastTaken' => 'Последний приём',
      'neverTakenYet' => 'Ещё не принято',
      'scheduleFrequencyDaily' => 'Ежедневно',
      'scheduleFrequencyEveryNDays' => ({required num days}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            days,
            other: 'Каждые ${days} дней',
          ),
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
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            other: '${count} создано',
          ),
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
      'noNotifications' => 'Нет уведомлений',
      'notificationsCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '${count} уведомление',
            few: '${count} уведомления',
            other: '${count} уведомлений',
          ),
      'editSchedule' => 'Изменение расписания',
      'deleteSchedule' => ({required Object name}) => 'Удалить ${name}?',
      'scheduleNotifications' => 'Уведомления расписания',
      'addNotification' => 'Добавить уведомление',
      'noNotificationsForSchedule' => ({required Object scheduleName}) =>
          'Для ${scheduleName} нет уведомлений. Вы можете создать их с помощью кнопки внизу.',
      'notificationsUpdated' => 'Уведомления были обновлены!',
      'notificationsUpdatedDescription' =>
        'Каждое расписание теперь имеет свои уведомления.\n\nПожалуйста, (пере)настройте уведомления для своих расписаний.',
      'dontShowAgain' => 'Больше не показывать',
      'scheduleSettings' => 'Настройки расписания',
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
      'empty_levels' => 'Приёмы эстрадиола будут отображаться в данной вкладке',
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
      'empty_supplies' =>
        'Нет препаратов. Для начала работы добавьте препарат.',
      'newItem' => 'Новый препарат',
      'adminRoute' => 'Способ приёма',
      'totalAmount' => 'Общее количество',
      'concentration' => 'Концентрация',
      'editItem' => 'Изменение препарата',
      'usedAmount' => 'Использовано',
      'deleteItem' => ({required Object name}) => 'Удалить ${name}?',
      'remaining' => ({required num amount, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            amount,
            other: '${amount} ${unit} осталось',
          ),
      'supplyType' => 'Тип',
      'syringe' => 'Шприцы',
      'wipe' => 'Салфетки',
      'needle' => 'Иглы',
      'gloves' => 'Перчатки',
      'bandage' => 'Пластыри',
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 шприц осталось',
            few: '${count} шприца осталось',
            other: '${count} шприцев осталось',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 салфетка осталось',
            few: '${count} салфетки осталось',
            other: '${count} салфеток осталось',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 игла осталось',
            few: '${count} иглы осталось',
            other: '${count} игл осталось',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 перчатка осталось',
            few: '${count} перчатки осталось',
            other: '${count} перчаток осталось',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: '1 пластырь осталось',
            few: '${count} пластыря осталось',
            other: '${count} пластырей осталось',
          ),
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
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            other: 'мл',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'таблетка',
            few: 'таблетки',
            other: 'таблеток',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'пластырь',
            few: 'пластыря',
            other: 'пластырей',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'помпа',
            few: 'помпы',
            other: 'помп',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'имплант',
            few: 'импланта',
            other: 'имплантов',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'суппозитория',
            few: 'суппозитории',
            other: 'суппозиторий',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ru'))(
            count,
            one: 'брызг',
            few: 'брызг',
            other: 'брызгов',
          ),
      'injectionSideLeft' => 'Левая',
      'injectionSideRight' => 'Правая',
      'intakeSummaryInjectionSideLeft' => 'Левая сторона',
      'intakeSummaryInjectionSideRight' => 'Правая сторона',
      'requiredField' => 'Обязательное поле',
      'mustBePositiveNumber' => 'Число должно быть положительным',
      'invalidTotalAmount' => 'Неверное общее количество',
      'cannotExceedTotalCapacity' => 'Не может превышать общее количество',
      _ => null,
    };
  }
}
