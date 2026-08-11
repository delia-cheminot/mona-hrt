import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/notification_service.dart';
import 'package:mona/services/repository.dart';

/// Handles medication reminder notification actions -- "Take" ([takeActionId])
/// and "Snooze" ([snoozeActionId]) -- without opening the app.
///
/// Runs on a separate background isolate the OS spawns just for this call,
/// so there's no running app, no Provider tree, nothing already in memory.
///
/// Must be a top-level function annotated with `@pragma('vm:entry-point')`
/// so the Dart compiler doesn't strip it and the background isolate can
/// find it by name, see flutter_local_notifications' background response
/// docs.
///
/// [scheduleRepository]/[intakeRepository] default to the app's real
/// sqflite-backed repositories; overridable for tests. Extra optional
/// params are fine on a callback passed as
/// `onDidReceiveBackgroundNotificationResponse` -- Dart's function
/// subtyping allows them.
@pragma('vm:entry-point')
Future<void> onBackgroundNotificationResponse(
  NotificationResponse response, {
  Repository<MedicationSchedule>? scheduleRepository,
  Repository<MedicationIntake>? intakeRepository,
}) async {
  final payload = _decodePayload(response.payload);

  switch (response.actionId) {
    case takeActionId:
      await _handleTake(
        payload,
        scheduleRepository: scheduleRepository,
        intakeRepository: intakeRepository,
      );
    case snoozeActionId:
      await _handleSnooze(payload);
  }
}

/// Logs an intake for the reminder's schedule directly. It talks to the
/// database through the same repositories [MedicationIntakeProvider]/
/// [MedicationScheduleProvider] use, bypassing the ChangeNotifier wrappers
/// themselves since there's nothing here to notify and their async
/// init-then-read pattern assumes a widget tree.
///
/// Deliberately narrow in scope: no supply item is linked/deducted (there's
/// no sensible way to guess which one headlessly) and nothing else that
/// depends on the app already running (widget/notification resync) happens
/// here -- that catches up next time the app is opened, same as it already
/// does for other changes made while the app isn't running.
Future<void> _handleTake(
  Map<String, dynamic> payload, {
  Repository<MedicationSchedule>? scheduleRepository,
  Repository<MedicationIntake>? intakeRepository,
}) async {
  final scheduleId = payload['scheduleId'] as int?;
  if (scheduleId == null) return;

  WidgetsFlutterBinding.ensureInitialized();

  final schedules =
      await (scheduleRepository ?? MedicationScheduleProvider.defaultRepository)
          .getAll();
  MedicationSchedule? schedule;
  for (final s in schedules) {
    if (s.id == scheduleId) {
      schedule = s;
      break;
    }
  }
  if (schedule == null) return;

  final scheduledTime = _scheduledTimeFrom(payload);
  final timezone = await FlutterTimezone.getLocalTimezone();

  await (intakeRepository ?? MedicationIntakeProvider.defaultRepository)
      .insert(MedicationIntake(
    takenDose: schedule.dose,
    scheduledTime: scheduledTime,
    takenDateTime: DateTime.now().toUtc(),
    takenTimeZone: timezone.identifier,
    scheduleId: schedule.id,
    molecule: schedule.molecule,
    administrationRoute: schedule.administrationRoute,
    ester: schedule.ester,
  ));
}

/// Reschedules the exact same reminder [snoozeDuration] later, reusing the
/// original (already-localized) title/body text carried in the payload
/// rather than re-rendering strings from a background isolate that has no
/// guarantee of running with the user's chosen locale.
///
/// No database read needed: unlike [_handleTake], nothing here depends on
/// the schedule's current state, just the id/time-of-day to carry forward
/// so the snoozed notification's own Take/Snooze actions keep working (and
/// can themselves be snoozed again).
Future<void> _handleSnooze(Map<String, dynamic> payload) async {
  final scheduleId = payload['scheduleId'] as int?;
  final title = payload['title'] as String?;
  final body = payload['body'] as String?;
  if (scheduleId == null || title == null || body == null) return;

  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();

  final scheduledTime = clock.now().add(snoozeDuration);

  await NotificationService().scheduleNotification(
    id: Object.hash(scheduleId, scheduledTime.millisecondsSinceEpoch) &
        0x7fffffff,
    title: title,
    body: body,
    scheduledTime: scheduledTime,
    scheduleId: scheduleId,
    scheduledTimeHour: payload['scheduledTimeHour'] as int?,
    scheduledTimeMinute: payload['scheduledTimeMinute'] as int?,
  );
}

Map<String, dynamic> _decodePayload(String? payload) {
  if (payload == null || payload.isEmpty) return {};
  try {
    final decoded = jsonDecode(payload);
    return decoded is Map<String, dynamic> ? decoded : {};
  } catch (_) {
    return {};
  }
}

TimeOfDay? _scheduledTimeFrom(Map<String, dynamic> payload) {
  final hour = payload['scheduledTimeHour'] as int?;
  final minute = payload['scheduledTimeMinute'] as int?;
  if (hour == null || minute == null) return null;
  return TimeOfDay(hour: hour, minute: minute);
}
