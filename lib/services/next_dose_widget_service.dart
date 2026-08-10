import 'package:home_widget/home_widget.dart';
import 'package:mona/controllers/next_dose_resolver.dart';
import 'package:mona/data/model/intake_slot.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/widget_provider_names.dart';

/// Keeps the Android "Next dose" home screen widget in sync with whichever
/// schedule is next due (or overdue).
///
/// Picks the single most urgent not-yet-taken [IntakeSlot] via
/// [NextDoseResolver] (same one [StatusWidgetService] uses), then
/// pre-renders localized strings on the Dart side so the native widget
/// provider only has to display plain text, mirroring [HrtWidgetService]'s
/// split of responsibilities.
class NextDoseWidgetService {
  static const String titleKey = 'next_dose_widget_title';
  static const String subtitleKey = 'next_dose_widget_subtitle';
  static const String overdueKey = 'next_dose_widget_overdue';

  final MedicationIntakeProvider medicationIntakeProvider;
  final MedicationScheduleProvider medicationScheduleProvider;
  final NextDoseResolver _resolver;

  NextDoseWidgetService({
    required this.medicationIntakeProvider,
    required this.medicationScheduleProvider,
    NextDoseResolver resolver = const NextDoseResolver(),
  }) : _resolver = resolver;

  /// Recomputes the widget text and pushes it to the native side.
  /// Call this whenever schedules or intakes change.
  Future<void> sync() async {
    if (medicationScheduleProvider.schedules.isEmpty) {
      await _push(title: t.empty_home, subtitle: null, overdue: false);
      return;
    }

    final next = _resolver.pickNext(
      medicationIntakeProvider,
      medicationScheduleProvider,
    );

    if (next == null) {
      await _push(title: t.allDone, subtitle: t.noIntakesDue, overdue: false);
      return;
    }

    await _push(
      title: next.schedule.name,
      subtitle: '${_resolver.timingLabel(next)} • ${_detailText(next)}',
      overdue: _resolver.isOverdue(next),
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

  String _detailText(IntakeSlot slot) {
    final schedule = slot.schedule;
    return '${schedule.dose} ${schedule.molecule.localizedUnit} • '
        '${schedule.molecule.localizedNameWithEster(schedule.ester)} • '
        '${schedule.administrationRoute.localizedName}';
  }
}
