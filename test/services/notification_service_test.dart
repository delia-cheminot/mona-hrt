import 'dart:convert';
import 'package:clock/clock.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/services/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../util/test_clock.dart';

class FakeFlutterLocalNotificationsPlugin
    implements FlutterLocalNotificationsPlugin {
  final List<Map<String, dynamic>> scheduled = [];
  final List<Map<String, dynamic>> shown = [];

  @override
  Future<bool?> initialize({
    required InitializationSettings settings,
    void Function(NotificationResponse)? onDidReceiveNotificationResponse,
    void Function(NotificationResponse)?
        onDidReceiveBackgroundNotificationResponse,
  }) async {
    return true;
  }

  @override
  Future<void> show(
      {required int id,
      String? title,
      String? body,
      NotificationDetails? notificationDetails,
      String? payload}) async {
    shown.add({'id': id, 'title': title, 'body': body, 'payload': payload});
  }

  @override
  Future<void> zonedSchedule(
      {required int id,
      String? title,
      String? body,
      required tz.TZDateTime scheduledDate,
      required NotificationDetails notificationDetails,
      required AndroidScheduleMode androidScheduleMode,
      DateTimeComponents? matchDateTimeComponents,
      String? payload}) async {
    scheduled.add({
      'id': id,
      'title': title,
      'body': body,
      'date': scheduledDate,
      'payload': payload,
      'matchDateTimeComponents': matchDateTimeComponents,
    });
  }

  @override
  Future<List<PendingNotificationRequest>> pendingNotificationRequests() async {
    return scheduled
        .map((n) => PendingNotificationRequest(
            n['id'] as int,
            n['title'] as String?,
            n['body'] as String?,
            n['payload'] as String?))
        .toList();
  }

  @override
  Future<void> cancel({required int id, String? tag}) async {
    scheduled.removeWhere((n) => n['id'] == id);
  }

  @override
  Future<void> cancelAll() async {
    scheduled.clear();
  }

  @override
  Future<void> cancelAllPendingNotifications() async {
    scheduled.clear();
  }

  @override
  Future<List<ActiveNotification>> getActiveNotifications() async {
    return [];
  }

  @override
  Future<NotificationAppLaunchDetails?>
      getNotificationAppLaunchDetails() async {
    return null;
  }

  @override
  Future<void> periodicallyShow({
    required int id,
    String? title,
    String? body,
    required RepeatInterval repeatInterval,
    required NotificationDetails notificationDetails,
    required AndroidScheduleMode androidScheduleMode,
    String? payload,
  }) async {}

  @override
  Future<void> periodicallyShowWithDuration({
    required int id,
    String? title,
    String? body,
    required Duration repeatDurationInterval,
    required NotificationDetails notificationDetails,
    AndroidScheduleMode? androidScheduleMode,
    String? payload,
  }) async {}

  @override
  T? resolvePlatformSpecificImplementation<
      T extends FlutterLocalNotificationsPlatform>() {
    return null;
  }
}

