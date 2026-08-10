import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/services/notification_action_handler.dart';
import 'package:mona/services/notification_service.dart';

import '../data/providers/generic_repository_mock.dart';

NotificationResponse _response({String? actionId, String? payload}) {
  return NotificationResponse(
    notificationResponseType:
        NotificationResponseType.selectedNotificationAction,
    actionId: actionId,
    payload: payload,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter_timezone'),
    (MethodCall call) async {
      if (call.method == 'getLocalTimezone') return 'UTC';
      return null;
    },
  );

  late GenericRepositoryMock<MedicationSchedule> scheduleRepository;
  late GenericRepositoryMock<MedicationIntake> intakeRepository;

  setUp(() {
    scheduleRepository = GenericRepositoryMock<MedicationSchedule>(
      withId: (i, id) => MedicationSchedule(
        id: id,
        name: i.name,
        dose: i.dose,
        scheduling: i.scheduling,
        molecule: i.molecule,
        administrationRoute: i.administrationRoute,
        ester: i.ester,
      ),
    );
    intakeRepository = GenericRepositoryMock<MedicationIntake>(
      withId: (i, id) => i.copyWith(id: id),
    );

    scheduleRepository.insert(MedicationSchedule(
      id: 1,
      name: 'Estradiol',
      dose: Decimal.parse('2.0'),
      scheduling: IntervalDaysSchedule(intervalDays: 1),
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.oral,
    ));
  });

  Future<void> handle(NotificationResponse response) =>
      onBackgroundNotificationResponse(
        response,
        scheduleRepository: scheduleRepository,
        intakeRepository: intakeRepository,
      );

  test('ignores responses for other actions', () async {
    await handle(_response(
      actionId: 'something_else',
      payload: jsonEncode({'scheduleId': 1}),
    ));

    expect(intakeRepository.items, isEmpty);
  });

  test('ignores a payload with no scheduleId', () async {
    await handle(_response(actionId: takeActionId, payload: null));

    expect(intakeRepository.items, isEmpty);
  });

  test('ignores a scheduleId that no longer exists', () async {
    await handle(_response(
      actionId: takeActionId,
      payload: jsonEncode({'scheduleId': 999}),
    ));

    expect(intakeRepository.items, isEmpty);
  });

  test('logs an intake matching the schedule', () async {
    await handle(_response(
      actionId: takeActionId,
      payload: jsonEncode({'scheduleId': 1}),
    ));

    final intake = intakeRepository.items.single;
    expect(intake.scheduleId, 1);
    expect(intake.takenDose, Decimal.parse('2.0'));
    expect(intake.molecule, KnownMolecules.estradiol);
    expect(intake.administrationRoute, AdministrationRoute.oral);
    expect(intake.isTaken, true);
    expect(intake.scheduledTime, isNull);
  });

  test('carries the scheduled time-of-day for daily/weekly reminders',
      () async {
    await handle(_response(
      actionId: takeActionId,
      payload: jsonEncode({
        'scheduleId': 1,
        'scheduledTimeHour': 8,
        'scheduledTimeMinute': 30,
      }),
    ));

    final intake = intakeRepository.items.single;
    expect(intake.scheduledTime?.hour, 8);
    expect(intake.scheduledTime?.minute, 30);
  });
}
