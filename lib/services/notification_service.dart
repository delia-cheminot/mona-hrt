import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static FlutterLocalNotificationsPlugin Function()? createPlugin =
      () => FlutterLocalNotificationsPlugin();

  static bool Function()? isPlatformSupported =
      () => Platform.isAndroid || Platform.isIOS;

  late final FlutterLocalNotificationsPlugin _notificationsPlugin;

  NotificationService({FlutterLocalNotificationsPlugin? plugin}) {
    _notificationsPlugin =
        plugin ?? (createPlugin?.call() ?? FlutterLocalNotificationsPlugin());
  }

  bool _initialized = false;

  bool get isInitialized => _initialized;

  AndroidFlutterLocalNotificationsPlugin? get _androidImplementation =>
      _notificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  IOSFlutterLocalNotificationsPlugin? get _iosImplementation =>
      _notificationsPlugin.resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();

  Future<void> initialize() async {
    if (_initialized) return;

    tzdata.initializeTimeZones();
    final TimezoneInfo currentTimeZone =
        await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone.identifier));

    const androidSettings =
        AndroidInitializationSettings('ic_launcher_monochrome');

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _notificationsPlugin.initialize(
        settings: InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    ));

    _initialized = true;
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
          'medication_intakes', 'Medication Intakes',
          channelDescription: 'Notifications for medication intakes',
          importance: Importance.max,
          priority: Priority.max),
      iOS: DarwinNotificationDetails(
        interruptionLevel: InterruptionLevel.timeSensitive,
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      await _androidImplementation?.requestNotificationsPermission();
      await _androidImplementation?.requestExactAlarmsPermission();
    } else if (Platform.isIOS) {
      await _iosImplementation?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<bool> hasPermission() async {
    if (Platform.isAndroid) {
      final granted = await _androidImplementation?.areNotificationsEnabled();
      return granted ?? false;
    }

    if (Platform.isIOS) {
      final granted = await _iosImplementation?.checkPermissions();
      return granted?.isEnabled ?? false;
    }

    return true;
  }

  Future<bool> canScheduleExactAlarms() async {
    if (!Platform.isAndroid) return true;
    final canSchedule =
        await _androidImplementation?.canScheduleExactNotifications();
    return canSchedule ?? false;
  }

  Future<AndroidScheduleMode> scheduleMode() async {
    final useExact = await canScheduleExactAlarms();
    return useExact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;
  }

  Future<void> showNotification({
    int? id,
    String? title,
    String? body,
  }) async {
    id ??= Random().nextInt(1 << 31);

    final supported =
        isPlatformSupported?.call() ?? (Platform.isAndroid || Platform.isIOS);
    if (!supported) {
      debugPrint('Notification id $id: $title - $body');
      return;
    }

    await _notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: _notificationDetails(),
    );
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) =>
      _schedule(
        id: id,
        title: title,
        body: body,
        scheduledTime: scheduledTime,
      );

  Future<void> scheduleDailyNotification({
    required int id,
    required String title,
    required String body,
    required DateTime firstOccurrence,
  }) =>
      _schedule(
        id: id,
        title: title,
        body: body,
        scheduledTime: firstOccurrence,
        matchComponents: DateTimeComponents.time,
      );

  Future<void> scheduleWeeklyNotification({
    required int id,
    required String title,
    required String body,
    required DateTime firstOccurrence,
  }) =>
      _schedule(
        id: id,
        title: title,
        body: body,
        scheduledTime: firstOccurrence,
        matchComponents: DateTimeComponents.dayOfWeekAndTime,
      );

  Future<void> _schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    DateTimeComponents? matchComponents,
  }) async {
    final payload = jsonEncode({
      'scheduledTime': scheduledTime.toIso8601String(),
      if (matchComponents != null) 'isRepeating': true,
    });
    final dateTime = tz.TZDateTime(
        tz.local,
        scheduledTime.year,
        scheduledTime.month,
        scheduledTime.day,
        scheduledTime.hour,
        scheduledTime.minute);

    await _notificationsPlugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: dateTime,
      notificationDetails: _notificationDetails(),
      androidScheduleMode: await scheduleMode(),
      matchDateTimeComponents: matchComponents,
      payload: payload,
    );
  }

  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }

  Future<void> cancelPendingNotifications() async {
    final pendingNotifications =
        await _notificationsPlugin.pendingNotificationRequests();

    for (final notification in pendingNotifications) {
      await _notificationsPlugin.cancel(id: notification.id);
    }
  }

  Future<List<PendingNotificationRequest>> get _pastPendingNotifications async {
    final pendingNotifications =
        await _notificationsPlugin.pendingNotificationRequests();

    return pendingNotifications.where((notification) {
      final payload = jsonDecode(notification.payload ?? '{}');
      if (payload['isRepeating'] == true) return false;
      final scheduledTime =
          (payload['scheduledTime'] as String?)?.toDateTimeOrNull;
      if (scheduledTime == null) return false;
      return scheduledTime.isBefore(clock.now());
    }).toList();
  }

  Future<void> triggerPastPendingNotifications() async {
    final pastPendingNotifications = await _pastPendingNotifications;
    for (final notification in pastPendingNotifications) {
      await showNotification(
        title: notification.title,
        body: notification.body,
      );
    }
  }
}
