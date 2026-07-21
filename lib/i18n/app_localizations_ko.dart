// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Mona';

  @override
  String get nav_home => 'Mona';

  @override
  String get nav_intakes => '투여 기록';

  @override
  String get nav_levels => '농도';

  @override
  String get nav_supplies => '보유량';

  @override
  String get takeAnIntake => '[Take an intake]';

  @override
  String get addAnItem => '[Add an item]';

  @override
  String get empty_home => '설정에서 일정을 추가하여 시작하세요';

  @override
  String get allDone => '모두 완료!';

  @override
  String get noIntakesDue => '오늘 투여할 약이 없습니다';

  @override
  String get upcoming => '예정';

  @override
  String get today => '오늘';

  @override
  String get taken => '투여함';

  @override
  String daysAgoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: 'yesterday',
    );
    return '[$_temp0]';
  }

  @override
  String inDaysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'in $count days',
      one: 'tomorrow',
    );
    return '[$_temp0]';
  }

  @override
  String get lastTaken => '마지막 투여';

  @override
  String get neverTakenYet => '아직 투여한 적 없음';

  @override
  String get scheduleFrequencyDaily => '[Every day]';

  @override
  String scheduleFrequencyEveryNDays(Object days) {
    return '[Every $days days]';
  }

  @override
  String get newUpdateAvailable => '[A new update is available!]';

  @override
  String get goToSettings => '[Go to Settings]';

  @override
  String get settingsTitle => '설정';

  @override
  String get notifications => '알림';

  @override
  String get schedulesAndNotifications => '[Schedules & notifications]';

  @override
  String get general => '[General]';

  @override
  String get schedules => '일정';

  @override
  String get noSchedules => '일정 없음';

  @override
  String schedulesCreated(Object count) {
    return '$count개 생성됨';
  }

  @override
  String get language => '언어';

  @override
  String get languageFollowDevice => '[Follow device language]';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get enableNotifications => '알림 활성화';

  @override
  String get enableNotificationsDescription => '[Send reminders for schedules]';

  @override
  String get notificationsDisabledTitle => '알림이 비활성화되어 있습니다';

  @override
  String get clickToOpenSettings => '설정을 열려면 탭하세요';

  @override
  String get exactRemindersDisabled => '정시 알림이 비활성화되어 있습니다';

  @override
  String get remindersDelayed => '알림이 약간 지연될 수 있습니다. 설정을 열려면 탭하세요.';

  @override
  String get autoUpdate => '자동 업데이트';

  @override
  String get autoUpdateDescription => '앱 실행 시 자동으로 새 업데이트를 확인합니다';

  @override
  String get checkForUpdates => '업데이트 확인';

  @override
  String get checkForUpdatesDescription =>
      '최신 버전을 수동으로 확인합니다\n인터넷에 연결됩니다\n(데이터는 전송되지 않습니다)';

  @override
  String appVersion(Object version) {
    return 'Mona 버전 $version';
  }

  @override
  String backupSavedTo(Object path) {
    return '[Backup saved to: $path]';
  }

  @override
  String exportFailed(Object error) {
    return '[Failed to export: $error]';
  }

  @override
  String get importDataTitle => '[Import Data]';

  @override
  String get importDataSubtitle => '[Restore data from a JSON backup]';

  @override
  String get importDataOverwriteWarning =>
      '[This will overwrite all your current data with the backup. This action cannot be undone. Do you want to continue?]';

  @override
  String get importConfirm => '[Import]';

  @override
  String get importSuccessfulTitle => '[Import Successful]';

  @override
  String get importRestartRequired =>
      '[Please restart the app to apply the restored data.]';

  @override
  String get closeApp => '[Close App]';

  @override
  String importFailed(Object error) {
    return '[Failed to import: $error]';
  }

  @override
  String get updates => '[Updates]';

  @override
  String get dataManagement => '[Data Management]';

  @override
  String get exportDataTitle => '[Export Data]';

  @override
  String get exportDataSubtitle => '[Save your data to a JSON file]';

  @override
  String get updateNoCompatibleApk =>
      '[No compatible update found for your device.]';

  @override
  String get updateAppUpToDate => '[Your app is up to date!]';

  @override
  String get updateCheckNetworkError =>
      '[Could not check for updates right now.]';

  @override
  String get updateDialogTitle => '[Update Available]';

  @override
  String updateDialogBody(Object current, Object latest) {
    return '[Version $latest is available! (Current: $current)\n\nAn update compatible with your device is ready to be installed.]';
  }

  @override
  String get updateDownloadAndInstall => '[Download & Install]';

  @override
  String get updateInstallPermissionRequired =>
      '[Permission is required to install updates.]';

  @override
  String get updateDownloadingTitle => '[Downloading Update...]';

  @override
  String updateFailedOpenInstaller(Object message) {
    return '[Failed to open installer: $message]';
  }

  @override
  String get updateDownloadFailed =>
      '[Download failed. Please check your connection.]';

  @override
  String notificationMedicationReminderTitle(Object scheduleName) {
    return '[Time to take $scheduleName]';
  }

  @override
  String notificationMedicationReminderBody(Object dateTime) {
    return '[Scheduled for $dateTime]';
  }

  @override
  String get addSchedule => '일정 추가';

  @override
  String get addScheduleToGetStarted => '시작하려면 일정을 추가하세요.';

  @override
  String get newSchedule => '새 일정';

  @override
  String get every => '매';

  @override
  String get days => '일';

  @override
  String get startDate => '시작일';

  @override
  String get editScheduleInfo => '일정 정보 편집';

  @override
  String get noNotifications => '알림 없음';

  @override
  String notificationsCount(Object count) {
    return '알림 $count개';
  }

  @override
  String get editSchedule => '일정 편집';

  @override
  String deleteSchedule(Object name) {
    return '$name을(를) 삭제하시겠습니까?';
  }

  @override
  String get scheduleNotifications => '일정 알림';

  @override
  String get addNotification => '알림 추가';

  @override
  String noNotificationsForSchedule(Object scheduleName) {
    return '$scheduleName에 대한 알림이 없습니다. 추가 버튼을 사용하여 알림을 추가할 수 있습니다.';
  }

  @override
  String get notificationsUpdated => '알림이 업데이트되었습니다!';

  @override
  String get notificationsUpdatedDescription =>
      '이제 각 일정마다 개별 알림이 설정됩니다.\n\n일정에 대한 알림을 설정하여 놓치지 않도록 하세요.';

  @override
  String get dontShowAgain => '다시 표시하지 않기';

  @override
  String get scheduleSettings => '일정 설정';

  @override
  String get empty_intakes => '투여 기록이 여기에 표시됩니다';

  @override
  String get chooseSchedule => '일정 선택';

  @override
  String get addSchedulesFirst => '먼저 일정을 추가하세요.';

  @override
  String get editIntake => '투여 기록 편집';

  @override
  String get date => '날짜';

  @override
  String get amount => '용량';

  @override
  String get none => '없음';

  @override
  String get supplyItem => '보유 항목';

  @override
  String get injectionSide => '주사 부위';

  @override
  String get deleteIntake => '이 투여 기록을 삭제하시겠습니까?';

  @override
  String takeMedication(Object scheduleName) {
    return '$scheduleName 투여';
  }

  @override
  String get takeIntake => '투여 기록';

  @override
  String get needleDeadSpace => '주사바늘 잔여 공간(사강)';

  @override
  String get microliters => 'μL';

  @override
  String get empty_levels => '[Estradiol injections will display in this tab]';

  @override
  String get bloodTestsTitle => '[Blood Tests]';

  @override
  String get empty_blood_tests =>
      '[Taken blood tests will appear here. Start by using the Add button!]';

  @override
  String get addBloodTest => '[Add a blood test]';

  @override
  String get editBloodTest => '[Edit blood test]';

  @override
  String get newBloodTest => '[New blood test]';

  @override
  String get deleteBloodTest => '[Delete this blood test?]';

  @override
  String get estradiolLevelLabel => '[Estradiol level]';

  @override
  String get testosteroneLevelLabel => '[Testosterone level]';

  @override
  String get bloodTestDateLabel => '[Test date]';

  @override
  String chartNowConcentration(Object value) {
    return '[Now $value]';
  }

  @override
  String chartBloodTestLevelTooltip(Object date, Object level) {
    return '[$date: $level]';
  }

  @override
  String get empty_supplies => '보유 중인 약품이 없습니다. 항목을 추가하여 시작하세요.';

  @override
  String get newItem => '새 항목';

  @override
  String get adminRoute => '투여 경로';

  @override
  String get totalAmount => '총 용량';

  @override
  String get concentration => '농도';

  @override
  String get editItem => '항목 편집';

  @override
  String get usedAmount => '사용량';

  @override
  String deleteItem(Object name) {
    return '$name을(를) 삭제하시겠습니까?';
  }

  @override
  String remaining(Object amount, Object unit) {
    return '$amount $unit 남음';
  }

  @override
  String get add => '추가';

  @override
  String get save => '저장';

  @override
  String get cancel => '[Cancel]';

  @override
  String get next => '다음';

  @override
  String get delete => '[Delete]';

  @override
  String get deleteElement => '[Delete this item?]';

  @override
  String get irreversibleAction => '[This action can\'t be undone.]';

  @override
  String get name => '이름';

  @override
  String get molecule => '성분';

  @override
  String get ester => '약효 특성(Ester)';

  @override
  String get estradiol => '에스트라디올';

  @override
  String get progesterone => '프로게스테론';

  @override
  String get testosterone => '테스토스테론';

  @override
  String get nandrolone => '난드롤론';

  @override
  String get spironolactone => '스피로노락톤';

  @override
  String get cyproteroneAcetate => '시프로테론 아세테이트';

  @override
  String get leuprorelinAcetate => '류프로렐린 아세테이트';

  @override
  String get bicalutamide => '비칼루타미드';

  @override
  String get decapeptyl => '데카펩틸';

  @override
  String get raloxifene => '라록시펜';

  @override
  String get tamoxifen => '타목시펜';

  @override
  String get finasteride => '피나스테리드';

  @override
  String get dutasteride => '두타스테리드';

  @override
  String get minoxidil => '미녹시딜';

  @override
  String get pioglitazone => '[Pioglitazone]';

  @override
  String get enanthate => '에난테이트';

  @override
  String get valerate => '발레레이트';

  @override
  String get cypionate => '시피오네이트';

  @override
  String get undecylate => '운데실레이트';

  @override
  String get benzoate => '벤조에이트';

  @override
  String get cypionateSuspension => '시피오네이트 현탁액';

  @override
  String get medicationEstradiolEnanthate => '[Estradiol enanthate]';

  @override
  String get medicationEstradiolValerate => '[Estradiol valerate]';

  @override
  String get medicationEstradiolCypionate => '[Estradiol cypionate]';

  @override
  String get medicationEstradiolUndecylate => '[Estradiol undecylate]';

  @override
  String get medicationEstradiolBenzoate => '[Estradiol benzoate]';

  @override
  String get medicationEstradiolCypionateSuspension =>
      '[Estradiol cypionate suspension]';

  @override
  String get medicationTestosteroneEnanthate => '[Testosterone enanthate]';

  @override
  String get medicationTestosteroneValerate => '[Testosterone valerate]';

  @override
  String get medicationTestosteroneCypionate => '[Testosterone cypionate]';

  @override
  String get medicationTestosteroneUndecylate => '[Testosterone undecylate]';

  @override
  String get medicationTestosteroneBenzoate => '[Testosterone benzoate]';

  @override
  String get medicationTestosteroneCypionateSuspension =>
      '[Testosterone cypionate suspension]';

  @override
  String get injection => '주사';

  @override
  String get oral => '먹는 약(경구)';

  @override
  String get sublingual => '혀 밑에 녹이는 약(설하)';

  @override
  String get patch => '붙이는 패치';

  @override
  String get gel => '바르는 겔';

  @override
  String get implant => '체내 이식(임플란트)';

  @override
  String get suppository => '좌약';

  @override
  String get transdermal => '피부 흡수형(스프레이)';

  @override
  String administrationRouteUnitMl(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ml',
      one: 'ml',
    );
    return '[$_temp0]';
  }

  @override
  String administrationRouteUnitPill(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pills',
      one: 'pill',
    );
    return '[$_temp0]';
  }

  @override
  String administrationRouteUnitPatch(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'patches',
      one: 'patch',
    );
    return '[$_temp0]';
  }

  @override
  String administrationRouteUnitPump(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'pumps',
      one: 'pump',
    );
    return '[$_temp0]';
  }

  @override
  String administrationRouteUnitImplant(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'implants',
      one: 'implant',
    );
    return '[$_temp0]';
  }

  @override
  String administrationRouteUnitSuppository(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'suppositories',
      one: 'suppository',
    );
    return '[$_temp0]';
  }

  @override
  String administrationRouteUnitSpray(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sprays',
      one: 'spray',
    );
    return '[$_temp0]';
  }

  @override
  String get injectionSideLeft => '[Left]';

  @override
  String get injectionSideRight => '[Right]';

  @override
  String get intakeSummaryInjectionSideLeft => '[Left side]';

  @override
  String get intakeSummaryInjectionSideRight => '[Right side]';

  @override
  String get requiredField => '[Required field]';

  @override
  String get mustBePositiveNumber => '[Must be a positive number]';

  @override
  String get invalidTotalAmount => '[Invalid total amount]';

  @override
  String get cannotExceedTotalCapacity => '[Cannot exceed total capacity]';
}
