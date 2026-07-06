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
class TranslationsTh extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsTh(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.th,
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

  /// Metadata for the translations of <th>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsTh _root = this; // ignore: unused_field

  @override
  TranslationsTh $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsTh(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'การทาน';
  @override
  String get nav_levels => 'ระดับ';
  @override
  String get nav_supplies => 'สต็อก';
  @override
  String get takeAnIntake => 'ทานยา';
  @override
  String get addAnItem => 'เพื่มสต็อก';
  @override
  String get empty_home => 'เริ่มด้วยการเพื่มตารางเวลาในการตั้งค่า';
  @override
  String get allDone => 'ครบหมดแล้ว!';
  @override
  String get noIntakesDue => 'ไม่มียาที่ต้องทานวันนี้';
  @override
  String get upcoming => 'เร็วๆนี้';
  @override
  String get taken => 'ทานแล้ว';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} วันที่แล้ว',
      );
  @override
  String get yesterday => 'เมื่อวาน';
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: 'ใน ${count} วัน',
      );
  @override
  String get tomorrow => 'พรุ่งนี้';
  @override
  String get lastTaken => 'ทานไป';
  @override
  String get neverTakenYet => 'ยังไม่เคยทาน';
  @override
  String get scheduleFrequencyDaily => 'ทุกวัน';
  @override
  String scheduleFrequencyEveryNDays({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        days,
        other: '${days} วันครั้ง',
      );
  @override
  String get scheduleFrequencyInterval => 'เป็นระยะ';
  @override
  String get scheduleFrequencyWeekly => 'ทุกสัปดาห์';
  @override
  String get newUpdateAvailable => 'มีอัพเดตใหม่!';
  @override
  String get goToSettings => 'ไปที่การตั้งค่า';
  @override
  String get settingsTitle => 'การตั้งค่า';
  @override
  String get notifications => 'การแจ้งเตือน';
  @override
  String get schedulesAndNotifications => 'กำหนดเวลาและการแจ้งเตือน';
  @override
  String get general => 'ทั่วไป';
  @override
  String get schedules => 'ตารางเวลา';
  @override
  String get noSchedules => 'ไม่มีตารางเวลา';
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: 'สร้างแล้ว ${count}',
      );
  @override
  String get language => 'ภาษา';
  @override
  String get languageFollowDevice => 'ตามภาษาระบบ';
  @override
  String get selectLanguage => 'เลือกภาษา';
  @override
  String get enableNotifications => 'เปิดการแจ้งเตือน';
  @override
  String get enableNotificationsDescription => 'ส่งการแจ้งเตือน';
  @override
  String get notificationsDisabledTitle => 'การแจ้งเตือนได้ปิดอยู่';
  @override
  String get clickToOpenSettings => 'แตะเพื่อเปิดการตั้งค่า';
  @override
  String get exactRemindersDisabled => 'การแจ้งเตือนแบบตรงเวลาได้ปิดอยู่';
  @override
  String get remindersDelayed =>
      'การแจ้งเตือนอาจล่าช้าได้ แตะเพื่อเปิดการตั้งค่า';
  @override
  String get autoUpdate => 'อัพเดตอัตโนมัติ';
  @override
  String get autoUpdateDescription => 'ตรวจหาอัพเดตอัตโนมัติตอนที่เปิดแอพ';
  @override
  String get checkForUpdates => 'ตรวจหาอัพเดตใหม่';
  @override
  String get checkForUpdatesDescription =>
      'ฉันจะตรวจหาอัพเดตใหม่ล่าสุดเอง\nจะทำให้เปิดเครือข่าย\n(จะไม่มีข้อมูลใดๆส่งออกนอกเครื่อง)';
  @override
  String appVersion({required Object version}) => 'Mona เวอร์ชั่น ${version}';
  @override
  String backupSavedTo({required Object path}) => 'แบ็คอัพบันทึกไปที่ ${path}';
  @override
  String exportFailed({required Object error}) => 'นำออกล้มเหลว: ${error}';
  @override
  String get importDataTitle => 'นำเข้าข้อมูล';
  @override
  String get importDataSubtitle => 'กู้คืนข้อมูลจากแบ็คอัพ JSON';
  @override
  String get importDataOverwriteWarning =>
      'จะแทนที่ข้อมูลทั้งหมดด้วยข้อมูลจากแบ็คอัพ โดยที่ย้อนกลับไม่ได้ ทำต่อ?';
  @override
  String get importConfirm => 'นำเข้า';
  @override
  String get importSuccessfulTitle => 'นำเข้าสำเร็จ';
  @override
  String get importRestartRequired =>
      'โปรดปิดแล้วเปิดแอพใหม่เพื่อให้ข้อมูลที่กู้คืนมาแสดงผล';
  @override
  String get closeApp => 'ปิดแอพ';
  @override
  String importFailed({required Object error}) => 'นำเข้าล้มเหลว: ${error}';
  @override
  String get updates => 'อัพเดต';
  @override
  String get dataManagement => 'การจัดการข้อมูล';
  @override
  String get exportDataTitle => 'ส่งออกข้อมูล';
  @override
  String get exportDataSubtitle => 'บันทึกข้อมูลไปยังไฟล์ JSON';
  @override
  String get units => 'หน่วย';
  @override
  String get updateNoCompatibleApk => 'ไม่มีอัพเดตที่รับรองระบบของคุณ';
  @override
  String get updateAppUpToDate => 'แอพเป็นเวอร์ชั่นล่าสุดแล้ว';
  @override
  String get updateCheckNetworkError => 'ไม่สามารถตรวจสอบอัพเดทในขณะนี้ได้';
  @override
  String get updateDialogTitle => 'มีอัพเดตใหม่';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'มีเวอร์ชั่นใหม่ ${latest} (ติดตั้งอยู่: ${current})\n\nมีอัพเดตใหม่ที่พร้อมที่จะติดตั้งแล้ว';
  @override
  String get updateDownloadAndInstall => 'ดาวน์โหลดและติดตั้ง';
  @override
  String get updateInstallPermissionRequired =>
      'ต้องอนุญาตการติดตั้งอัพเดตก่อน';
  @override
  String get updateDownloadingTitle => 'กำลังดาวน์โหลดอัพเดต…';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'เปิดตัวติดตั้งล้มเหลว: ${message}';
  @override
  String get updateDownloadFailed =>
      'ดาวน์โหลดล้มเหลว โปรดตรวจสอบเครือข่ายของคุณ';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'เวลาทาน ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'กำหนดไว้วันที่ ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'กำหนดไว้เวลา ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'กำหนดไว้วัน${weekday}';
  @override
  String get addSchedule => 'เพื่มตารางเวลา';
  @override
  String get addScheduleToGetStarted => 'เพื่มตารางเวลาเพื่อเรื่ม';
  @override
  String get newSchedule => 'ตารางเวลาใหม่';
  @override
  String get every => 'ทุกๆ';
  @override
  String get days => 'วัน';
  @override
  String get startDate => 'วันที่เรื่ม';
  @override
  String get pickATime => 'เลือกเวลา';
  @override
  String get addIntakeTime => 'เพื่มเวลา';
  @override
  String get editScheduleInfo => 'แก้ไขข้อมูลตารางเวลา';
  @override
  String get scheduling => 'การจัดเวลา';
  @override
  String get noNotifications => 'ไม่มีการแจ้งเตือน';
  @override
  String notificationsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} การแจ้งเตือน',
      );
  @override
  String get editSchedule => 'แก้ไขตารางเวลา';
  @override
  String deleteSchedule({required Object name}) => 'ลบ ${name}?';
  @override
  String get scheduleNotifications => 'การแจ้งเตือนตารางเวลา';
  @override
  String get addNotification => 'เพื่มการแจ้งเตือน';
  @override
  String noNotificationsForSchedule({required Object scheduleName}) =>
      'ไม่มีการแจ้งเตือนสำหรับ ${scheduleName} สามารถเพื่มได้ด้วยปุ่ม “เพื่ม”';
  @override
  String get notificationsUpdated => 'การแจ้งเตือนอัพเดตแล้ว';
  @override
  String get notificationsUpdatedDescription =>
      'ทุกตารางเวลามีการแจ้งเตือนของตนเองแล้ว\n\nโปรดตั้งการแจ้งเตือนของตารางเวลาของคุณเพื่อที่จะไม่ลืม';
  @override
  String get dontShowAgain => 'อย่าแสตงอีก';
  @override
  String get scheduleSettings => 'ตั้งค่าตารางเวลา';
  @override
  String get empty_intakes => 'ยาที่ทานแล้วจะมาอยู่ที่นี่';
  @override
  String get chooseSchedule => 'เลือกตารางเวลา';
  @override
  String get addSchedulesFirst => 'เพื่มตารางเวลาก่อน';
  @override
  String get editIntake => 'แก้ไขการทาน';
  @override
  String get date => 'วันที่';
  @override
  String get amount => 'ปริมาณ';
  @override
  String get takenAmount => 'ปริมาณ';
  @override
  String get wastedAmount => 'เสียไป';
  @override
  String get none => 'ไม่มี';
  @override
  String get supplyItem => 'ของในสต็อก';
  @override
  String get injectionSide => 'ข้างที่ฉีด';
  @override
  String get deleteIntake => 'ลบโดสยานี้?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'ทาน ${scheduleName}';
  @override
  String get takeIntake => 'ทานโดสยา';
  @override
  String get intakeRecorded => 'บันทึกการทานยาแล้ว';
  @override
  String get needleDeadSpace => 'ปริมาณเว้นเปล่าในเข็ม';
  @override
  String get notes => 'บันทึก';
  @override
  String get microliters => 'ไมโครลิตร';
  @override
  String get milliliters => 'มิลลิลิตร';
  @override
  String get empty_levels => 'การฉีดเอสตราไดออลจะขึ้นในแท็บนี้';
  @override
  String get bloodTestsTitle => 'การตรวจเลือด';
  @override
  String get empty_blood_tests =>
      'ผลตรวจเลือดจะมาขึ้นที่นี่ เรื่มด้วยการกดปุ่ม “เพื่ม”';
  @override
  String get addBloodTest => 'เพิ่มผลตรวจเลือด';
  @override
  String get editBloodTest => 'แก้ไขผลตรวจเลือด';
  @override
  String get newBloodTest => 'ผลตรวจเลือดใหม่';
  @override
  String get deleteBloodTest => 'ลบผลตรวจเลือดนี้ใหม';
  @override
  String get estradiolLevelLabel => 'ระดับเอสตราไดออล';
  @override
  String get testosteroneLevelLabel => 'ระดับเทสโทสเตอโรน';
  @override
  String get bloodTestDateLabel => 'วันที่ตรวจ';
  @override
  String chartNowConcentration({required Object value}) => 'ตอนนี้ ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      'ณ ${date}: ${level}';
  @override
  String get empty_supplies => 'ไม่มีสต็อกอยู่ โปรดเพื่มสต็อก';
  @override
  String get newItem => 'สต็อกใหม่';
  @override
  String get adminRoute => 'วิธีนำเข้าร่างกาย';
  @override
  String get totalAmount => 'ปริมาณทั้งหมด';
  @override
  String get concentration => 'ความเข้มข้น';
  @override
  String get editItem => 'แก้ไขสต็อก';
  @override
  String get usedAmount => 'ปริมาณที่ใช้ไป';
  @override
  String deleteItem({required Object name}) => 'ลบ ${name}?';
  @override
  String remaining({required num amount, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        amount,
        other: 'เหลือ ${amount} ${unit}',
      );
  @override
  String get allItemsFilter => 'ทั้งหมด';
  @override
  String get medicationItemsFilter => 'ยา';
  @override
  String get genericItemsFilter => 'ของใช้';
  @override
  String get medicationItemType => 'ยา';
  @override
  String get genericItemType => 'ของใช้';
  @override
  String get supplyType => 'ชนิด';
  @override
  String get syringe => 'กระบอกฉีดยา';
  @override
  String get wipe => 'ผ้าเช็ด';
  @override
  String get needle => 'เข็มฉีดยา';
  @override
  String get gloves => 'ถุงมือ';
  @override
  String get bandage => 'พลาสเตอร์';
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} กระบอก',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} ผืน',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} เข็ม',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} ถุง',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        other: '${count} ชิ้น',
      );
  @override
  String get add => 'เพื่ม';
  @override
  String get save => 'บันทึก';
  @override
  String get cancel => 'ยกเลิก';
  @override
  String get next => 'ถัดไป';
  @override
  String get delete => 'ลบ';
  @override
  String get deleteElement => 'ลบสต็อกนี้ใหม?';
  @override
  String get irreversibleAction => 'จะไม่สามารถย้อนกลับได้';
  @override
  String get name => 'ชื่อ';
  @override
  String get molecule => 'ชนิดยา';
  @override
  String get ester => 'เอสเทอร์';
  @override
  String get estradiol => 'เอสตราไดออล';
  @override
  String get progesterone => 'โปรเจสเตอโรน';
  @override
  String get testosterone => 'เทสโทสเตอโรน';
  @override
  String get nandrolone => 'นันโดรโลน';
  @override
  String get dihydrotestosterone => 'ไดไฮโดรเทสโทสเตอโรน';
  @override
  String get spironolactone => 'สไปโรโนแลคโทน';
  @override
  String get cyproteroneAcetate => 'ไซโปรเทอโรน อะซิเตท';
  @override
  String get leuprorelinAcetate => 'ลิวโปรเรลิน อะซิเตท';
  @override
  String get bicalutamide => 'บิคาลูทาไมด์';
  @override
  String get decapeptyl => 'เดแคปติล';
  @override
  String get raloxifene => 'ราลอกซิเฟน';
  @override
  String get tamoxifen => 'ทาม็อกซิเฟน';
  @override
  String get finasteride => 'ฟินาสเตอไรด์';
  @override
  String get dutasteride => 'ดูทาสเตอไรด์';
  @override
  String get minoxidil => 'มิน็อกซิดิล';
  @override
  String get pioglitazone => 'ปิโอไกลตาโซน';
  @override
  String get enanthate => 'เอนันเทต';
  @override
  String get valerate => 'วาเลอเรต';
  @override
  String get cypionate => 'ไซพิโอเนต';
  @override
  String get undecylate => 'อันเดซิเลต';
  @override
  String get benzoate => 'เบนโซเอต';
  @override
  String get cypionateSuspension => 'สารแขวนลอยไซพิโอเนต';
  @override
  String get medicationEstradiolEnanthate => 'เอสตราไดออล เอนันเทต';
  @override
  String get medicationEstradiolValerate => 'เอสตราไดออล วาเลอเรต';
  @override
  String get medicationEstradiolCypionate => 'เอสตราไดออล ไซพิโอเนต';
  @override
  String get medicationEstradiolUndecylate => 'เอสตราไดออล อันเดซิเลต';
  @override
  String get medicationEstradiolBenzoate => 'เอสตราไดออล เบนโซเอต';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'สารแขวนลอยในเอสตราไดออล ไซพิโอเนต';
  @override
  String get medicationTestosteroneEnanthate => 'เทสโทสเตอโรน เอนันเทต';
  @override
  String get medicationTestosteroneValerate => 'เทสโทสเตอโรน วาเลอเรต';
  @override
  String get medicationTestosteroneCypionate => 'เทสโทสเตอโรน ไซพิโอเนต';
  @override
  String get medicationTestosteroneUndecylate => 'เทสโทสเตอโรน อันเดซิเลต';
  @override
  String get medicationTestosteroneBenzoate => 'เทสโทสเตอโรน เบนโซเอต';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'สารแขวนลอยในเทสโทสเตอโรน ไซพิโอเนต';
  @override
  String get injection => 'ยาฉีด';
  @override
  String get oral => 'ยาทาน';
  @override
  String get sublingual => 'ยาแช่ใต้ลิ้น';
  @override
  String get patch => 'แผ่นแปะ';
  @override
  String get gel => 'ยาเจล';
  @override
  String get implant => 'ยาเม็ดแบบฝัง';
  @override
  String get suppository => 'ยาเหน็บทวาร';
  @override
  String get transdermalSpray => 'สเปรย์ซึมผิวหนัง';
  @override
  String get transdermalDrops => 'ยาหยอดซึมผิวหนัง';
  @override
  String get unitMilligram => 'มิลลิกรัม';
  @override
  String get unitPgPerMl => 'พิโกกรัม/มิลลิลิตร';
  @override
  String get unitPmolPerL => 'พิโกโมล/มิลลิลิตร';
  @override
  String get unitNgPerDl => 'นาโนกรัม/เดซิลิตร';
  @override
  String get unitNmolPerL => 'นาโนโมล/ลิตร';
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'มิลลิลิตร',
        other: 'มิลลิลิตร',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'เม็ด',
        other: 'เม็ด',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'แผ่น',
        other: 'แผ่น',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'ปั้ม',
        other: 'ปั้ม',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'ฝัง ที่',
        other: 'ฝัง ที่',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'ยาเหน็บ เม็ด',
        other: 'ยาเหน็บ เม็ด',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
        count,
        one: 'สเปรย์',
        other: 'สเปรย์',
      );
  @override
  String get injectionSideLeft => 'ซ้าย';
  @override
  String get injectionSideRight => 'ขวา';
  @override
  String get intakeSummaryInjectionSideLeft => 'ด้านซ้าย';
  @override
  String get intakeSummaryInjectionSideRight => 'ด้านขวา';
  @override
  String get requiredField => 'ต้องใส่';
  @override
  String get mustBePositiveNumber => 'ต้องเป็นตัวเลขมากกว่า 0';
  @override
  String get invalidTotalAmount => 'จำนวนรวมผิดรูปแบบ';
  @override
  String get cannotExceedTotalCapacity => 'จำนวนเกินรวมไม่ได้';
}

