import 'package:home_widget/home_widget.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/helpers/supply_item_l10n.dart';
import 'package:mona/services/widget_provider_names.dart';

/// Keeps the Android "Supplies" home screen widget in sync with the supply
/// items running lowest, so you notice you're about to run out before you
/// do.
///
/// Mirrors [RecentIntakesWidgetService]'s shape: fixed, non-scrolling rows
/// pre-rendered on the Dart side. Medication supplies (which have a
/// meaningful remaining-percentage) are ranked worst-ratio-first ahead of
/// generic supplies (syringes, wipes, ...), since running out of the actual
/// medication is the more critical failure mode.
class SuppliesWidgetService {
  static const int rowCount = 4;

  static const String countKey = 'supplies_widget_count';

  /// Below this remaining fraction, a medication supply's row is flagged low.
  static const double _lowMedicationRatio = 0.2;

  /// At or below this raw count, a generic supply's row is flagged low.
  static const int _lowGenericAmount = 2;

  static String nameKey(int index) => 'supplies_widget_name_$index';
  static String summaryKey(int index) => 'supplies_widget_summary_$index';
  static String lowKey(int index) => 'supplies_widget_low_$index';

  final SupplyItemProvider supplyItemProvider;

  SuppliesWidgetService({required this.supplyItemProvider});

  /// Recomputes the widget rows and pushes them to the native side.
  /// Call this whenever supplies change.
  Future<void> sync() async {
    final items = _orderedByUrgency().take(rowCount);

    var count = 0;
    for (final item in items) {
      await HomeWidget.saveWidgetData<String>(nameKey(count), item.name);
      await HomeWidget.saveWidgetData<String>(
          summaryKey(count), item.localizedSummary);
      await HomeWidget.saveWidgetData<bool>(lowKey(count), _isLow(item));
      count++;
    }

    await HomeWidget.saveWidgetData<int>(countKey, count);
    await HomeWidget.updateWidget(
        qualifiedAndroidName: WidgetProviderNames.suppliesWidget);
  }

  List<SupplyItem> _orderedByUrgency() {
    final generic = [...supplyItemProvider.genericItems]
      ..sort((a, b) => a.amount.compareTo(b.amount));
    return [
      ...supplyItemProvider.medicationItemsOrderedByRatio,
      ...generic,
    ];
  }

  bool _isLow(SupplyItem item) => switch (item) {
        final MedicationSupplyItem m => m.getRatio() < _lowMedicationRatio,
        final GenericSupply g => g.amount <= _lowGenericAmount,
        _ => false,
      };
}
