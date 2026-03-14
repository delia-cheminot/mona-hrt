import 'package:intl/intl.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/notification_service.dart';
import 'package:mona/services/preferences_service.dart';

class NotificationScheduler {
  final MedicationScheduleProvider medicationScheduleProvider;
  final PreferencesService preferencesService;

  NotificationScheduler(
      this.medicationScheduleProvider, this.preferencesService);

  Map<DateTime, MedicationSchedule> _getNotificationTimes() {
    final Map<DateTime, MedicationSchedule> notificationsToSchedule = {};
    final now = DateTime.now();

    for (final schedule in medicationScheduleProvider.schedules) {
      final nextDates = schedule.getNextDates(count: 5);

      for (final date in nextDates) {
        for (final time in schedule.notificationTimes) {
          final dateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );

          if (now.isAfter(dateTime)) continue;

          notificationsToSchedule[dateTime] = schedule;
        }
      }
    }

    return notificationsToSchedule;
  }

  Future<void> regenerateAll() async {
    NotificationService().triggerPastPendingNotifications();
    NotificationService().cancelPendingNotifications();

    if (!preferencesService.notificationsEnabled) {
      return;
    }

    final notificationTimes = _getNotificationTimes();

    await Future.wait(
      notificationTimes.entries.map(
        (entry) {
          final dateTime = entry.key;
          final schedule = entry.value;

          return NotificationService().scheduleNotification(
            title: 'Time to take ${schedule.name}',
            body:
                'Next intake scheduled for ${DateFormat.MMMMd().format(dateTime)}',
            year: dateTime.year,
            month: dateTime.month,
            day: dateTime.day,
            hour: dateTime.hour,
            minute: dateTime.minute,
          );
        },
      ),
    );
  }
}