void main() {
  late NotificationService service;
  late FakeFlutterLocalNotificationsPlugin fakePlugin;

  setUp(() {
    tzdata.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Etc/UTC'));

    NotificationService.isPlatformSupported = () => true;
    fakePlugin = FakeFlutterLocalNotificationsPlugin();
    service = NotificationService(plugin: fakePlugin);
  });

  tearDownAll(() {
    NotificationService.isPlatformSupported = null;
  });

  test('scheduleNotification adds a notification', () async {
    await service.scheduleNotification(
      id: 1,
      title: 'Test',
      body: 'Body',
      scheduledTime: DateTime(2026, 2, 8, 10, 30),
      scheduleId: 42,
    );

    expect(fakePlugin.scheduled.length, 1);
    final n = fakePlugin.scheduled.first;
    expect(n['id'], 1);
    expect(n['title'], 'Test');
    expect(n['body'], 'Body');
    expect((n['date'] as tz.TZDateTime).hour, 10);
    expect((n['date'] as tz.TZDateTime).minute, 30);
  });

  test('scheduleNotification embeds the scheduleId in the payload', () async {
    await service.scheduleNotification(
      id: 1,
      title: 'Test',
      body: 'Body',
      scheduledTime: DateTime(2026, 2, 8, 10, 30),
      scheduleId: 42,
    );

    final n = fakePlugin.scheduled.single;
    final payload = jsonDecode(n['payload'] as String) as Map<String, Object?>;
    expect(payload['scheduleId'], 42);
  });

  test('scheduleNotification embeds title/body in the payload for snoozing',
      () async {
    await service.scheduleNotification(
      id: 1,
      title: 'Test',
      body: 'Body',
      scheduledTime: DateTime(2026, 2, 8, 10, 30),
      scheduleId: 42,
    );

    final n = fakePlugin.scheduled.single;
    final payload = jsonDecode(n['payload'] as String) as Map<String, Object?>;
    expect(payload['title'], 'Test');
    expect(payload['body'], 'Body');
  });

  test('showNotification adds a shown notification', () async {
    await service.showNotification(title: 'Show', body: 'Body');
    expect(fakePlugin.shown.length, 1);
    final n = fakePlugin.shown.first;
    expect(n['title'], 'Show');
    expect(n['body'], 'Body');
  });

  test('cancelAllNotifications clears scheduled', () async {
    await service.scheduleNotification(
      id: 1,
      title: 'T1',
      body: 'B1',
      scheduledTime: DateTime(2026, 2, 8, 10, 0),
      scheduleId: 1,
    );
    await service.cancelAllNotifications();
    expect(fakePlugin.scheduled.length, 0);
  });

  test('cancelPendingNotifications removes only pending', () async {
    await service.scheduleNotification(
      id: 1,
      title: 'T1',
      body: 'B1',
      scheduledTime: DateTime(2026, 2, 8, 10, 0),
      scheduleId: 1,
    );
    await service.scheduleNotification(
      id: 2,
      title: 'T2',
      body: 'B2',
      scheduledTime: DateTime(2026, 2, 9, 10, 0),
      scheduleId: 2,
    );

    await service.cancelPendingNotifications();
    expect(fakePlugin.scheduled.length, 0);
  });

  test('triggerPastPendingNotifications shows past notifications', () async {
    await withFixedClockAsync(() async {
      final payload = jsonEncode({
        'scheduledTime':
            clock.now().subtract(Duration(days: 1)).toIso8601String()
      });
      fakePlugin.scheduled.add({
        'id': 1,
        'title': 'Past',
        'body': 'B',
        'date': clock.now(),
        'payload': payload
      });

      await service.triggerPastPendingNotifications();
      expect(fakePlugin.shown.length, 1);
      expect(fakePlugin.shown.first['title'], 'Past');
    });
  });

  test(
      'triggerPastPendingNotifications does not re-show recurring notifications',
      () async {
    await withFixedClockAsync(() async {
      // Arrange
      final payload = jsonEncode({
        'scheduledTime':
            clock.now().subtract(Duration(days: 1)).toIso8601String(),
        'isRepeating': true,
      });
      fakePlugin.scheduled.add({
        'id': 1,
        'title': 'Recurring',
        'body': 'B',
        'date': clock.now(),
        'payload': payload,
      });

      // Act
      await service.triggerPastPendingNotifications();

      // Assert
      expect(fakePlugin.shown, isEmpty);
    });
  });

  test('scheduleDailyNotification matches on time only and marks repeating',
      () async {
    // Arrange
    final firstFire = DateTime.utc(2026, 2, 8, 10, 30);

    // Act
    await service.scheduleDailyNotification(
      id: 7,
      title: 'D',
      body: 'B',
      firstOccurrence: firstFire,
      scheduleId: 7,
      scheduledTimeHour: 10,
      scheduledTimeMinute: 30,
    );

    // Assert
    final n = fakePlugin.scheduled.single;
    final payload = jsonDecode(n['payload'] as String) as Map<String, Object?>;
    expect(n['matchDateTimeComponents'], DateTimeComponents.time);
    expect(payload['isRepeating'], isTrue);
    expect(payload['scheduleId'], 7);
    expect(payload['scheduledTimeHour'], 10);
    expect(payload['scheduledTimeMinute'], 30);
  });

  test(
      'scheduleWeeklyNotification matches on dayOfWeek+time and marks repeating',
      () async {
    // Arrange
    final firstFire = DateTime.utc(2026, 2, 9, 8, 0); // Mon

    // Act
    await service.scheduleWeeklyNotification(
      id: 9,
      title: 'W',
      body: 'B',
      firstOccurrence: firstFire,
      scheduleId: 9,
      scheduledTimeHour: 8,
      scheduledTimeMinute: 0,
    );

    // Assert
    final n = fakePlugin.scheduled.single;
    final payload = jsonDecode(n['payload'] as String) as Map<String, Object?>;
    expect(n['matchDateTimeComponents'], DateTimeComponents.dayOfWeekAndTime);
    expect(payload['isRepeating'], isTrue);
    expect(payload['scheduleId'], 9);
  });

  test('showNotification forwards the payload when provided', () async {
    await service.showNotification(
      title: 'Show',
      body: 'Body',
      payload: jsonEncode({'scheduleId': 5}),
    );

    final n = fakePlugin.shown.single;
    final payload = jsonDecode(n['payload'] as String) as Map<String, Object?>;
    expect(payload['scheduleId'], 5);
  });

  test('triggerPastPendingNotifications forwards the original payload',
      () async {
    await withFixedClockAsync(() async {
      final payload = jsonEncode({
        'scheduledTime':
            clock.now().subtract(Duration(days: 1)).toIso8601String(),
        'scheduleId': 3,
      });
      fakePlugin.scheduled.add({
        'id': 1,
        'title': 'Past',
        'body': 'B',
        'date': clock.now(),
        'payload': payload,
      });

      await service.triggerPastPendingNotifications();

      final shown = fakePlugin.shown.single;
      final shownPayload =
          jsonDecode(shown['payload'] as String) as Map<String, Object?>;
      expect(shownPayload['scheduleId'], 3);
    });
  });
}
