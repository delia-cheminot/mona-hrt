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
class TranslationsEnGb extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEnGb(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.enGb,
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

  /// Metadata for the translations of <en-GB>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsEnGb _root = this; // ignore: unused_field

  @override
  TranslationsEnGb $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsEnGb(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Intakes';
  @override
  String get nav_levels => 'Levels';
  @override
  String get nav_supplies => 'Supplies';
  @override
  String get takeAnIntake => 'Take an intake';
  @override
  String get addAnItem => 'Add an item';
  @override
  String get empty_home => 'Start by adding a schedule in Settings';
  @override
  String get allDone => 'All done!';
  @override
  String get noIntakesDue => 'No intakes due today';
  @override
  String get upcoming => 'Upcoming';
  @override
  String get asNeeded => 'As needed';
  @override
  String get taken => 'Taken';
  @override
  String get yesterday => 'yesterday';
  @override
  String get tomorrow => 'tomorrow';
  @override
  String get lastTaken => 'Last taken';
  @override
  String get neverTakenYet => 'Never taken yet';
  @override
  String get scheduleFrequencyDaily => 'Daily';
  @override
  String get scheduleFrequencyDailyDescription =>
      'Every day, at specific times';
  @override
  String get scheduleFrequencyInterval => 'Interval';
  @override
  String get scheduleFrequencyIntervalDescription => 'Every few days';
  @override
  String get scheduleFrequencyWeekly => 'Weekly';
  @override
  String get scheduleFrequencyWeeklyDescription => 'Certain days of the week';
  @override
  String get scheduleFrequencyMonthly => 'Monthly';
  @override
  String get scheduleFrequencyMonthlyDescription => 'The same day every month';
  @override
  String get scheduleFrequencyAsNeeded => 'As needed';
  @override
  String get scheduleFrequencyAsNeededDescription => 'No fixed schedule';
  @override
  String get newUpdateAvailable => 'A new update is available!';
  @override
  String get goToSettings => 'Go to Settings';
  @override
  String get settingsTitle => 'Settings';
  @override
  String get notifications => 'Notifications';
  @override
  String get schedulesAndNotifications => 'Schedules & notifications';
  @override
  String get general => 'General';
  @override
  String get schedules => 'Schedules';
  @override
  String get noSchedules => 'No schedules';
  @override
  String get language => 'Language';
  @override
  String get languageFollowDevice => 'Follow device language';
  @override
  String get selectLanguage => 'Select Language';
  @override
  String get enableNotifications => 'Enable notifications';
  @override
  String get enableNotificationsDescription => 'Send reminders';
  @override
  String get anchorToLastIntake => 'Recalculate based on last intake';
  @override
  String get anchorToLastIntakeDescription =>
      'Schedules the next intake a full interval after you last took it';
  @override
  String get notificationsDisabledTitle => 'Notifications are disabled';
  @override
  String get clickToOpenSettings => 'Click to open settings';
  @override
  String get exactRemindersDisabled => 'Exact reminder times are disabled';
  @override
  String get remindersDelayed =>
      'Reminders may be slightly delayed. Tap to open settings.';
  @override
  String get medicalSettings => 'Medical settings';
  @override
  String get theme => 'Theme';
  @override
  String get themeCustomizeColors => 'Customise the app colours';
  @override
  String get customThemeEnabled => 'Custom theme';
  @override
  String get themeGenerate => 'Generate';
  @override
  String get themeVariant => 'Variant';
  @override
  String get themeContrast => 'Contrast';
  @override
  String get themeContrastStandard => 'Standard';
  @override
  String get themeContrastMedium => 'Medium';
  @override
  String get themeContrastHigh => 'High';
  @override
  String get autoUpdate => 'Auto-Update';
  @override
  String get autoUpdateDescription =>
      'Automatically check new updates when app is launched';
  @override
  String get checkForUpdates => 'Check for Updates';
  @override
  String get checkForUpdatesDescription =>
      'Check for the latest version manually\nThis will connect you to Internet\n(No data will be sent)';
  @override
  String appVersion({required Object version}) => 'Mona version ${version}';
  @override
  String backupSavedTo({required Object path}) => 'Backup saved to: ${path}';
  @override
  String exportFailed({required Object error}) => 'Failed to export: ${error}';
  @override
  String get importDataTitle => 'Import Data';
  @override
  String get importDataSubtitle => 'Restore data from a JSON backup';
  @override
  String get importDataOverwriteWarning =>
      'This will overwrite all your current data with the backup. This action cannot be undone. Do you want to continue?';
  @override
  String get importConfirm => 'Import';
  @override
  String get importSuccessfulTitle => 'Import Successful';
  @override
  String get importRestartRequired =>
      'Please restart the app to apply the restored data.';
  @override
  String get closeApp => 'Close App';
  @override
  String importFailed({required Object error}) => 'Failed to import: ${error}';
  @override
  String get updates => 'Updates';
  @override
  String get dataManagement => 'Data Management';
  @override
  String get exportDataTitle => 'Export Data';
  @override
  String get exportDataSubtitle => 'Save your data to a JSON file';
  @override
  String get units => 'Units';
  @override
  String get updateNoCompatibleApk =>
      'No compatible update found for your device.';
  @override
  String get updateAppUpToDate => 'Your app is up to date!';
  @override
  String get updateCheckNetworkError =>
      'Could not check for updates right now.';
  @override
  String get updateDialogTitle => 'Update Available';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'Version ${latest} is available! (Current: ${current})\n\nAn update compatible with your device is ready to be installed.';
  @override
  String get updateDownloadAndInstall => 'Download & Install';
  @override
  String get updateInstallPermissionRequired =>
      'Permission is required to install updates.';
  @override
  String get updateDownloadingTitle => 'Downloading Update...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Failed to open installer: ${message}';
  @override
  String get updateDownloadFailed =>
      'Download failed. Please check your connection.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Time to take ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Scheduled for ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Scheduled for ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Scheduled for ${weekday}';
  @override
  String get addSchedule => 'Add a schedule';
  @override
  String get addScheduleToGetStarted => 'Add a schedule to get started.';
  @override
  String get newSchedule => 'New schedule';
  @override
  String get every => 'Every';
  @override
  String get days => 'days';
  @override
  String get dayOfMonth => 'Day of the month';
  @override
  String get months => 'months';
  @override
  String get startDate => 'Start date';
  @override
  String get pickATime => 'Pick a time';
  @override
  String get addIntakeTime => 'Add a time';
  @override
  String get editScheduleInfo => 'Edit schedule info';
  @override
  String get scheduling => 'Scheduling';
  @override
  String get editSchedule => 'Edit schedule';
  @override
  String deleteSchedule({required Object name}) => 'Delete ${name}?';
  @override
  String get addNotification => 'Add a notification';
  @override
  String get empty_intakes => 'Taken intakes will appear here';
  @override
  String get HrtCounter => 'Time on HRT';
  @override
  String get HrtCounterDescription =>
      'Show how long you\'ve been on HRT and your total intakes';
  @override
  String get hrtWidgetPlaceholder => 'Open Mona to log your first intake';
  @override
  String get hrtWidgetPreviewSample => 'On HRT for 8 months';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 intakes logged';
  @override
  String get startOfDay => 'Start of day';
  @override
  String startOfDayDescription({required Object time}) =>
      'Time before ${time} counts towards the previous day';
  @override
  String get chooseSchedule => 'Choose a schedule';
  @override
  String get addSchedulesFirst => 'Add schedules first.';
  @override
  String get editIntake => 'Edit intake';
  @override
  String get date => 'Date';
  @override
  String get amount => 'Amount';
  @override
  String get takenAmount => 'Taken amount';
  @override
  String get wastedAmount => 'Wasted amount';
  @override
  String get none => 'None';
  @override
  String get supplyItem => 'Supply item';
  @override
  String get chooseItem => 'Choose an item';
  @override
  String get noItemsToAdd => 'No items available';
  @override
  String get injectionSide => 'Injection side';
  @override
  String get deleteIntake => 'Delete this intake?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Take ${scheduleName}';
  @override
  String get takeIntake => 'Take intake';
  @override
  String get intakeRecorded => 'Intake recorded';
  @override
  String get needleDeadSpace => 'Needle dead space';
  @override
  String get notes => 'Notes';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get empty_levels => 'Oestradiol injections will display in this tab';
  @override
  String get bloodTestsTitle => 'Blood Tests';
  @override
  String get empty_blood_tests =>
      'Taken blood tests will appear here. Start by using the Add button!';
  @override
  String get addBloodTest => 'Add a blood test';
  @override
  String get editBloodTest => 'Edit blood test';
  @override
  String get newBloodTest => 'New blood test';
  @override
  String get deleteBloodTest => 'Delete this blood test?';
  @override
  String get estradiolLevelLabel => 'Oestradiol level';
  @override
  String get testosteroneLevelLabel => 'Testosterone level';
  @override
  String get bloodTestDateLabel => 'Test date';
  @override
  String chartNowConcentration({required Object value}) => 'Now ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies => 'No supplies. Add an item to get started.';
  @override
  String get newItem => 'New item';
  @override
  String get adminRoute => 'Administration route';
  @override
  String get totalAmount => 'Total amount';
  @override
  String get concentration => 'Concentration';
  @override
  String get editItem => 'Edit item';
  @override
  String get usedAmount => 'Used amount';
  @override
  String deleteItem({required Object name}) => 'Delete ${name}?';
  @override
  String get allItemsFilter => 'All';
  @override
  String get medicationItemsFilter => 'Medication';
  @override
  String get genericItems => 'Consumables';
  @override
  String get medicationItemType => 'Medication';
  @override
  String get genericItemType => 'Consumable';
  @override
  String get supplyType => 'Type';
  @override
  String get syringe => 'Syringes';
  @override
  String get wipe => 'Wipes';
  @override
  String get needle => 'Needles';
  @override
  String get gloves => 'Gloves';
  @override
  String get bandage => 'Bandages';
  @override
  String get add => 'Add';
  @override
  String get save => 'Save';
  @override
  String get cancel => 'Cancel';
  @override
  String get next => 'Next';
  @override
  String get delete => 'Delete';
  @override
  String get deleteElement => 'Delete this item?';
  @override
  String get irreversibleAction => 'This action can\'t be undone.';
  @override
  String get name => 'Name';
  @override
  String get molecule => 'Molecule';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Oestradiol';
  @override
  String get progesterone => 'Progesterone';
  @override
  String get testosterone => 'Testosterone';
  @override
  String get nandrolone => 'Nandrolone';
  @override
  String get dihydrotestosterone => 'Dihydrotestosterone';
  @override
  String get spironolactone => 'Spironolactone';
  @override
  String get cyproteroneAcetate => 'Cyproterone acetate';
  @override
  String get leuprorelinAcetate => 'Leuprorelin acetate';
  @override
  String get bicalutamide => 'Bicalutamide';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloxifene';
  @override
  String get tamoxifen => 'Tamoxifen';
  @override
  String get finasteride => 'Finasteride';
  @override
  String get dutasteride => 'Dutasteride';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazone';
  @override
  String get enanthate => 'Enanthate';
  @override
  String get valerate => 'Valerate';
  @override
  String get cypionate => 'Cypionate';
  @override
  String get undecylate => 'Undecylate';
  @override
  String get benzoate => 'Benzoate';
  @override
  String get cypionateSuspension => 'Cypionate suspension';
  @override
  String get medicationEstradiolEnanthate => 'Oestradiol enanthate';
  @override
  String get medicationEstradiolValerate => 'Oestradiol valerate';
  @override
  String get medicationEstradiolCypionate => 'Oestradiol cypionate';
  @override
  String get medicationEstradiolUndecylate => 'Oestradiol undecylate';
  @override
  String get medicationEstradiolBenzoate => 'Oestradiol benzoate';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Oestradiol cypionate suspension';
  @override
  String get medicationTestosteroneEnanthate => 'Testosterone enanthate';
  @override
  String get medicationTestosteroneValerate => 'Testosterone valerate';
  @override
  String get medicationTestosteroneCypionate => 'Testosterone cypionate';
  @override
  String get medicationTestosteroneUndecylate => 'Testosterone undecylate';
  @override
  String get medicationTestosteroneBenzoate => 'Testosterone benzoate';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Testosterone cypionate suspension';
  @override
  String get injection => 'Injection';
  @override
  String get oral => 'Oral';
  @override
  String get sublingual => 'Sublingual';
  @override
  String get patch => 'Patch';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implant';
  @override
  String get suppository => 'Suppository';
  @override
  String get transdermalSpray => 'Transdermal spray';
  @override
  String get transdermalDrops => 'Transdermal drops';
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
  String get injectionSideLeft => 'Left';
  @override
  String get injectionSideRight => 'Right';
  @override
  String get placementLeft => 'Left side';
  @override
  String get placementRight => 'Right side';
  @override
  String get placementLeftThigh => 'Left thigh';
  @override
  String get placementRightThigh => 'Right thigh';
  @override
  String get placementLeftArm => 'Left arm';
  @override
  String get placementRightArm => 'Right arm';
  @override
  String get placementLeftButtock => 'Left buttock';
  @override
  String get placementRightButtock => 'Right buttock';
  @override
  String get placementLeftAbdomen => 'Left abdomen';
  @override
  String get placementRightAbdomen => 'Right abdomen';
  @override
  String get injectionSites => 'Injection sites';
  @override
  String get injectionSitesDescription => 'Manage the sites you rotate between';
  @override
  String get addInjectionSite => 'Add site';
  @override
  String get customSiteLabel => 'Custom site name';
  @override
  String get noInjectionSitesYet => 'No sites yet';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Add a site below to get started.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Suggest per schedule';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Base the next-site suggestion on this schedule\'s history only.';
  @override
  String get requiredField => 'Required field';
  @override
  String get mustBePositiveNumber => 'Must be a positive number';
  @override
  String get mustBeBetween1And28 => 'Must be between 1 and 28';
  @override
  String get invalidTotalAmount => 'Invalid total amount';
  @override
  String get cannotExceedTotalCapacity => 'Cannot exceed total capacity';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dose per ${unit}';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} day ago',
        other: '${count} days ago',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'in ${count} day',
        other: 'in ${count} days',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Every day',
        other: 'Every ${count} days',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'Day ${day}, every month',
        other: 'Day ${day}, every ${count} months',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} created',
        other: '${count} created',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'On HRT for 1 day',
        other: 'On HRT for ${count} days',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'On HRT for 1 week',
        other: 'On HRT for ${count} weeks',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'On HRT for 1 month',
        other: 'On HRT for ${count} months',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'On HRT for 1 year',
        other: 'On HRT for ${count} years',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 intake logged',
        other: '${count} intakes logged',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '${count} ${unit} remaining',
        other: '${count} ${unit} remaining',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 syringe remaining',
        other: '${count} syringes remaining',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 wipe remaining',
        other: '${count} wipes remaining',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 needle remaining',
        other: '${count} needles remaining',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 glove remaining',
        other: '${count} gloves remaining',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: '1 bandage remaining',
        other: '${count} bandages remaining',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'pill',
        other: 'pills',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'patch',
        other: 'patches',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'pump',
        other: 'pumps',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'implant',
        other: 'implants',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'suppository',
        other: 'suppositories',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        count,
        one: 'spray',
        other: 'sprays',
      );
}

