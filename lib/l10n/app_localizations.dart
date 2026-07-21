import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ko'),
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Mona'**
  String get appTitle;

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Mona'**
  String get nav_home;

  /// No description provided for @nav_intakes.
  ///
  /// In en, this message translates to:
  /// **'Intakes'**
  String get nav_intakes;

  /// No description provided for @nav_levels.
  ///
  /// In en, this message translates to:
  /// **'Levels'**
  String get nav_levels;

  /// No description provided for @nav_supplies.
  ///
  /// In en, this message translates to:
  /// **'Supplies'**
  String get nav_supplies;

  /// No description provided for @takeAnIntake.
  ///
  /// In en, this message translates to:
  /// **'Take an intake'**
  String get takeAnIntake;

  /// No description provided for @addAnItem.
  ///
  /// In en, this message translates to:
  /// **'Add an item'**
  String get addAnItem;

  /// No description provided for @empty_home.
  ///
  /// In en, this message translates to:
  /// **'Start by adding a schedule in Settings'**
  String get empty_home;

  /// No description provided for @allDone.
  ///
  /// In en, this message translates to:
  /// **'All done!'**
  String get allDone;

  /// No description provided for @noIntakesDue.
  ///
  /// In en, this message translates to:
  /// **'No intakes due today'**
  String get noIntakesDue;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @taken.
  ///
  /// In en, this message translates to:
  /// **'taken'**
  String get taken;

  /// Past offset in days; =1 is the word “yesterday”, not a numeric phrase.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{yesterday} other{{count} days ago}}'**
  String daysAgoCount(int count);

  /// Future offset in days; =1 is the word “tomorrow”, not a numeric phrase.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{tomorrow} other{in {count} days}}'**
  String inDaysCount(int count);

  /// No description provided for @lastTaken.
  ///
  /// In en, this message translates to:
  /// **'Last taken'**
  String get lastTaken;

  /// No description provided for @neverTakenYet.
  ///
  /// In en, this message translates to:
  /// **'Never taken yet'**
  String get neverTakenYet;

  /// No description provided for @scheduleFrequencyDaily.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get scheduleFrequencyDaily;

  /// No description provided for @scheduleFrequencyEveryNDays.
  ///
  /// In en, this message translates to:
  /// **'Every {days} days'**
  String scheduleFrequencyEveryNDays(Object days);

  /// No description provided for @newUpdateAvailable.
  ///
  /// In en, this message translates to:
  /// **'A new update is available!'**
  String get newUpdateAvailable;

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings'**
  String get goToSettings;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @schedulesAndNotifications.
  ///
  /// In en, this message translates to:
  /// **'Schedules & notifications'**
  String get schedulesAndNotifications;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @schedules.
  ///
  /// In en, this message translates to:
  /// **'Schedules'**
  String get schedules;

  /// No description provided for @noSchedules.
  ///
  /// In en, this message translates to:
  /// **'No schedules'**
  String get noSchedules;

  /// No description provided for @schedulesCreated.
  ///
  /// In en, this message translates to:
  /// **'{count} created'**
  String schedulesCreated(Object count);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageFollowDevice.
  ///
  /// In en, this message translates to:
  /// **'Follow device language'**
  String get languageFollowDevice;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get enableNotifications;

  /// No description provided for @enableNotificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Send reminders for schedules'**
  String get enableNotificationsDescription;

  /// No description provided for @notificationsDisabledTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications are disabled'**
  String get notificationsDisabledTitle;

  /// No description provided for @clickToOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Click to open settings'**
  String get clickToOpenSettings;

  /// No description provided for @exactRemindersDisabled.
  ///
  /// In en, this message translates to:
  /// **'Exact reminder times are disabled'**
  String get exactRemindersDisabled;

  /// No description provided for @remindersDelayed.
  ///
  /// In en, this message translates to:
  /// **'Reminders may be slightly delayed. Tap to open settings.'**
  String get remindersDelayed;

  /// No description provided for @autoUpdate.
  ///
  /// In en, this message translates to:
  /// **'Auto-Update'**
  String get autoUpdate;

  /// No description provided for @autoUpdateDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically check new updates when app is launched'**
  String get autoUpdateDescription;

  /// No description provided for @checkForUpdates.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get checkForUpdates;

  /// No description provided for @checkForUpdatesDescription.
  ///
  /// In en, this message translates to:
  /// **'Check for the latest version manually\nThis will connect you to Internet\n(No data will be sent)'**
  String get checkForUpdatesDescription;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Mona version {version}'**
  String appVersion(Object version);

  /// No description provided for @backupSavedTo.
  ///
  /// In en, this message translates to:
  /// **'Backup saved to: {path}'**
  String backupSavedTo(Object path);

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export: {error}'**
  String exportFailed(Object error);

  /// No description provided for @importDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Data'**
  String get importDataTitle;

  /// No description provided for @importDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Restore data from a JSON backup'**
  String get importDataSubtitle;

  /// No description provided for @importDataOverwriteWarning.
  ///
  /// In en, this message translates to:
  /// **'This will overwrite all your current data with the backup. This action cannot be undone. Do you want to continue?'**
  String get importDataOverwriteWarning;

  /// No description provided for @importConfirm.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get importConfirm;

  /// No description provided for @importSuccessfulTitle.
  ///
  /// In en, this message translates to:
  /// **'Import Successful'**
  String get importSuccessfulTitle;

  /// No description provided for @importRestartRequired.
  ///
  /// In en, this message translates to:
  /// **'Please restart the app to apply the restored data.'**
  String get importRestartRequired;

  /// No description provided for @closeApp.
  ///
  /// In en, this message translates to:
  /// **'Close App'**
  String get closeApp;

  /// No description provided for @importFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to import: {error}'**
  String importFailed(Object error);

  /// No description provided for @updates.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updates;

  /// No description provided for @dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// No description provided for @exportDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportDataTitle;

  /// No description provided for @exportDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Save your data to a JSON file'**
  String get exportDataSubtitle;

  /// No description provided for @updateNoCompatibleApk.
  ///
  /// In en, this message translates to:
  /// **'No compatible update found for your device.'**
  String get updateNoCompatibleApk;

  /// No description provided for @updateAppUpToDate.
  ///
  /// In en, this message translates to:
  /// **'Your app is up to date!'**
  String get updateAppUpToDate;

  /// No description provided for @updateCheckNetworkError.
  ///
  /// In en, this message translates to:
  /// **'Could not check for updates right now.'**
  String get updateCheckNetworkError;

  /// No description provided for @updateDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateDialogTitle;

  /// No description provided for @updateDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Version {latest} is available! (Current: {current})\n\nAn update compatible with your device is ready to be installed.'**
  String updateDialogBody(Object current, Object latest);

  /// No description provided for @updateDownloadAndInstall.
  ///
  /// In en, this message translates to:
  /// **'Download & Install'**
  String get updateDownloadAndInstall;

  /// No description provided for @updateInstallPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission is required to install updates.'**
  String get updateInstallPermissionRequired;

  /// No description provided for @updateDownloadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Downloading Update...'**
  String get updateDownloadingTitle;

  /// No description provided for @updateFailedOpenInstaller.
  ///
  /// In en, this message translates to:
  /// **'Failed to open installer: {message}'**
  String updateFailedOpenInstaller(Object message);

  /// No description provided for @updateDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed. Please check your connection.'**
  String get updateDownloadFailed;

  /// No description provided for @notificationMedicationReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to take {scheduleName}'**
  String notificationMedicationReminderTitle(Object scheduleName);

  /// No description provided for @notificationMedicationReminderBody.
  ///
  /// In en, this message translates to:
  /// **'Scheduled for {dateTime}'**
  String notificationMedicationReminderBody(Object dateTime);

  /// No description provided for @addSchedule.
  ///
  /// In en, this message translates to:
  /// **'Add a schedule'**
  String get addSchedule;

  /// No description provided for @addScheduleToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add a schedule to get started.'**
  String get addScheduleToGetStarted;

  /// No description provided for @newSchedule.
  ///
  /// In en, this message translates to:
  /// **'New schedule'**
  String get newSchedule;

  /// No description provided for @every.
  ///
  /// In en, this message translates to:
  /// **'Every'**
  String get every;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @editScheduleInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit schedule info'**
  String get editScheduleInfo;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get noNotifications;

  /// No description provided for @notificationsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} notifications'**
  String notificationsCount(Object count);

  /// No description provided for @editSchedule.
  ///
  /// In en, this message translates to:
  /// **'Edit schedule'**
  String get editSchedule;

  /// No description provided for @deleteSchedule.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}?'**
  String deleteSchedule(Object name);

  /// No description provided for @scheduleNotifications.
  ///
  /// In en, this message translates to:
  /// **'Schedule notifications'**
  String get scheduleNotifications;

  /// No description provided for @addNotification.
  ///
  /// In en, this message translates to:
  /// **'Add a notification'**
  String get addNotification;

  /// No description provided for @noNotificationsForSchedule.
  ///
  /// In en, this message translates to:
  /// **'No notifications for {scheduleName}. You can add one using the Add button.'**
  String noNotificationsForSchedule(Object scheduleName);

  /// No description provided for @notificationsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Notifications have been updated!'**
  String get notificationsUpdated;

  /// No description provided for @notificationsUpdatedDescription.
  ///
  /// In en, this message translates to:
  /// **'Each schedule now has its own notifications.\n\nPlease set up notifications for your schedules to make sure you don\'t miss anything.'**
  String get notificationsUpdatedDescription;

  /// No description provided for @dontShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show again'**
  String get dontShowAgain;

  /// No description provided for @scheduleSettings.
  ///
  /// In en, this message translates to:
  /// **'Schedule settings'**
  String get scheduleSettings;

  /// No description provided for @empty_intakes.
  ///
  /// In en, this message translates to:
  /// **'Taken instakes will appear here'**
  String get empty_intakes;

  /// No description provided for @chooseSchedule.
  ///
  /// In en, this message translates to:
  /// **'Choose a schedule'**
  String get chooseSchedule;

  /// No description provided for @addSchedulesFirst.
  ///
  /// In en, this message translates to:
  /// **'Add schedules first.'**
  String get addSchedulesFirst;

  /// No description provided for @editIntake.
  ///
  /// In en, this message translates to:
  /// **'Edit intake'**
  String get editIntake;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @supplyItem.
  ///
  /// In en, this message translates to:
  /// **'Supply item'**
  String get supplyItem;

  /// No description provided for @injectionSide.
  ///
  /// In en, this message translates to:
  /// **'Injection side'**
  String get injectionSide;

  /// No description provided for @deleteIntake.
  ///
  /// In en, this message translates to:
  /// **'Delete this intake?'**
  String get deleteIntake;

  /// No description provided for @takeMedication.
  ///
  /// In en, this message translates to:
  /// **'Take {scheduleName}'**
  String takeMedication(Object scheduleName);

  /// No description provided for @takeIntake.
  ///
  /// In en, this message translates to:
  /// **'Take intake'**
  String get takeIntake;

  /// No description provided for @needleDeadSpace.
  ///
  /// In en, this message translates to:
  /// **'Needle dead space'**
  String get needleDeadSpace;

  /// No description provided for @microliters.
  ///
  /// In en, this message translates to:
  /// **'μL'**
  String get microliters;

  /// No description provided for @empty_levels.
  ///
  /// In en, this message translates to:
  /// **'Estradiol injections will display in this tab'**
  String get empty_levels;

  /// No description provided for @bloodTestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Blood Tests'**
  String get bloodTestsTitle;

  /// No description provided for @empty_blood_tests.
  ///
  /// In en, this message translates to:
  /// **'Taken blood tests will appear here. Start by using the Add button!'**
  String get empty_blood_tests;

  /// No description provided for @addBloodTest.
  ///
  /// In en, this message translates to:
  /// **'Add a blood test'**
  String get addBloodTest;

  /// No description provided for @editBloodTest.
  ///
  /// In en, this message translates to:
  /// **'Edit blood test'**
  String get editBloodTest;

  /// No description provided for @newBloodTest.
  ///
  /// In en, this message translates to:
  /// **'New blood test'**
  String get newBloodTest;

  /// No description provided for @deleteBloodTest.
  ///
  /// In en, this message translates to:
  /// **'Delete this blood test?'**
  String get deleteBloodTest;

  /// No description provided for @estradiolLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Estradiol level'**
  String get estradiolLevelLabel;

  /// No description provided for @testosteroneLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Testosterone level'**
  String get testosteroneLevelLabel;

  /// No description provided for @bloodTestDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Test date'**
  String get bloodTestDateLabel;

  /// No description provided for @chartNowConcentration.
  ///
  /// In en, this message translates to:
  /// **'Now {value}'**
  String chartNowConcentration(Object value);

  /// No description provided for @chartBloodTestLevelTooltip.
  ///
  /// In en, this message translates to:
  /// **'{date}: {level}'**
  String chartBloodTestLevelTooltip(Object date, Object level);

  /// No description provided for @empty_supplies.
  ///
  /// In en, this message translates to:
  /// **'No supplies. Add an item to get started.'**
  String get empty_supplies;

  /// No description provided for @newItem.
  ///
  /// In en, this message translates to:
  /// **'New item'**
  String get newItem;

  /// No description provided for @adminRoute.
  ///
  /// In en, this message translates to:
  /// **'Administration route'**
  String get adminRoute;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total amount'**
  String get totalAmount;

  /// No description provided for @concentration.
  ///
  /// In en, this message translates to:
  /// **'Concentration'**
  String get concentration;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit item'**
  String get editItem;

  /// No description provided for @usedAmount.
  ///
  /// In en, this message translates to:
  /// **'Used amount'**
  String get usedAmount;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}?'**
  String deleteItem(Object name);

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'{amount} {unit} remaining'**
  String remaining(Object amount, Object unit);

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteElement.
  ///
  /// In en, this message translates to:
  /// **'Delete this item?'**
  String get deleteElement;

  /// No description provided for @irreversibleAction.
  ///
  /// In en, this message translates to:
  /// **'This action can\'t be undone.'**
  String get irreversibleAction;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @molecule.
  ///
  /// In en, this message translates to:
  /// **'Molecule'**
  String get molecule;

  /// No description provided for @ester.
  ///
  /// In en, this message translates to:
  /// **'Ester'**
  String get ester;

  /// No description provided for @estradiol.
  ///
  /// In en, this message translates to:
  /// **'Estradiol'**
  String get estradiol;

  /// No description provided for @progesterone.
  ///
  /// In en, this message translates to:
  /// **'Progesterone'**
  String get progesterone;

  /// No description provided for @testosterone.
  ///
  /// In en, this message translates to:
  /// **'Testosterone'**
  String get testosterone;

  /// No description provided for @nandrolone.
  ///
  /// In en, this message translates to:
  /// **'Nandrolone'**
  String get nandrolone;

  /// No description provided for @spironolactone.
  ///
  /// In en, this message translates to:
  /// **'Spironolactone'**
  String get spironolactone;

  /// No description provided for @cyproteroneAcetate.
  ///
  /// In en, this message translates to:
  /// **'Cyproterone acetate'**
  String get cyproteroneAcetate;

  /// No description provided for @leuprorelinAcetate.
  ///
  /// In en, this message translates to:
  /// **'Leuprorelin acetate'**
  String get leuprorelinAcetate;

  /// No description provided for @bicalutamide.
  ///
  /// In en, this message translates to:
  /// **'Bicalutamide'**
  String get bicalutamide;

  /// No description provided for @decapeptyl.
  ///
  /// In en, this message translates to:
  /// **'Decapeptyl'**
  String get decapeptyl;

  /// No description provided for @raloxifene.
  ///
  /// In en, this message translates to:
  /// **'Raloxifene'**
  String get raloxifene;

  /// No description provided for @tamoxifen.
  ///
  /// In en, this message translates to:
  /// **'Tamoxifen'**
  String get tamoxifen;

  /// No description provided for @finasteride.
  ///
  /// In en, this message translates to:
  /// **'Finasteride'**
  String get finasteride;

  /// No description provided for @dutasteride.
  ///
  /// In en, this message translates to:
  /// **'Dutasteride'**
  String get dutasteride;

  /// No description provided for @minoxidil.
  ///
  /// In en, this message translates to:
  /// **'Minoxidil'**
  String get minoxidil;

  /// No description provided for @pioglitazone.
  ///
  /// In en, this message translates to:
  /// **'Pioglitazone'**
  String get pioglitazone;

  /// No description provided for @enanthate.
  ///
  /// In en, this message translates to:
  /// **'Enanthate'**
  String get enanthate;

  /// No description provided for @valerate.
  ///
  /// In en, this message translates to:
  /// **'Valerate'**
  String get valerate;

  /// No description provided for @cypionate.
  ///
  /// In en, this message translates to:
  /// **'Cypionate'**
  String get cypionate;

  /// No description provided for @undecylate.
  ///
  /// In en, this message translates to:
  /// **'Undecylate'**
  String get undecylate;

  /// No description provided for @benzoate.
  ///
  /// In en, this message translates to:
  /// **'Benzoate'**
  String get benzoate;

  /// No description provided for @cypionateSuspension.
  ///
  /// In en, this message translates to:
  /// **'Cypionate suspension'**
  String get cypionateSuspension;

  /// No description provided for @medicationEstradiolEnanthate.
  ///
  /// In en, this message translates to:
  /// **'Estradiol enanthate'**
  String get medicationEstradiolEnanthate;

  /// No description provided for @medicationEstradiolValerate.
  ///
  /// In en, this message translates to:
  /// **'Estradiol valerate'**
  String get medicationEstradiolValerate;

  /// No description provided for @medicationEstradiolCypionate.
  ///
  /// In en, this message translates to:
  /// **'Estradiol cypionate'**
  String get medicationEstradiolCypionate;

  /// No description provided for @medicationEstradiolUndecylate.
  ///
  /// In en, this message translates to:
  /// **'Estradiol undecylate'**
  String get medicationEstradiolUndecylate;

  /// No description provided for @medicationEstradiolBenzoate.
  ///
  /// In en, this message translates to:
  /// **'Estradiol benzoate'**
  String get medicationEstradiolBenzoate;

  /// No description provided for @medicationEstradiolCypionateSuspension.
  ///
  /// In en, this message translates to:
  /// **'Estradiol cypionate suspension'**
  String get medicationEstradiolCypionateSuspension;

  /// No description provided for @medicationTestosteroneEnanthate.
  ///
  /// In en, this message translates to:
  /// **'Testosterone enanthate'**
  String get medicationTestosteroneEnanthate;

  /// No description provided for @medicationTestosteroneValerate.
  ///
  /// In en, this message translates to:
  /// **'Testosterone valerate'**
  String get medicationTestosteroneValerate;

  /// No description provided for @medicationTestosteroneCypionate.
  ///
  /// In en, this message translates to:
  /// **'Testosterone cypionate'**
  String get medicationTestosteroneCypionate;

  /// No description provided for @medicationTestosteroneUndecylate.
  ///
  /// In en, this message translates to:
  /// **'Testosterone undecylate'**
  String get medicationTestosteroneUndecylate;

  /// No description provided for @medicationTestosteroneBenzoate.
  ///
  /// In en, this message translates to:
  /// **'Testosterone benzoate'**
  String get medicationTestosteroneBenzoate;

  /// No description provided for @medicationTestosteroneCypionateSuspension.
  ///
  /// In en, this message translates to:
  /// **'Testosterone cypionate suspension'**
  String get medicationTestosteroneCypionateSuspension;

  /// No description provided for @injection.
  ///
  /// In en, this message translates to:
  /// **'Injection'**
  String get injection;

  /// No description provided for @oral.
  ///
  /// In en, this message translates to:
  /// **'Oral'**
  String get oral;

  /// No description provided for @sublingual.
  ///
  /// In en, this message translates to:
  /// **'Sublingual'**
  String get sublingual;

  /// No description provided for @patch.
  ///
  /// In en, this message translates to:
  /// **'Patch'**
  String get patch;

  /// No description provided for @gel.
  ///
  /// In en, this message translates to:
  /// **'Gel'**
  String get gel;

  /// No description provided for @implant.
  ///
  /// In en, this message translates to:
  /// **'Implant'**
  String get implant;

  /// No description provided for @suppository.
  ///
  /// In en, this message translates to:
  /// **'Suppository'**
  String get suppository;

  /// No description provided for @transdermal.
  ///
  /// In en, this message translates to:
  /// **'Transdermal spray'**
  String get transdermal;

  /// No description provided for @administrationRouteUnitMl.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{ml} other{ml}}'**
  String administrationRouteUnitMl(num count);

  /// No description provided for @administrationRouteUnitPill.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{pill} other{pills}}'**
  String administrationRouteUnitPill(num count);

  /// No description provided for @administrationRouteUnitPatch.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{patch} other{patches}}'**
  String administrationRouteUnitPatch(num count);

  /// No description provided for @administrationRouteUnitPump.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{pump} other{pumps}}'**
  String administrationRouteUnitPump(num count);

  /// No description provided for @administrationRouteUnitImplant.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{implant} other{implants}}'**
  String administrationRouteUnitImplant(num count);

  /// No description provided for @administrationRouteUnitSuppository.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{suppository} other{suppositories}}'**
  String administrationRouteUnitSuppository(num count);

  /// No description provided for @administrationRouteUnitSpray.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{spray} other{sprays}}'**
  String administrationRouteUnitSpray(num count);

  /// No description provided for @injectionSideLeft.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get injectionSideLeft;

  /// No description provided for @injectionSideRight.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get injectionSideRight;

  /// No description provided for @intakeSummaryInjectionSideLeft.
  ///
  /// In en, this message translates to:
  /// **'Left side'**
  String get intakeSummaryInjectionSideLeft;

  /// No description provided for @intakeSummaryInjectionSideRight.
  ///
  /// In en, this message translates to:
  /// **'Right side'**
  String get intakeSummaryInjectionSideRight;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @mustBePositiveNumber.
  ///
  /// In en, this message translates to:
  /// **'Must be a positive number'**
  String get mustBePositiveNumber;

  /// No description provided for @invalidTotalAmount.
  ///
  /// In en, this message translates to:
  /// **'Invalid total amount'**
  String get invalidTotalAmount;

  /// No description provided for @cannotExceedTotalCapacity.
  ///
  /// In en, this message translates to:
  /// **'Cannot exceed total capacity'**
  String get cannotExceedTotalCapacity;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'ko',
        'pt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