/// The flat map containing all translations for locale <th>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTh {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'การทาน',
      'nav_levels' => 'ระดับ',
      'nav_supplies' => 'สต็อก',
      'takeAnIntake' => 'ทานยา',
      'addAnItem' => 'เพื่มสต็อก',
      'empty_home' => 'เริ่มด้วยการเพื่มตารางเวลาในการตั้งค่า',
      'allDone' => 'ครบหมดแล้ว!',
      'noIntakesDue' => 'ไม่มียาที่ต้องทานวันนี้',
      'upcoming' => 'เร็วๆนี้',
      'taken' => 'ทานแล้ว',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} วันที่แล้ว',
          ),
      'yesterday' => 'เมื่อวาน',
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: 'ใน ${count} วัน',
          ),
      'tomorrow' => 'พรุ่งนี้',
      'lastTaken' => 'ทานไป',
      'neverTakenYet' => 'ยังไม่เคยทาน',
      'scheduleFrequencyDaily' => 'ทุกวัน',
      'scheduleFrequencyEveryNDays' => ({required num days}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            days,
            other: '${days} วันครั้ง',
          ),
      'scheduleFrequencyInterval' => 'เป็นระยะ',
      'scheduleFrequencyWeekly' => 'ทุกสัปดาห์',
      'newUpdateAvailable' => 'มีอัพเดตใหม่!',
      'goToSettings' => 'ไปที่การตั้งค่า',
      'settingsTitle' => 'การตั้งค่า',
      'notifications' => 'การแจ้งเตือน',
      'schedulesAndNotifications' => 'กำหนดเวลาและการแจ้งเตือน',
      'general' => 'ทั่วไป',
      'schedules' => 'ตารางเวลา',
      'noSchedules' => 'ไม่มีตารางเวลา',
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: 'สร้างแล้ว ${count}',
          ),
      'language' => 'ภาษา',
      'languageFollowDevice' => 'ตามภาษาระบบ',
      'selectLanguage' => 'เลือกภาษา',
      'enableNotifications' => 'เปิดการแจ้งเตือน',
      'enableNotificationsDescription' => 'ส่งการแจ้งเตือน',
      'notificationsDisabledTitle' => 'การแจ้งเตือนได้ปิดอยู่',
      'clickToOpenSettings' => 'แตะเพื่อเปิดการตั้งค่า',
      'exactRemindersDisabled' => 'การแจ้งเตือนแบบตรงเวลาได้ปิดอยู่',
      'remindersDelayed' => 'การแจ้งเตือนอาจล่าช้าได้ แตะเพื่อเปิดการตั้งค่า',
      'autoUpdate' => 'อัพเดตอัตโนมัติ',
      'autoUpdateDescription' => 'ตรวจหาอัพเดตอัตโนมัติตอนที่เปิดแอพ',
      'checkForUpdates' => 'ตรวจหาอัพเดตใหม่',
      'checkForUpdatesDescription' =>
        'ฉันจะตรวจหาอัพเดตใหม่ล่าสุดเอง\nจะทำให้เปิดเครือข่าย\n(จะไม่มีข้อมูลใดๆส่งออกนอกเครื่อง)',
      'appVersion' => ({required Object version}) =>
          'Mona เวอร์ชั่น ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'แบ็คอัพบันทึกไปที่ ${path}',
      'exportFailed' => ({required Object error}) => 'นำออกล้มเหลว: ${error}',
      'importDataTitle' => 'นำเข้าข้อมูล',
      'importDataSubtitle' => 'กู้คืนข้อมูลจากแบ็คอัพ JSON',
      'importDataOverwriteWarning' =>
        'จะแทนที่ข้อมูลทั้งหมดด้วยข้อมูลจากแบ็คอัพ โดยที่ย้อนกลับไม่ได้ ทำต่อ?',
      'importConfirm' => 'นำเข้า',
      'importSuccessfulTitle' => 'นำเข้าสำเร็จ',
      'importRestartRequired' =>
        'โปรดปิดแล้วเปิดแอพใหม่เพื่อให้ข้อมูลที่กู้คืนมาแสดงผล',
      'closeApp' => 'ปิดแอพ',
      'importFailed' => ({required Object error}) => 'นำเข้าล้มเหลว: ${error}',
      'updates' => 'อัพเดต',
      'dataManagement' => 'การจัดการข้อมูล',
      'exportDataTitle' => 'ส่งออกข้อมูล',
      'exportDataSubtitle' => 'บันทึกข้อมูลไปยังไฟล์ JSON',
      'units' => 'หน่วย',
      'updateNoCompatibleApk' => 'ไม่มีอัพเดตที่รับรองระบบของคุณ',
      'updateAppUpToDate' => 'แอพเป็นเวอร์ชั่นล่าสุดแล้ว',
      'updateCheckNetworkError' => 'ไม่สามารถตรวจสอบอัพเดทในขณะนี้ได้',
      'updateDialogTitle' => 'มีอัพเดตใหม่',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'มีเวอร์ชั่นใหม่ ${latest} (ติดตั้งอยู่: ${current})\n\nมีอัพเดตใหม่ที่พร้อมที่จะติดตั้งแล้ว',
      'updateDownloadAndInstall' => 'ดาวน์โหลดและติดตั้ง',
      'updateInstallPermissionRequired' => 'ต้องอนุญาตการติดตั้งอัพเดตก่อน',
      'updateDownloadingTitle' => 'กำลังดาวน์โหลดอัพเดต…',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'เปิดตัวติดตั้งล้มเหลว: ${message}',
      'updateDownloadFailed' => 'ดาวน์โหลดล้มเหลว โปรดตรวจสอบเครือข่ายของคุณ',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'เวลาทาน ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'กำหนดไว้วันที่ ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'กำหนดไว้เวลา ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'กำหนดไว้วัน${weekday}',
      'addSchedule' => 'เพื่มตารางเวลา',
      'addScheduleToGetStarted' => 'เพื่มตารางเวลาเพื่อเรื่ม',
      'newSchedule' => 'ตารางเวลาใหม่',
      'every' => 'ทุกๆ',
      'days' => 'วัน',
      'startDate' => 'วันที่เรื่ม',
      'pickATime' => 'เลือกเวลา',
      'addIntakeTime' => 'เพื่มเวลา',
      'editScheduleInfo' => 'แก้ไขข้อมูลตารางเวลา',
      'scheduling' => 'การจัดเวลา',
      'noNotifications' => 'ไม่มีการแจ้งเตือน',
      'notificationsCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} การแจ้งเตือน',
          ),
      'editSchedule' => 'แก้ไขตารางเวลา',
      'deleteSchedule' => ({required Object name}) => 'ลบ ${name}?',
      'scheduleNotifications' => 'การแจ้งเตือนตารางเวลา',
      'addNotification' => 'เพื่มการแจ้งเตือน',
      'noNotificationsForSchedule' => ({required Object scheduleName}) =>
          'ไม่มีการแจ้งเตือนสำหรับ ${scheduleName} สามารถเพื่มได้ด้วยปุ่ม “เพื่ม”',
      'notificationsUpdated' => 'การแจ้งเตือนอัพเดตแล้ว',
      'notificationsUpdatedDescription' =>
        'ทุกตารางเวลามีการแจ้งเตือนของตนเองแล้ว\n\nโปรดตั้งการแจ้งเตือนของตารางเวลาของคุณเพื่อที่จะไม่ลืม',
      'dontShowAgain' => 'อย่าแสตงอีก',
      'scheduleSettings' => 'ตั้งค่าตารางเวลา',
      'empty_intakes' => 'ยาที่ทานแล้วจะมาอยู่ที่นี่',
      'chooseSchedule' => 'เลือกตารางเวลา',
      'addSchedulesFirst' => 'เพื่มตารางเวลาก่อน',
      'editIntake' => 'แก้ไขการทาน',
      'date' => 'วันที่',
      'amount' => 'ปริมาณ',
      'takenAmount' => 'ปริมาณ',
      'wastedAmount' => 'เสียไป',
      'none' => 'ไม่มี',
      'supplyItem' => 'ของในสต็อก',
      'injectionSide' => 'ข้างที่ฉีด',
      'deleteIntake' => 'ลบโดสยานี้?',
      'takeMedication' => ({required Object scheduleName}) =>
          'ทาน ${scheduleName}',
      'takeIntake' => 'ทานโดสยา',
      'intakeRecorded' => 'บันทึกการทานยาแล้ว',
      'needleDeadSpace' => 'ปริมาณเว้นเปล่าในเข็ม',
      'notes' => 'บันทึก',
      'microliters' => 'ไมโครลิตร',
      'milliliters' => 'มิลลิลิตร',
      'empty_levels' => 'การฉีดเอสตราไดออลจะขึ้นในแท็บนี้',
      'bloodTestsTitle' => 'การตรวจเลือด',
      'empty_blood_tests' =>
        'ผลตรวจเลือดจะมาขึ้นที่นี่ เรื่มด้วยการกดปุ่ม “เพื่ม”',
      'addBloodTest' => 'เพิ่มผลตรวจเลือด',
      'editBloodTest' => 'แก้ไขผลตรวจเลือด',
      'newBloodTest' => 'ผลตรวจเลือดใหม่',
      'deleteBloodTest' => 'ลบผลตรวจเลือดนี้ใหม',
      'estradiolLevelLabel' => 'ระดับเอสตราไดออล',
      'testosteroneLevelLabel' => 'ระดับเทสโทสเตอโรน',
      'bloodTestDateLabel' => 'วันที่ตรวจ',
      'chartNowConcentration' => ({required Object value}) => 'ตอนนี้ ${value}',
      'chartBloodTestLevelTooltip' => (
              {required Object date, required Object level}) =>
          'ณ ${date}: ${level}',
      'empty_supplies' => 'ไม่มีสต็อกอยู่ โปรดเพื่มสต็อก',
      'newItem' => 'สต็อกใหม่',
      'adminRoute' => 'วิธีนำเข้าร่างกาย',
      'totalAmount' => 'ปริมาณทั้งหมด',
      'concentration' => 'ความเข้มข้น',
      'editItem' => 'แก้ไขสต็อก',
      'usedAmount' => 'ปริมาณที่ใช้ไป',
      'deleteItem' => ({required Object name}) => 'ลบ ${name}?',
      'remaining' => ({required num amount, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            amount,
            other: 'เหลือ ${amount} ${unit}',
          ),
      'allItemsFilter' => 'ทั้งหมด',
      'medicationItemsFilter' => 'ยา',
      'genericItemsFilter' => 'ของใช้',
      'medicationItemType' => 'ยา',
      'genericItemType' => 'ของใช้',
      'supplyType' => 'ชนิด',
      'syringe' => 'กระบอกฉีดยา',
      'wipe' => 'ผ้าเช็ด',
      'needle' => 'เข็มฉีดยา',
      'gloves' => 'ถุงมือ',
      'bandage' => 'พลาสเตอร์',
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} กระบอก',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} ผืน',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} เข็ม',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} ถุง',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            other: '${count} ชิ้น',
          ),
      'add' => 'เพื่ม',
      'save' => 'บันทึก',
      'cancel' => 'ยกเลิก',
      'next' => 'ถัดไป',
      'delete' => 'ลบ',
      'deleteElement' => 'ลบสต็อกนี้ใหม?',
      'irreversibleAction' => 'จะไม่สามารถย้อนกลับได้',
      'name' => 'ชื่อ',
      'molecule' => 'ชนิดยา',
      'ester' => 'เอสเทอร์',
      'estradiol' => 'เอสตราไดออล',
      'progesterone' => 'โปรเจสเตอโรน',
      'testosterone' => 'เทสโทสเตอโรน',
      'nandrolone' => 'นันโดรโลน',
      'dihydrotestosterone' => 'ไดไฮโดรเทสโทสเตอโรน',
      'spironolactone' => 'สไปโรโนแลคโทน',
      'cyproteroneAcetate' => 'ไซโปรเทอโรน อะซิเตท',
      'leuprorelinAcetate' => 'ลิวโปรเรลิน อะซิเตท',
      'bicalutamide' => 'บิคาลูทาไมด์',
      'decapeptyl' => 'เดแคปติล',
      'raloxifene' => 'ราลอกซิเฟน',
      'tamoxifen' => 'ทาม็อกซิเฟน',
      'finasteride' => 'ฟินาสเตอไรด์',
      'dutasteride' => 'ดูทาสเตอไรด์',
      'minoxidil' => 'มิน็อกซิดิล',
      'pioglitazone' => 'ปิโอไกลตาโซน',
      'enanthate' => 'เอนันเทต',
      'valerate' => 'วาเลอเรต',
      'cypionate' => 'ไซพิโอเนต',
      'undecylate' => 'อันเดซิเลต',
      'benzoate' => 'เบนโซเอต',
      'cypionateSuspension' => 'สารแขวนลอยไซพิโอเนต',
      'medicationEstradiolEnanthate' => 'เอสตราไดออล เอนันเทต',
      'medicationEstradiolValerate' => 'เอสตราไดออล วาเลอเรต',
      'medicationEstradiolCypionate' => 'เอสตราไดออล ไซพิโอเนต',
      'medicationEstradiolUndecylate' => 'เอสตราไดออล อันเดซิเลต',
      'medicationEstradiolBenzoate' => 'เอสตราไดออล เบนโซเอต',
      'medicationEstradiolCypionateSuspension' =>
        'สารแขวนลอยในเอสตราไดออล ไซพิโอเนต',
      'medicationTestosteroneEnanthate' => 'เทสโทสเตอโรน เอนันเทต',
      'medicationTestosteroneValerate' => 'เทสโทสเตอโรน วาเลอเรต',
      'medicationTestosteroneCypionate' => 'เทสโทสเตอโรน ไซพิโอเนต',
      'medicationTestosteroneUndecylate' => 'เทสโทสเตอโรน อันเดซิเลต',
      'medicationTestosteroneBenzoate' => 'เทสโทสเตอโรน เบนโซเอต',
      'medicationTestosteroneCypionateSuspension' =>
        'สารแขวนลอยในเทสโทสเตอโรน ไซพิโอเนต',
      'injection' => 'ยาฉีด',
      'oral' => 'ยาทาน',
      'sublingual' => 'ยาแช่ใต้ลิ้น',
      'patch' => 'แผ่นแปะ',
      'gel' => 'ยาเจล',
      'implant' => 'ยาเม็ดแบบฝัง',
      'suppository' => 'ยาเหน็บทวาร',
      'transdermalSpray' => 'สเปรย์ซึมผิวหนัง',
      'transdermalDrops' => 'ยาหยอดซึมผิวหนัง',
      'unitMilligram' => 'มิลลิกรัม',
      'unitPgPerMl' => 'พิโกกรัม/มิลลิลิตร',
      'unitPmolPerL' => 'พิโกโมล/มิลลิลิตร',
      'unitNgPerDl' => 'นาโนกรัม/เดซิลิตร',
      'unitNmolPerL' => 'นาโนโมล/ลิตร',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'มิลลิลิตร',
            other: 'มิลลิลิตร',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'เม็ด',
            other: 'เม็ด',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'แผ่น',
            other: 'แผ่น',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'ปั้ม',
            other: 'ปั้ม',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'ฝัง ที่',
            other: 'ฝัง ที่',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'ยาเหน็บ เม็ด',
            other: 'ยาเหน็บ เม็ด',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('th'))(
            count,
            one: 'สเปรย์',
            other: 'สเปรย์',
          ),
      'injectionSideLeft' => 'ซ้าย',
      'injectionSideRight' => 'ขวา',
      'intakeSummaryInjectionSideLeft' => 'ด้านซ้าย',
      'intakeSummaryInjectionSideRight' => 'ด้านขวา',
      'requiredField' => 'ต้องใส่',
      'mustBePositiveNumber' => 'ต้องเป็นตัวเลขมากกว่า 0',
      'invalidTotalAmount' => 'จำนวนรวมผิดรูปแบบ',
      'cannotExceedTotalCapacity' => 'จำนวนเกินรวมไม่ได้',
      _ => null,
    };
  }
}