/// The flat map containing all translations for locale <en-GB>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEnGb {
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
      'asNeeded' => 'As needed',
      'taken' => 'Taken',
      'yesterday' => 'yesterday',
      'tomorrow' => 'tomorrow',
      'lastTaken' => 'Last taken',
      'neverTakenYet' => 'Never taken yet',
      'scheduleFrequencyDaily' => 'Daily',
      'scheduleFrequencyDailyDescription' => 'Every day, at specific times',
      'scheduleFrequencyInterval' => 'Interval',
      'scheduleFrequencyIntervalDescription' => 'Every few days',
      'scheduleFrequencyWeekly' => 'Weekly',
      'scheduleFrequencyWeeklyDescription' => 'Certain days of the week',
      'scheduleFrequencyMonthly' => 'Monthly',
      'scheduleFrequencyMonthlyDescription' => 'The same day every month',
      'scheduleFrequencyAsNeeded' => 'As needed',
      'scheduleFrequencyAsNeededDescription' => 'No fixed schedule',
      'newUpdateAvailable' => 'A new update is available!',
      'goToSettings' => 'Go to Settings',
      'settingsTitle' => 'Settings',
      'notifications' => 'Notifications',
      'schedulesAndNotifications' => 'Schedules & notifications',
      'general' => 'General',
      'schedules' => 'Schedules',
      'noSchedules' => 'No schedules',
      'language' => 'Language',
      'languageFollowDevice' => 'Follow device language',
      'selectLanguage' => 'Select Language',
      'enableNotifications' => 'Enable notifications',
      'enableNotificationsDescription' => 'Send reminders',
      'anchorToLastIntake' => 'Recalculate based on last intake',
      'anchorToLastIntakeDescription' =>
        'Schedules the next intake a full interval after you last took it',
      'notificationsDisabledTitle' => 'Notifications are disabled',
      'clickToOpenSettings' => 'Click to open settings',
      'exactRemindersDisabled' => 'Exact reminder times are disabled',
      'remindersDelayed' =>
        'Reminders may be slightly delayed. Tap to open settings.',
      'medicalSettings' => 'Medical settings',
      'theme' => 'Theme',
      'themeCustomizeColors' => 'Customise the app colours',
      'customThemeEnabled' => 'Custom theme',
      'themeGenerate' => 'Generate',
      'themeVariant' => 'Variant',
      'themeContrast' => 'Contrast',
      'themeContrastStandard' => 'Standard',
      'themeContrastMedium' => 'Medium',
      'themeContrastHigh' => 'High',
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
      'dayOfMonth' => 'Day of the month',
      'months' => 'months',
      'startDate' => 'Start date',
      'pickATime' => 'Pick a time',
      'addIntakeTime' => 'Add a time',
      'editScheduleInfo' => 'Edit schedule info',
      'scheduling' => 'Scheduling',
      'editSchedule' => 'Edit schedule',
      'deleteSchedule' => ({required Object name}) => 'Delete ${name}?',
      'addNotification' => 'Add a notification',
      'empty_intakes' => 'Taken intakes will appear here',
      'HrtCounter' => 'Time on HRT',
      'HrtCounterDescription' =>
        'Show how long you\'ve been on HRT and your total intakes',
      'hrtWidgetPlaceholder' => 'Open Mona to log your first intake',
      'hrtWidgetPreviewSample' => 'On HRT for 8 months',
      'hrtWidgetPreviewIntakeSample' => '16 intakes logged',
      'startOfDay' => 'Start of day',
      'startOfDayDescription' => ({required Object time}) =>
          'Time before ${time} counts towards the previous day',
      'chooseSchedule' => 'Choose a schedule',
      'addSchedulesFirst' => 'Add schedules first.',
      'editIntake' => 'Edit intake',
      'date' => 'Date',
      'amount' => 'Amount',
      'takenAmount' => 'Taken amount',
      'wastedAmount' => 'Wasted amount',
      'none' => 'None',
      'supplyItem' => 'Supply item',
      'chooseItem' => 'Choose an item',
      'noItemsToAdd' => 'No items available',
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
      'empty_levels' => 'Oestradiol injections will display in this tab',
      'bloodTestsTitle' => 'Blood Tests',
      'empty_blood_tests' =>
        'Taken blood tests will appear here. Start by using the Add button!',
      'addBloodTest' => 'Add a blood test',
      'editBloodTest' => 'Edit blood test',
      'newBloodTest' => 'New blood test',
      'deleteBloodTest' => 'Delete this blood test?',
      'estradiolLevelLabel' => 'Oestradiol level',
      'testosteroneLevelLabel' => 'Testosterone level',
      'bloodTestDateLabel' => 'Test date',
      'chartNowConcentration' => ({required Object value}) => 'Now ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'No supplies. Add an item to get started.',
      'newItem' => 'New item',
      'adminRoute' => 'Administration route',
      'totalAmount' => 'Total amount',
      'concentration' => 'Concentration',
      'editItem' => 'Edit item',
      'usedAmount' => 'Used amount',
      'deleteItem' => ({required Object name}) => 'Delete ${name}?',
      'allItemsFilter' => 'All',
      'medicationItemsFilter' => 'Medication',
      'genericItems' => 'Consumables',
      'medicationItemType' => 'Medication',
      'genericItemType' => 'Consumable',
      'supplyType' => 'Type',
      'syringe' => 'Syringes',
      'wipe' => 'Wipes',
      'needle' => 'Needles',
      'gloves' => 'Gloves',
      'bandage' => 'Bandages',
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
      'estradiol' => 'Oestradiol',
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
      'medicationEstradiolEnanthate' => 'Oestradiol enanthate',
      'medicationEstradiolValerate' => 'Oestradiol valerate',
      'medicationEstradiolCypionate' => 'Oestradiol cypionate',
      'medicationEstradiolUndecylate' => 'Oestradiol undecylate',
      'medicationEstradiolBenzoate' => 'Oestradiol benzoate',
      'medicationEstradiolCypionateSuspension' =>
        'Oestradiol cypionate suspension',
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
      'unitNgPerMl' => 'ng/mL',
      'injectionSideLeft' => 'Left',
      'injectionSideRight' => 'Right',
      'placementLeft' => 'Left side',
      'placementRight' => 'Right side',
      'placementLeftThigh' => 'Left thigh',
      'placementRightThigh' => 'Right thigh',
      'placementLeftArm' => 'Left arm',
      'placementRightArm' => 'Right arm',
      'placementLeftButtock' => 'Left buttock',
      'placementRightButtock' => 'Right buttock',
      'placementLeftAbdomen' => 'Left abdomen',
      'placementRightAbdomen' => 'Right abdomen',
      'injectionSites' => 'Injection sites',
      'injectionSitesDescription' => 'Manage the sites you rotate between',
      'addInjectionSite' => 'Add site',
      'customSiteLabel' => 'Custom site name',
      'noInjectionSitesYet' => 'No sites yet',
      'noInjectionAddOneToGetStarted' => 'Add a site below to get started.',
      'placementSuggestionPerScheduleTitle' => 'Suggest per schedule',
      'placementSuggestionPerScheduleDescription' =>
        'Base the next-site suggestion on this schedule\'s history only.',
      'requiredField' => 'Required field',
      'mustBePositiveNumber' => 'Must be a positive number',
      'mustBeBetween1And28' => 'Must be between 1 and 28',
      'invalidTotalAmount' => 'Invalid total amount',
      'cannotExceedTotalCapacity' => 'Cannot exceed total capacity',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dose per ${unit}',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '${count} day ago',
            other: '${count} days ago',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'in ${count} day',
            other: 'in ${count} days',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'Every day',
            other: 'Every ${count} days',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'Day ${day}, every month',
            other: 'Day ${day}, every ${count} months',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '${count} created',
            other: '${count} created',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'On HRT for 1 day',
            other: 'On HRT for ${count} days',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'On HRT for 1 week',
            other: 'On HRT for ${count} weeks',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'On HRT for 1 month',
            other: 'On HRT for ${count} months',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: 'On HRT for 1 year',
            other: 'On HRT for ${count} years',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '1 intake logged',
            other: '${count} intakes logged',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
            count,
            one: '${count} ${unit} remaining',
            other: '${count} ${unit} remaining',
          ),
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
      _ => null,
    };
  }
}
