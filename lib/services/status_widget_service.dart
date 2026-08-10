import 'package:collection/collection.dart';
import 'package:home_widget/home_widget.dart';
import 'package:mona/controllers/next_dose_resolver.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/helpers/generic_type_l10n.dart';
import 'package:mona/i18n/helpers/hrt_duration_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/widget_provider_names.dart';
import 'package:mona/util/hrt_duration.dart';

/// Keeps the Android "Status" home screen widget (a square dashboard: HRT
/// duration, next dose, and the most urgent supply) in sync.
///
/// Reuses [NextDoseResolver] for the next-dose row (same logic
/// [NextDoseWidgetService] uses) and [SupplyItemProvider]'s existing
/// ratio-ordering for the supply row, so this is purely a compact rollup of
/// state the other widgets already compute -- no new domain logic.
class StatusWidgetService {
  static const String durationKey = 'status_widget_duration';
  static const String nextDoseKey = 'status_widget_next_dose';
  static const String nextDoseOverdueKey = 'status_widget_next_dose_overdue';
  static const String supplyKey = 'status_widget_supply';
  static const String supplyLowKey = 'status_widget_supply_low';

  /// Below this remaining fraction, a medication supply's row is flagged low.
  static const double _lowMedicationRatio = 0.2;

  /// At or below this raw count, a generic supply's row is flagged low.
  static const int _lowGenericAmount = 2;

  final MedicationIntakeProvider medicationIntakeProvider;
  final MedicationScheduleProvider medicationScheduleProvider;
  final SupplyItemProvider supplyItemProvider;
  final NextDoseResolver _resolver;

  StatusWidgetService({
    required this.medicationIntakeProvider,
    required this.medicationScheduleProvider,
    required this.supplyItemProvider,
    NextDoseResolver resolver = const NextDoseResolver(),
  }) : _resolver = resolver;

  /// Recomputes the widget text and pushes it to the native side.
  /// Call this whenever intakes, schedules, or supplies change.
  Future<void> sync() async {
    await HomeWidget.saveWidgetData<String>(durationKey, _durationText());

    final next = medicationScheduleProvider.schedules.isEmpty
        ? null
        : _resolver.pickNext(
            medicationIntakeProvider, medicationScheduleProvider);
    await HomeWidget.saveWidgetData<String>(
      nextDoseKey,
      next == null
          ? t.allDone
          : '${next.schedule.name} • '
              '${_resolver.timingLabel(next)}',
    );
    await HomeWidget.saveWidgetData<bool>(
      nextDoseOverdueKey,
      next != null && _resolver.isOverdue(next),
    );

    final (supplyText, supplyLow) = _supplyStatus();
    await HomeWidget.saveWidgetData<String>(supplyKey, supplyText);
    await HomeWidget.saveWidgetData<bool>(supplyLowKey, supplyLow);

    await HomeWidget.updateWidget(
        qualifiedAndroidName: WidgetProviderNames.statusWidget);
  }

  String _durationText() {
    final firstDate = medicationIntakeProvider.firstTakenLocalDate;
    return firstDate == null
        ? t.empty_home
        : hrtDurationSince(firstDate).localizedText;
  }

  (String, bool) _supplyStatus() {
    final MedicationSupplyItem? worstMedication =
        supplyItemProvider.medicationItemsOrderedByRatio.firstOrNull;
    if (worstMedication != null) {
      final percent = (worstMedication.getRatio() * 100).round();
      return (
        '${worstMedication.name}: $percent%',
        worstMedication.getRatio() < _lowMedicationRatio,
      );
    }

    final genericItems = [...supplyItemProvider.genericItems]
      ..sort((a, b) => a.amount.compareTo(b.amount));
    final GenericSupply? worstGeneric = genericItems.firstOrNull;
    if (worstGeneric != null) {
      return (
        '${worstGeneric.name}: '
            '${worstGeneric.genericSupplyType.localizedRemaining(worstGeneric.amount)}',
        worstGeneric.amount <= _lowGenericAmount,
      );
    }

    return (t.empty_supplies, false);
  }
}
