import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/medication_intake_l10n.dart';
import 'package:mona/i18n/translations.g.dart';

/// Keeps the Android "Recent injections" home screen widget in sync with the
/// most recently taken intakes.
///
/// Mirrors the top of the Intakes page's list (date + [localizedSummary] per
/// row), pre-rendered on the Dart side so the native widget provider only
/// has to display plain text rows, same split of responsibilities as
/// [HrtWidgetService] and [NextDoseWidgetService].
///
/// The widget shows a fixed number of rows (no native scrolling), so only
/// the [rowCount] most recent intakes are pushed.
class RecentIntakesWidgetService {
  static const String _androidWidgetName = 'RecentIntakesWidgetProvider';
  static const int rowCount = 4;

  static const String countKey = 'recent_intakes_widget_count';

  static String dateKey(int index) => 'recent_intakes_widget_date_$index';
  static String summaryKey(int index) =>
      'recent_intakes_widget_summary_$index';

  final MedicationIntakeProvider medicationIntakeProvider;

  RecentIntakesWidgetService({required this.medicationIntakeProvider});

  /// Recomputes the widget rows and pushes them to the native side.
  /// Call this whenever intakes change.
  Future<void> sync() async {
    final intakes =
        medicationIntakeProvider.takenIntakesSortedDesc.take(rowCount);

    var count = 0;
    for (final intake in intakes) {
      await HomeWidget.saveWidgetData<String>(
        dateKey(count),
        DateFormat.yMMMd(_languageTag).format(intake.takenLocalDateTime!),
      );
      await HomeWidget.saveWidgetData<String>(
        summaryKey(count),
        intake.localizedSummary,
      );
      count++;
    }

    // Kotlin falls back to a localized "no intakes yet" placeholder row
    // when count is 0 (see RecentIntakesWidgetProvider), same fallback
    // pattern as HrtWidgetService.
    await HomeWidget.saveWidgetData<int>(countKey, count);
    await HomeWidget.updateWidget(androidName: _androidWidgetName);
  }

  String get _languageTag =>
      intlSafeLanguageTag(LocaleSettings.currentLocale.languageTag);
}
