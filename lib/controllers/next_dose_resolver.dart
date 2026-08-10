import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mona/controllers/slots_builder.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/intake_slot.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/translations.g.dart';

/// Picks whichever schedule is next due (or overdue) across all of a user's
/// schedules, and renders a short localized timing label for it.
///
/// Pure logic, no BuildContext or platform dependency, so it can back both
/// [NextDoseWidgetService] and [StatusWidgetService] without either
/// duplicating (and risking drifting out of sync with) the urgency ranking.
class NextDoseResolver {
  const NextDoseResolver();

  /// Picks the single most urgent slot that hasn't been taken yet: overdue
  /// first (oldest miss first), then today, then the soonest upcoming
  /// occurrence. Returns null when every schedule is caught up.
  IntakeSlot? pickNext(
    MedicationIntakeProvider medicationIntakeProvider,
    MedicationScheduleProvider medicationScheduleProvider,
  ) {
    final slots = SlotsBuilder(
      medicationIntakeProvider,
      medicationScheduleProvider,
    ).intakeSlots();

    final pending = slots
        .where((s) => s.status != ScheduleStatus.taken)
        .toList()
      ..sort(_compareUrgency);
    return pending.isEmpty ? null : pending.first;
  }

  bool isOverdue(IntakeSlot slot) =>
      slot.status == ScheduleStatus.overdue ||
      slot.status == ScheduleStatus.todayOverdue;

  int _compareUrgency(IntakeSlot a, IntakeSlot b) {
    final rankCompare = _rank(a.status).compareTo(_rank(b.status));
    if (rankCompare != 0) return rankCompare;

    if (a.date != b.date) {
      return a.date.isBefore(b.date) ? -1 : 1;
    }

    final at = a.time;
    final bt = b.time;
    if (at == null && bt == null) return 0;
    if (at == null) return -1;
    if (bt == null) return 1;
    final hourCompare = at.hour.compareTo(bt.hour);
    return hourCompare != 0 ? hourCompare : at.minute.compareTo(bt.minute);
  }

  int _rank(ScheduleStatus status) => switch (status) {
        ScheduleStatus.overdue || ScheduleStatus.todayOverdue => 0,
        ScheduleStatus.todayEarly || ScheduleStatus.today => 1,
        ScheduleStatus.upcoming => 2,
        ScheduleStatus.taken => 3,
      };

  /// A short "when" label: "Overdue", "Due today", a formatted time, or a
  /// relative date like "Tomorrow" / "in 3 days".
  String timingLabel(IntakeSlot slot) {
    switch (slot.status) {
      case ScheduleStatus.overdue:
      case ScheduleStatus.todayOverdue:
        return t.nextDoseOverdueLabel;
      case ScheduleStatus.todayEarly:
      case ScheduleStatus.today:
        final time = slot.time;
        return time == null ? t.nextDoseDueTodayLabel : _formatTime(time);
      case ScheduleStatus.upcoming:
        return _upcomingLabel(slot.date);
      case ScheduleStatus.taken:
        return '';
    }
  }

  String _upcomingLabel(Date date) {
    final diff = date.daysAwayFromToday;
    if (diff == 1) {
      final tomorrow = t.tomorrow;
      return tomorrow[0].toUpperCase() + tomorrow.substring(1);
    }
    return t.inDaysCount(count: diff);
  }

  String _formatTime(TimeOfDay time) {
    final dt = DateTime(2000, 1, 1, time.hour, time.minute);
    return DateFormat.jm(_languageTag).format(dt);
  }

  String get _languageTag =>
      intlSafeLanguageTag(LocaleSettings.currentLocale.languageTag);
}
