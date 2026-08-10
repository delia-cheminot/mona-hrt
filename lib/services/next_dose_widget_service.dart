import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:mona/controllers/slots_builder.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/intake_slot.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/widget_provider_names.dart';

/// Keeps the Android "Next dose" home screen widget in sync with whichever
/// schedule is next due (or overdue).
///
/// Picks the single most urgent not-yet-taken [IntakeSlot] using the same
/// [SlotsBuilder] the home page uses, then pre-renders localized strings on
/// the Dart side so the native widget provider only has to display plain
/// text, mirroring [HrtWidgetService]'s split of responsibilities.
class NextDoseWidgetService {
  static const String titleKey = 'next_dose_widget_title';
  static const String subtitleKey = 'next_dose_widget_subtitle';
  static const String overdueKey = 'next_dose_widget_overdue';

  final MedicationIntakeProvider medicationIntakeProvider;
  final MedicationScheduleProvider medicationScheduleProvider;

  NextDoseWidgetService({
    required this.medicationIntakeProvider,
    required this.medicationScheduleProvider,
  });

  /// Recomputes the widget text and pushes it to the native side.
  /// Call this whenever schedules or intakes change.
  Future<void> sync() async {
    if (medicationScheduleProvider.schedules.isEmpty) {
      await _push(title: t.empty_home, subtitle: null, overdue: false);
      return;
    }

    final slots = SlotsBuilder(
      medicationIntakeProvider,
      medicationScheduleProvider,
    ).intakeSlots();
    final next = _pickNext(slots);

    if (next == null) {
      await _push(title: t.allDone, subtitle: t.noIntakesDue, overdue: false);
      return;
    }

    final overdue = next.status == ScheduleStatus.overdue ||
        next.status == ScheduleStatus.todayOverdue;

    await _push(
      title: next.schedule.name,
      subtitle: '${_timingLabel(next)} • ${_detailText(next)}',
      overdue: overdue,
    );
  }

  Future<void> _push({
    required String title,
    required String? subtitle,
    required bool overdue,
  }) async {
    await HomeWidget.saveWidgetData<String>(titleKey, title);
    await HomeWidget.saveWidgetData<String?>(subtitleKey, subtitle);
    await HomeWidget.saveWidgetData<bool>(overdueKey, overdue);
    await HomeWidget.updateWidget(
        qualifiedAndroidName: WidgetProviderNames.nextDoseWidget);
  }

  /// Picks the single most urgent slot that hasn't been taken yet:
  /// overdue first (oldest miss first), then today, then the soonest
  /// upcoming occurrence. Returns null when every schedule is caught up.
  IntakeSlot? _pickNext(List<IntakeSlot> slots) {
    final pending =
        slots.where((s) => s.status != ScheduleStatus.taken).toList()
          ..sort(_compareUrgency);
    return pending.isEmpty ? null : pending.first;
  }

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

  String _timingLabel(IntakeSlot slot) {
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

  String _detailText(IntakeSlot slot) {
    final schedule = slot.schedule;
    return '${schedule.dose} ${schedule.molecule.localizedUnit} • '
        '${schedule.molecule.localizedNameWithEster(schedule.ester)} • '
        '${schedule.administrationRoute.localizedName}';
  }

  String get _languageTag =>
      intlSafeLanguageTag(LocaleSettings.currentLocale.languageTag);
}
