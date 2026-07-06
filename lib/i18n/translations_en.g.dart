///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations with BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.en,
              overrides: overrides ?? {},
              cardinalResolver: cardinalResolver,
              ordinalResolver: ordinalResolver,
            ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations

  /// en: 'Mona'
  String get appTitle => 'Mona';

  /// en: 'Mona'
  String get nav_home => 'Mona';

  /// en: 'Intakes'
  String get nav_intakes => 'Intakes';

  /// en: 'Levels'
  String get nav_levels => 'Levels';

  /// en: 'Supplies'
  String get nav_supplies => 'Supplies';

  /// en: 'Take an intake'
  String get takeAnIntake => 'Take an intake';

  /// en: 'Add an item'
  String get addAnItem => 'Add an item';

  /// en: 'Start by adding a schedule in Settings'
  String get empty_home => 'Start by adding a schedule in Settings';

  /// en: 'All done!'
  String get allDone => 'All done!';

  /// en: 'No intakes due today'
  String get noIntakesDue => 'No intakes due today';

  /// en: 'Upcoming'
  String get upcoming => 'Upcoming';

  /// en: 'Taken'
  String get taken => 'Taken';

  /// en: '(other) {{count} days ago}'
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        other: '${count} days ago',
      );

  /// en: 'yesterday'
  String get yesterday => 'yesterday';

  /// en: '(other) {in {count} days}'
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        other: 'in ${count} days',
      );

  /// en: 'tomorrow'
  String get tomorrow => 'tomorrow';

  /// en: 'Last taken'
  String get lastTaken => 'Last taken';

  /// en: 'Never taken yet'
  String get neverTakenYet => 'Never taken yet';

  /// en: 'Every day'
  String get scheduleFrequencyDaily => 'Every day';

  /// en: '(other) {Every {days} days}'
  String scheduleFrequencyEveryNDays({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        days,
        other: 'Every ${days} days',
      );

  /// en: 'Interval'
  String get scheduleFrequencyInterval => 'Interval';

  /// en: 'Weekly'
  String get scheduleFrequencyWeekly => 'Weekly';

  /// en: 'A new update is available!'
  String get newUpdateAvailable => 'A new update is available!';

  /// en: 'Go to Settings'
  String get goToSettings => 'Go to Settings';

  /// en: 'Settings'
  String get settingsTitle => 'Settings';

  /// en: 'Notifications'
  String get notifications => 'Notifications';

  /// en: 'Schedules & notifications'
  String get schedulesAndNotifications => 'Schedules & notifications';

  /// en: 'General'
  String get general => 'General';

  /// en: 'Schedules'
  String get schedules => 'Schedules';

  /// en: 'No schedules'
  String get noSchedules => 'No schedules';

  /// en: '(other) {{count} created}'
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        other: '${count} created',
      );

  /// en: 'Language'
  String get language => 'Language';

  /// en: 'Follow device language'
  String get languageFollowDevice => 'Follow device language';

  /// en: 'Select Language'
  String get selectLanguage => 'Select Language';

  /// en: 'Enable notifications'
  String get enableNotifications => 'Enable notifications';

  /// en: 'Send reminders'
  String get enableNotificationsDescription => 'Send reminders';

  /// en: 'Notifications are disabled'
  String get notificationsDisabledTitle => 'Notifications are disabled';

  /// en: 'Click to open settings'
  String get clickToOpenSettings => 'Click to open settings';

  /// en: 'Exact reminder times are disabled'
  String get exactRemindersDisabled => 'Exact reminder times are disabled';

  /// en: 'Reminders may be slightly delayed. Tap to open settings.'
  String get remindersDelayed =>
      'Reminders may be slightly delayed. Tap to open settings.';

  /// en: 'Auto-Update'
  String get autoUpdate => 'Auto-Update';

  /// en: 'Automatically check new updates when app is launched'
  String get autoUpdateDescription =>
      'Automatically check new updates when app is launched';

  /// en: 'Check for Updates'
  String get checkForUpdates => 'Check for Updates';

  /// en: 'Check for the latest version manually This will connect you to Internet (No data will be sent)'
  String get checkForUpdatesDescription =>
      'Check for the latest version manually\nThis will connect you to Internet\n(No data will be sent)';

  /// en: 'Mona version {version}'
  String appVersion({required Object version}) => 'Mona version ${version}';

  /// en: 'Backup saved to: {path}'
  String backupSavedTo({required Object path}) => 'Backup saved to: ${path}';

  /// en: 'Failed to export: {error}'
  String exportFailed({required Object error}) => 'Failed to export: ${error}';

  /// en: 'Import Data'
  String get importDataTitle => 'Import Data';

  /// en: 'Restore data from a JSON backup'
  String get importDataSubtitle => 'Restore data from a JSON backup';

  /// en: 'This will overwrite all your current data with the backup. This action cannot be undone. Do you want to continue?'
  String get importDataOverwriteWarning =>
      'This will overwrite all your current data with the backup. This action cannot be undone. Do you want to continue?';

  /// en: 'Import'
  String get importConfirm => 'Import';

  /// en: 'Import Successful'
  String get importSuccessfulTitle => 'Import Successful';

  /// en: 'Please restart the app to apply the restored data.'
  String get importRestartRequired =>
      'Please restart the app to apply the restored data.';

  /// en: 'Close App'
  String get closeApp => 'Close App';

  /// en: 'Failed to import: {error}'
  String importFailed({required Object error}) => 'Failed to import: ${error}';

  /// en: 'Updates'
  String get updates => 'Updates';

  /// en: 'Data Management'
  String get dataManagement => 'Data Management';

  /// en: 'Export Data'
  String get exportDataTitle => 'Export Data';

  /// en: 'Save your data to a JSON file'
  String get exportDataSubtitle => 'Save your data to a JSON file';

  /// en: 'Units'
  String get units => 'Units';

  /// en: 'No compatible update found for your device.'
  String get updateNoCompatibleApk =>
      'No compatible update found for your device.';

  /// en: 'Your app is up to date!'
  String get updateAppUpToDate => 'Your app is up to date!';

  /// en: 'Could not check for updates right now.'
  String get updateCheckNetworkError =>
      'Could not check for updates right now.';

  /// en: 'Update Available'
  String get updateDialogTitle => 'Update Available';

  /// en: 'Version {latest} is available! (Current: {current}) An update compatible with your device is ready to be installed.'
  String updateDialogBody({required Object latest, required Object current}) =>
      'Version ${latest} is available! (Current: ${current})\n\nAn update compatible with your device is ready to be installed.';

  /// en: 'Download & Install'
  String get updateDownloadAndInstall => 'Download & Install';

  /// en: 'Permission is required to install updates.'
  String get updateInstallPermissionRequired =>
      'Permission is required to install updates.';

  /// en: 'Downloading Update...'
  String get updateDownloadingTitle => 'Downloading Update...';

  /// en: 'Failed to open installer: {message}'
  String updateFailedOpenInstaller({required Object message}) =>
      'Failed to open installer: ${message}';

  /// en: 'Download failed. Please check your connection.'
  String get updateDownloadFailed =>
      'Download failed. Please check your connection.';

  /// en: 'Time to take {scheduleName}'
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Time to take ${scheduleName}';

  /// en: 'Scheduled for {date}'
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Scheduled for ${date}';

  /// en: 'Scheduled for {time}'
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Scheduled for ${time}';

  /// en: 'Scheduled for {weekday}'
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Scheduled for ${weekday}';

  /// en: 'Add a schedule'
  String get addSchedule => 'Add a schedule';

  /// en: 'Add a schedule to get started.'
  String get addScheduleToGetStarted => 'Add a schedule to get started.';

  /// en: 'New schedule'
  String get newSchedule => 'New schedule';

  /// en: 'Every'
  String get every => 'Every';

  /// en: 'days'
  String get days => 'days';

  /// en: 'Start date'
  String get startDate => 'Start date';

  /// en: 'Pick a time'
  String get pickATime => 'Pick a time';

  /// en: 'Add a time'
  String get addIntakeTime => 'Add a time';

  /// en: 'Edit schedule info'
  String get editScheduleInfo => 'Edit schedule info';

  /// en: 'Scheduling'
  String get scheduling => 'Scheduling';

  /// en: 'No notifications'
  String get noNotifications => 'No notifications';

  /// en: '(other) {{count} notifications}'
  String notificationsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        other: '${count} notifications',
      );

  /// en: 'Edit schedule'
  String get editSchedule => 'Edit schedule';

  /// en: 'Delete {name}?'
  String deleteSchedule({required Object name}) => 'Delete ${name}?';

  /// en: 'Schedule notifications'
  String get scheduleNotifications => 'Schedule notifications';

  /// en: 'Add a notification'
  String get addNotification => 'Add a notification';

  /// en: 'No notifications for {scheduleName}. You can add one using the Add button.'
  String noNotificationsForSchedule({required Object scheduleName}) =>
      'No notifications for ${scheduleName}. You can add one using the Add button.';

  /// en: 'Notifications have been updated!'
  String get notificationsUpdated => 'Notifications have been updated!';

  /// en: 'Each schedule now has its own notifications. Please set up notifications for your schedules to make sure you don't miss anything.'
  String get notificationsUpdatedDescription =>
      'Each schedule now has its own notifications.\n\nPlease set up notifications for your schedules to make sure you don\'t miss anything.';

  /// en: 'Don't show again'
  String get dontShowAgain => 'Don\'t show again';

  /// en: 'Schedule settings'
  String get scheduleSettings => 'Schedule settings';

  /// en: 'Taken intakes will appear here'
  String get empty_intakes => 'Taken intakes will appear here';

  /// en: 'Choose a schedule'
  String get chooseSchedule => 'Choose a schedule';

  /// en: 'Add schedules first.'
  String get addSchedulesFirst => 'Add schedules first.';

  /// en: 'Edit intake'
  String get editIntake => 'Edit intake';

  /// en: 'Date'
  String get date => 'Date';

  /// en: 'Amount'
  String get amount => 'Amount';

  /// en: 'Taken amount'
  String get takenAmount => 'Taken amount';

  /// en: 'Wasted amount'
  String get wastedAmount => 'Wasted amount';

  /// en: 'None'
  String get none => 'None';

  /// en: 'Supply item'
  String get supplyItem => 'Supply item';

  /// en: 'Injection side'
  String get injectionSide => 'Injection side';

  /// en: 'Delete this intake?'
  String get deleteIntake => 'Delete this intake?';

  /// en: 'Take {scheduleName}'
  String takeMedication({required Object scheduleName}) =>
      'Take ${scheduleName}';

  /// en: 'Take intake'
  String get takeIntake => 'Take intake';

  /// en: 'Intake recorded'
  String get intakeRecorded => 'Intake recorded';

  /// en: 'Needle dead space'
  String get needleDeadSpace => 'Needle dead space';

  /// en: 'Notes'
  String get notes => 'Notes';

  /// en: 'μL'
  String get microliters => 'μL';

  /// en: 'mL'
  String get milliliters => 'mL';

  /// en: 'Estradiol injections will display in this tab'
  String get empty_levels => 'Estradiol injections will display in this tab';

  /// en: 'Blood Tests'
  String get bloodTestsTitle => 'Blood Tests';

  /// en: 'Taken blood tests will appear here. Start by using the Add button!'
  String get empty_blood_tests =>
      'Taken blood tests will appear here. Start by using the Add button!';

  /// en: 'Add a blood test'
  String get addBloodTest => 'Add a blood test';

  /// en: 'Edit blood test'
  String get editBloodTest => 'Edit blood test';

  /// en: 'New blood test'
  String get newBloodTest => 'New blood test';

  /// en: 'Delete this blood test?'
  String get deleteBloodTest => 'Delete this blood test?';

  /// en: 'Estradiol level'
  String get estradiolLevelLabel => 'Estradiol level';

  /// en: 'Testosterone level'
  String get testosteroneLevelLabel => 'Testosterone level';

  /// en: 'Test date'
  String get bloodTestDateLabel => 'Test date';

  /// en: 'Now {value}'
  String chartNowConcentration({required Object value}) => 'Now ${value}';

  /// en: '{date}: {level}'
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';

  /// en: 'No supplies. Add an item to get started.'
  String get empty_supplies => 'No supplies. Add an item to get started.';

  /// en: 'New item'
  String get newItem => 'New item';

  /// en: 'Administration route'
  String get adminRoute => 'Administration route';

  /// en: 'Total amount'
  String get totalAmount => 'Total amount';

  /// en: 'Concentration'
  String get concentration => 'Concentration';

  /// en: 'Edit item'
  String get editItem => 'Edit item';

  /// en: 'Used amount'
  String get usedAmount => 'Used amount';

  /// en: 'Delete {name}?'
  String deleteItem({required Object name}) => 'Delete ${name}?';

  /// en: '(other) {{amount} {unit} remaining}'
  String remaining({required num amount, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        amount,
        other: '${amount} ${unit} remaining',
      );

  /// en: 'All'
  String get allItemsFilter => 'All';

  /// en: 'Medication'
  String get medicationItemsFilter => 'Medication';

  /// en: 'Consumables'
  String get genericItemsFilter => 'Consumables';

  /// en: 'Medication'
  String get medicationItemType => 'Medication';

  /// en: 'Consumable'
  String get genericItemType => 'Consumable';

  /// en: 'Type'
  String get supplyType => 'Type';

  /// en: 'Syringes'
  String get syringe => 'Syringes';

  /// en: 'Wipes'
  String get wipe => 'Wipes';

  /// en: 'Needles'
  String get needle => 'Needles';

  /// en: 'Gloves'
  String get gloves => 'Gloves';

  /// en: 'Bandages'
  String get bandage => 'Bandages';

  /// en: '(one) {1 syringe remaining} (other) {{count} syringes remaining}'
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 syringe remaining',
        other: '${count} syringes remaining',
      );

  /// en: '(one) {1 wipe remaining} (other) {{count} wipes remaining}'
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 wipe remaining',
        other: '${count} wipes remaining',
      );

  /// en: '(one) {1 needle remaining} (other) {{count} needles remaining}'
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 needle remaining',
        other: '${count} needles remaining',
      );

  /// en: '(one) {1 glove remaining} (other) {{count} gloves remaining}'
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 glove remaining',
        other: '${count} gloves remaining',
      );

  /// en: '(one) {1 bandage remaining} (other) {{count} bandages remaining}'
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 bandage remaining',
        other: '${count} bandages remaining',
      );

  /// en: 'Add'
  String get add => 'Add';

  /// en: 'Save'
  String get save => 'Save';

  /// en: 'Cancel'
  String get cancel => 'Cancel';

  /// en: 'Next'
  String get next => 'Next';

  /// en: 'Delete'
  String get delete => 'Delete';

  /// en: 'Delete this item?'
  String get deleteElement => 'Delete this item?';

  /// en: 'This action can't be undone.'
  String get irreversibleAction => 'This action can\'t be undone.';

  /// en: 'Name'
  String get name => 'Name';

  /// en: 'Molecule'
  String get molecule => 'Molecule';

  /// en: 'Ester'
  String get ester => 'Ester';

  /// en: 'Estradiol'
  String get estradiol => 'Estradiol';

  /// en: 'Progesterone'
  String get progesterone => 'Progesterone';

  /// en: 'Testosterone'
  String get testosterone => 'Testosterone';

  /// en: 'Nandrolone'
  String get nandrolone => 'Nandrolone';

  /// en: 'Dihydrotestosterone'
  String get dihydrotestosterone => 'Dihydrotestosterone';

  /// en: 'Spironolactone'
  String get spironolactone => 'Spironolactone';

  /// en: 'Cyproterone acetate'
  String get cyproteroneAcetate => 'Cyproterone acetate';

  /// en: 'Leuprorelin acetate'
  String get leuprorelinAcetate => 'Leuprorelin acetate';

  /// en: 'Bicalutamide'
  String get bicalutamide => 'Bicalutamide';

  /// en: 'Decapeptyl'
  String get decapeptyl => 'Decapeptyl';

  /// en: 'Raloxifene'
  String get raloxifene => 'Raloxifene';

  /// en: 'Tamoxifen'
  String get tamoxifen => 'Tamoxifen';

  /// en: 'Finasteride'
  String get finasteride => 'Finasteride';

  /// en: 'Dutasteride'
  String get dutasteride => 'Dutasteride';

  /// en: 'Minoxidil'
  String get minoxidil => 'Minoxidil';

  /// en: 'Pioglitazone'
  String get pioglitazone => 'Pioglitazone';

  /// en: 'Enanthate'
  String get enanthate => 'Enanthate';

  /// en: 'Valerate'
  String get valerate => 'Valerate';

  /// en: 'Cypionate'
  String get cypionate => 'Cypionate';

  /// en: 'Undecylate'
  String get undecylate => 'Undecylate';

  /// en: 'Benzoate'
  String get benzoate => 'Benzoate';

  /// en: 'Cypionate suspension'
  String get cypionateSuspension => 'Cypionate suspension';

  /// en: 'Estradiol enanthate'
  String get medicationEstradiolEnanthate => 'Estradiol enanthate';

  /// en: 'Estradiol valerate'
  String get medicationEstradiolValerate => 'Estradiol valerate';

  /// en: 'Estradiol cypionate'
  String get medicationEstradiolCypionate => 'Estradiol cypionate';

  /// en: 'Estradiol undecylate'
  String get medicationEstradiolUndecylate => 'Estradiol undecylate';

  /// en: 'Estradiol benzoate'
  String get medicationEstradiolBenzoate => 'Estradiol benzoate';

  /// en: 'Estradiol cypionate suspension'
  String get medicationEstradiolCypionateSuspension =>
      'Estradiol cypionate suspension';

  /// en: 'Testosterone enanthate'
  String get medicationTestosteroneEnanthate => 'Testosterone enanthate';

  /// en: 'Testosterone valerate'
  String get medicationTestosteroneValerate => 'Testosterone valerate';

  /// en: 'Testosterone cypionate'
  String get medicationTestosteroneCypionate => 'Testosterone cypionate';

  /// en: 'Testosterone undecylate'
  String get medicationTestosteroneUndecylate => 'Testosterone undecylate';

  /// en: 'Testosterone benzoate'
  String get medicationTestosteroneBenzoate => 'Testosterone benzoate';

  /// en: 'Testosterone cypionate suspension'
  String get medicationTestosteroneCypionateSuspension =>
      'Testosterone cypionate suspension';

  /// en: 'Injection'
  String get injection => 'Injection';

  /// en: 'Oral'
  String get oral => 'Oral';

  /// en: 'Sublingual'
  String get sublingual => 'Sublingual';

  /// en: 'Patch'
  String get patch => 'Patch';

  /// en: 'Gel'
  String get gel => 'Gel';

  /// en: 'Implant'
  String get implant => 'Implant';

  /// en: 'Suppository'
  String get suppository => 'Suppository';

  /// en: 'Transdermal spray'
  String get transdermalSpray => 'Transdermal spray';

  /// en: 'Transdermal drops'
  String get transdermalDrops => 'Transdermal drops';

  /// en: 'mg'
  String get unitMilligram => 'mg';

  /// en: 'pg/mL'
  String get unitPgPerMl => 'pg/mL';

  /// en: 'pmol/L'
  String get unitPmolPerL => 'pmol/L';

  /// en: 'ng/dL'
  String get unitNgPerDl => 'ng/dL';

  /// en: 'nmol/L'
  String get unitNmolPerL => 'nmol/L';

  /// en: '(one) {ml} (other) {ml}'
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'ml',
        other: 'ml',
      );

  /// en: '(one) {pill} (other) {pills}'
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'pill',
        other: 'pills',
      );

  /// en: '(one) {patch} (other) {patches}'
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'patch',
        other: 'patches',
      );

  /// en: '(one) {pump} (other) {pumps}'
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'pump',
        other: 'pumps',
      );

  /// en: '(one) {implant} (other) {implants}'
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'implant',
        other: 'implants',
      );

  /// en: '(one) {suppository} (other) {suppositories}'
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'suppository',
        other: 'suppositories',
      );

  /// en: '(one) {spray} (other) {sprays}'
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'spray',
        other: 'sprays',
      );

  /// en: 'Left'
  String get injectionSideLeft => 'Left';

  /// en: 'Right'
  String get injectionSideRight => 'Right';

  /// en: 'Left side'
  String get intakeSummaryInjectionSideLeft => 'Left side';

  /// en: 'Right side'
  String get intakeSummaryInjectionSideRight => 'Right side';

  /// en: 'Required field'
  String get requiredField => 'Required field';

  /// en: 'Must be a positive number'
  String get mustBePositiveNumber => 'Must be a positive number';

  /// en: 'Invalid total amount'
  String get invalidTotalAmount => 'Invalid total amount';

  /// en: 'Cannot exceed total capacity'
  String get cannotExceedTotalCapacity => 'Cannot exceed total capacity';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Intakes',
      'nav_levels' => 'Levels',
      'nav_supplies' => 'Supplies',
      'takeAnIntake' => 'Take an intake',
      'addAnItem' => 'Add an item',
      'empty_home' => 'Start by adding a schedule in Settings',
      'allDone' => 'All done!',
      'noIntakesDue' => 'No intakes due today',
      'upcoming' => 'Upcoming',
      'taken' => 'Taken',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            other: '${count} days ago',
          ),
      'yesterday' => 'yesterday',
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            other: 'in ${count} days',
          ),
      'tomorrow' => 'tomorrow',
      'lastTaken' => 'Last taken',
      'neverTakenYet' => 'Never taken yet',
      'scheduleFrequencyDaily' => 'Every day',
      'scheduleFrequencyEveryNDays' => ({required num days}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            days,
            other: 'Every ${days} days',
          ),
      'scheduleFrequencyInterval' => 'Interval',
      'scheduleFrequencyWeekly' => 'Weekly',
      'newUpdateAvailable' => 'A new update is available!',
      'goToSettings' => 'Go to Settings',
      'settingsTitle' => 'Settings',
      'notifications' => 'Notifications',
      'schedulesAndNotifications' => 'Schedules & notifications',
      'general' => 'General',
      'schedules' => 'Schedules',
      'noSchedules' => 'No schedules',
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            other: '${count} created',
          ),
      'language' => 'Language',
      'languageFollowDevice' => 'Follow device language',
      'selectLanguage' => 'Select Language',
      'enableNotifications' => 'Enable notifications',
      'enableNotificationsDescription' => 'Send reminders',
      'notificationsDisabledTitle' => 'Notifications are disabled',
      'clickToOpenSettings' => 'Click to open settings',
      'exactRemindersDisabled' => 'Exact reminder times are disabled',
      'remindersDelayed' =>
        'Reminders may be slightly delayed. Tap to open settings.',
      'autoUpdate' => 'Auto-Update',
      'autoUpdateDescription' =>
        'Automatically check new updates when app is launched',
      'checkForUpdates' => 'Check for Updates',
      'checkForUpdatesDescription' =>
        'Check for the latest version manually\nThis will connect you to Internet\n(No data will be sent)',
      'appVersion' => ({required Object version}) => 'Mona version ${version}',
      'backupSavedTo' => ({required Object path}) => 'Backup saved to: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Failed to export: ${error}',
      'importDataTitle' => 'Import Data',
      'importDataSubtitle' => 'Restore data from a JSON backup',
      'importDataOverwriteWarning' =>
        'This will overwrite all your current data with the backup. This action cannot be undone. Do you want to continue?',
      'importConfirm' => 'Import',
      'importSuccessfulTitle' => 'Import Successful',
      'importRestartRequired' =>
        'Please restart the app to apply the restored data.',
      'closeApp' => 'Close App',
      'importFailed' => ({required Object error}) =>
          'Failed to import: ${error}',
      'updates' => 'Updates',
      'dataManagement' => 'Data Management',
      'exportDataTitle' => 'Export Data',
      'exportDataSubtitle' => 'Save your data to a JSON file',
      'units' => 'Units',
      'updateNoCompatibleApk' => 'No compatible update found for your device.',
      'updateAppUpToDate' => 'Your app is up to date!',
      'updateCheckNetworkError' => 'Could not check for updates right now.',
      'updateDialogTitle' => 'Update Available',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'Version ${latest} is available! (Current: ${current})\n\nAn update compatible with your device is ready to be installed.',
      'updateDownloadAndInstall' => 'Download & Install',
      'updateInstallPermissionRequired' =>
        'Permission is required to install updates.',
      'updateDownloadingTitle' => 'Downloading Update...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Failed to open installer: ${message}',
      'updateDownloadFailed' =>
        'Download failed. Please check your connection.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Time to take ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Scheduled for ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Scheduled for ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Scheduled for ${weekday}',
      'addSchedule' => 'Add a schedule',
      'addScheduleToGetStarted' => 'Add a schedule to get started.',
      'newSchedule' => 'New schedule',
      'every' => 'Every',
      'days' => 'days',
      'startDate' => 'Start date',
      'pickATime' => 'Pick a time',
      'addIntakeTime' => 'Add a time',
      'editScheduleInfo' => 'Edit schedule info',
      'scheduling' => 'Scheduling',
      'noNotifications' => 'No notifications',
      'notificationsCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            other: '${count} notifications',
          ),
      'editSchedule' => 'Edit schedule',
      'deleteSchedule' => ({required Object name}) => 'Delete ${name}?',
      'scheduleNotifications' => 'Schedule notifications',
      'addNotification' => 'Add a notification',
      'noNotificationsForSchedule' => ({required Object scheduleName}) =>
          'No notifications for ${scheduleName}. You can add one using the Add button.',
      'notificationsUpdated' => 'Notifications have been updated!',
      'notificationsUpdatedDescription' =>
        'Each schedule now has its own notifications.\n\nPlease set up notifications for your schedules to make sure you don\'t miss anything.',
      'dontShowAgain' => 'Don\'t show again',
      'scheduleSettings' => 'Schedule settings',
      'empty_intakes' => 'Taken intakes will appear here',
      'chooseSchedule' => 'Choose a schedule',
      'addSchedulesFirst' => 'Add schedules first.',
      'editIntake' => 'Edit intake',
      'date' => 'Date',
      'amount' => 'Amount',
      'takenAmount' => 'Taken amount',
      'wastedAmount' => 'Wasted amount',
      'none' => 'None',
      'supplyItem' => 'Supply item',
      'injectionSide' => 'Injection side',
      'deleteIntake' => 'Delete this intake?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Take ${scheduleName}',
      'takeIntake' => 'Take intake',
      'intakeRecorded' => 'Intake recorded',
      'needleDeadSpace' => 'Needle dead space',
      'notes' => 'Notes',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'empty_levels' => 'Estradiol injections will display in this tab',
      'bloodTestsTitle' => 'Blood Tests',
      'empty_blood_tests' =>
        'Taken blood tests will appear here. Start by using the Add button!',
      'addBloodTest' => 'Add a blood test',
      'editBloodTest' => 'Edit blood test',
      'newBloodTest' => 'New blood test',
      'deleteBloodTest' => 'Delete this blood test?',
      'estradiolLevelLabel' => 'Estradiol level',
      'testosteroneLevelLabel' => 'Testosterone level',
      'bloodTestDateLabel' => 'Test date',
      'chartNowConcentration' => ({required Object value}) => 'Now ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'empty_supplies' => 'No supplies. Add an item to get started.',
      'newItem' => 'New item',
      'adminRoute' => 'Administration route',
      'totalAmount' => 'Total amount',
      'concentration' => 'Concentration',
      'editItem' => 'Edit item',
      'usedAmount' => 'Used amount',
      'deleteItem' => ({required Object name}) => 'Delete ${name}?',
      'remaining' => ({required num amount, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            amount,
            other: '${amount} ${unit} remaining',
          ),
      'allItemsFilter' => 'All',
      'medicationItemsFilter' => 'Medication',
      'genericItemsFilter' => 'Consumables',
      'medicationItemType' => 'Medication',
      'genericItemType' => 'Consumable',
      'supplyType' => 'Type',
      'syringe' => 'Syringes',
      'wipe' => 'Wipes',
      'needle' => 'Needles',
      'gloves' => 'Gloves',
      'bandage' => 'Bandages',
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '1 syringe remaining',
            other: '${count} syringes remaining',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '1 wipe remaining',
            other: '${count} wipes remaining',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '1 needle remaining',
            other: '${count} needles remaining',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '1 glove remaining',
            other: '${count} gloves remaining',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '1 bandage remaining',
            other: '${count} bandages remaining',
          ),
      'add' => 'Add',
      'save' => 'Save',
      'cancel' => 'Cancel',
      'next' => 'Next',
      'delete' => 'Delete',
      'deleteElement' => 'Delete this item?',
      'irreversibleAction' => 'This action can\'t be undone.',
      'name' => 'Name',
      'molecule' => 'Molecule',
      'ester' => 'Ester',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesterone',
      'testosterone' => 'Testosterone',
      'nandrolone' => 'Nandrolone',
      'dihydrotestosterone' => 'Dihydrotestosterone',
      'spironolactone' => 'Spironolactone',
      'cyproteroneAcetate' => 'Cyproterone acetate',
      'leuprorelinAcetate' => 'Leuprorelin acetate',
      'bicalutamide' => 'Bicalutamide',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloxifene',
      'tamoxifen' => 'Tamoxifen',
      'finasteride' => 'Finasteride',
      'dutasteride' => 'Dutasteride',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazone',
      'enanthate' => 'Enanthate',
      'valerate' => 'Valerate',
      'cypionate' => 'Cypionate',
      'undecylate' => 'Undecylate',
      'benzoate' => 'Benzoate',
      'cypionateSuspension' => 'Cypionate suspension',
      'medicationEstradiolEnanthate' => 'Estradiol enanthate',
      'medicationEstradiolValerate' => 'Estradiol valerate',
      'medicationEstradiolCypionate' => 'Estradiol cypionate',
      'medicationEstradiolUndecylate' => 'Estradiol undecylate',
      'medicationEstradiolBenzoate' => 'Estradiol benzoate',
      'medicationEstradiolCypionateSuspension' =>
        'Estradiol cypionate suspension',
      'medicationTestosteroneEnanthate' => 'Testosterone enanthate',
      'medicationTestosteroneValerate' => 'Testosterone valerate',
      'medicationTestosteroneCypionate' => 'Testosterone cypionate',
      'medicationTestosteroneUndecylate' => 'Testosterone undecylate',
      'medicationTestosteroneBenzoate' => 'Testosterone benzoate',
      'medicationTestosteroneCypionateSuspension' =>
        'Testosterone cypionate suspension',
      'injection' => 'Injection',
      'oral' => 'Oral',
      'sublingual' => 'Sublingual',
      'patch' => 'Patch',
      'gel' => 'Gel',
      'implant' => 'Implant',
      'suppository' => 'Suppository',
      'transdermalSpray' => 'Transdermal spray',
      'transdermalDrops' => 'Transdermal drops',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'pill',
            other: 'pills',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'patch',
            other: 'patches',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'pump',
            other: 'pumps',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'implant',
            other: 'implants',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'suppository',
            other: 'suppositories',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'spray',
            other: 'sprays',
          ),
      'injectionSideLeft' => 'Left',
      'injectionSideRight' => 'Right',
      'intakeSummaryInjectionSideLeft' => 'Left side',
      'intakeSummaryInjectionSideRight' => 'Right side',
      'requiredField' => 'Required field',
      'mustBePositiveNumber' => 'Must be a positive number',
      'invalidTotalAmount' => 'Invalid total amount',
      'cannotExceedTotalCapacity' => 'Cannot exceed total capacity',
      _ => null,
    };
  }
}
