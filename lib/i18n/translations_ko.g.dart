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
class TranslationsKo extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsKo(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.ko,
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

  /// Metadata for the translations of <ko>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsKo _root = this; // ignore: unused_field

  @override
  TranslationsKo $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsKo(meta: meta ?? this.$meta);

  // Translations
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
  String get empty_home => '설정에서 일정을 추가하여 시작하세요';
  @override
  String get allDone => '모두 완료!';
  @override
  String get noIntakesDue => '오늘 투여할 약이 없습니다';
  @override
  String get upcoming => '예정';
  @override
  String get taken => '투여함';
  @override
  String get lastTaken => '마지막 투여';
  @override
  String get neverTakenYet => '아직 투여한 적 없음';
  @override
  String get settingsTitle => '설정';
  @override
  String get notifications => '알림';
  @override
  String get schedules => '일정';
  @override
  String get noSchedules => '일정 없음';
  @override
  String get language => '언어';
  @override
  String get selectLanguage => '언어 선택';
  @override
  String get enableNotifications => '알림 활성화';
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
  String appVersion({required Object version}) => 'Mona 버전 ${version}';
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
  String get editSchedule => '일정 편집';
  @override
  String deleteSchedule({required Object name}) => '${name}을(를) 삭제하시겠습니까?';
  @override
  String get addNotification => '알림 추가';
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
  String takeMedication({required Object scheduleName}) => '${scheduleName} 투여';
  @override
  String get takeIntake => '투여 기록';
  @override
  String get needleDeadSpace => '주사바늘 잔여 공간(사강)';
  @override
  String get microliters => 'μL';
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
  String deleteItem({required Object name}) => '${name}을(를) 삭제하시겠습니까?';
  @override
  String get add => '추가';
  @override
  String get save => '저장';
  @override
  String get next => '다음';
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
  String get transdermalSpray => '피부 흡수형(스프레이)';
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        other: '${count}개 생성됨',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
        count,
        other: '${count} ${unit} 남음',
      );
}

/// The flat map containing all translations for locale <ko>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsKo {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => '투여 기록',
      'nav_levels' => '농도',
      'nav_supplies' => '보유량',
      'empty_home' => '설정에서 일정을 추가하여 시작하세요',
      'allDone' => '모두 완료!',
      'noIntakesDue' => '오늘 투여할 약이 없습니다',
      'upcoming' => '예정',
      'taken' => '투여함',
      'lastTaken' => '마지막 투여',
      'neverTakenYet' => '아직 투여한 적 없음',
      'settingsTitle' => '설정',
      'notifications' => '알림',
      'schedules' => '일정',
      'noSchedules' => '일정 없음',
      'language' => '언어',
      'selectLanguage' => '언어 선택',
      'enableNotifications' => '알림 활성화',
      'notificationsDisabledTitle' => '알림이 비활성화되어 있습니다',
      'clickToOpenSettings' => '설정을 열려면 탭하세요',
      'exactRemindersDisabled' => '정시 알림이 비활성화되어 있습니다',
      'remindersDelayed' => '알림이 약간 지연될 수 있습니다. 설정을 열려면 탭하세요.',
      'autoUpdate' => '자동 업데이트',
      'autoUpdateDescription' => '앱 실행 시 자동으로 새 업데이트를 확인합니다',
      'checkForUpdates' => '업데이트 확인',
      'checkForUpdatesDescription' =>
        '최신 버전을 수동으로 확인합니다\n인터넷에 연결됩니다\n(데이터는 전송되지 않습니다)',
      'appVersion' => ({required Object version}) => 'Mona 버전 ${version}',
      'addSchedule' => '일정 추가',
      'addScheduleToGetStarted' => '시작하려면 일정을 추가하세요.',
      'newSchedule' => '새 일정',
      'every' => '매',
      'days' => '일',
      'startDate' => '시작일',
      'editScheduleInfo' => '일정 정보 편집',
      'editSchedule' => '일정 편집',
      'deleteSchedule' => ({required Object name}) => '${name}을(를) 삭제하시겠습니까?',
      'addNotification' => '알림 추가',
      'empty_intakes' => '투여 기록이 여기에 표시됩니다',
      'chooseSchedule' => '일정 선택',
      'addSchedulesFirst' => '먼저 일정을 추가하세요.',
      'editIntake' => '투여 기록 편집',
      'date' => '날짜',
      'amount' => '용량',
      'none' => '없음',
      'supplyItem' => '보유 항목',
      'injectionSide' => '주사 부위',
      'deleteIntake' => '이 투여 기록을 삭제하시겠습니까?',
      'takeMedication' => ({required Object scheduleName}) =>
          '${scheduleName} 투여',
      'takeIntake' => '투여 기록',
      'needleDeadSpace' => '주사바늘 잔여 공간(사강)',
      'microliters' => 'μL',
      'empty_supplies' => '보유 중인 약품이 없습니다. 항목을 추가하여 시작하세요.',
      'newItem' => '새 항목',
      'adminRoute' => '투여 경로',
      'totalAmount' => '총 용량',
      'concentration' => '농도',
      'editItem' => '항목 편집',
      'usedAmount' => '사용량',
      'deleteItem' => ({required Object name}) => '${name}을(를) 삭제하시겠습니까?',
      'add' => '추가',
      'save' => '저장',
      'next' => '다음',
      'name' => '이름',
      'molecule' => '성분',
      'ester' => '약효 특성(Ester)',
      'estradiol' => '에스트라디올',
      'progesterone' => '프로게스테론',
      'testosterone' => '테스토스테론',
      'nandrolone' => '난드롤론',
      'spironolactone' => '스피로노락톤',
      'cyproteroneAcetate' => '시프로테론 아세테이트',
      'leuprorelinAcetate' => '류프로렐린 아세테이트',
      'bicalutamide' => '비칼루타미드',
      'decapeptyl' => '데카펩틸',
      'raloxifene' => '라록시펜',
      'tamoxifen' => '타목시펜',
      'finasteride' => '피나스테리드',
      'dutasteride' => '두타스테리드',
      'minoxidil' => '미녹시딜',
      'enanthate' => '에난테이트',
      'valerate' => '발레레이트',
      'cypionate' => '시피오네이트',
      'undecylate' => '운데실레이트',
      'benzoate' => '벤조에이트',
      'cypionateSuspension' => '시피오네이트 현탁액',
      'injection' => '주사',
      'oral' => '먹는 약(경구)',
      'sublingual' => '혀 밑에 녹이는 약(설하)',
      'patch' => '붙이는 패치',
      'gel' => '바르는 겔',
      'implant' => '체내 이식(임플란트)',
      'suppository' => '좌약',
      'transdermalSpray' => '피부 흡수형(스프레이)',
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
            count,
            other: '${count}개 생성됨',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ko'))(
            count,
            other: '${count} ${unit} 남음',
          ),
      _ => null,
    };
  }
}
