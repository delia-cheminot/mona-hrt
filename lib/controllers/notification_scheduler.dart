import 'package:intl/intl.dart';
import 'package:mona/controllers/notification_planner.dart';
import 'package:mona/data/model/planned_notification.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/notification_service.dart';
import 'package:mona/services/preferences_service.dart';

int _notificationIdFor(int scheduleId, DateTime dateTime) {
  return Object.hash(scheduleId, dateTime.millisecondsSinceEpoch) & 0x7fffffff;
}

class NotificationScheduler {
  static const int _maxScheduled = 60; // below iOS limit

  final NotificationPlanner planner;
  final PreferencesService preferencesService;

  NotificationScheduler(this.planner, this.preferencesService);

  Future<void> regenerateAll(String localeName) async {
    await NotificationService().triggerPastPendingNotifications();
    await NotificationService().cancelPendingNotifications();

    if (!preferencesService.notificationsEnabled) {
      return;
    }

    final daysAhead = planner.daysAhead(maxScheduled: _maxScheduled);
    final plans = [...planner.planNotifications(daysAhead: daysAhead)]
      ..sort((a, b) => a.firstFire.compareTo(b.firstFire));

    await Future.wait(
        plans.take(_maxScheduled).map((plan) => _schedule(plan, localeName)));
  }

  Future<void> _schedule(PlannedNotification plan, String localeName) {
    switch (plan) {
      case PlannedOccurrence():
        return _scheduleOccurrence(plan, localeName);
      case PlannedRepeating():
        switch (plan.periodicity) {
          case Periodicity.daily:
            return _scheduleDaily(plan, localeName);
          case Periodicity.weekly:
            return _scheduleWeekly(plan, localeName);
        }
    }
  }

  Future<void> _scheduleOccurrence(
    PlannedOccurrence plan,
    String localeName,
  ) {
    final dateFormat = DateFormat.MMMMd(localeName);
    return NotificationService().scheduleNotification(
      id: _notificationIdFor(plan.schedule.id, plan.dateTime),
      title: t.notificationMedicationReminderTitle(
          scheduleName: plan.schedule.name),
      body: t.notificationMedicationReminderBodyDate(
        date: dateFormat.format(plan.dateTime),
      ),
      scheduledTime: plan.dateTime,
    );
  }

  Future<void> _scheduleDaily(
    PlannedRepeating plan,
    String localeName,
  ) {
    final timeFormat = DateFormat.Hm(localeName);
    return NotificationService().scheduleDailyNotification(
      id: _notificationIdFor(plan.schedule.id, plan.firstFire),
      title: t.notificationMedicationReminderTitle(
          scheduleName: plan.schedule.name),
      body: t.notificationMedicationReminderBodyTime(
        time: timeFormat.format(plan.firstFire),
      ),
      firstOccurrence: plan.firstFire,
    );
  }

  Future<void> _scheduleWeekly(
    PlannedRepeating plan,
    String localeName,
  ) {
    final weekdayFormat = DateFormat.EEEE(localeName);
    return NotificationService().scheduleWeeklyNotification(
      id: _notificationIdFor(plan.schedule.id, plan.firstFire),
      title: t.notificationMedicationReminderTitle(
          scheduleName: plan.schedule.name),
      body: t.notificationMedicationReminderBodyWeekday(
        weekday: weekdayFormat.format(plan.firstFire),
      ),
      firstOccurrence: plan.firstFire,
    );
  }
}
