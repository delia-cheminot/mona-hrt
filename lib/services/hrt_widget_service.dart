import 'package:home_widget/home_widget.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/helpers/hrt_duration_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/services/widget_provider_names.dart';
import 'package:mona/util/hrt_duration.dart';

/// Keeps the Android home screen widget in sync with the current
/// "on HRT for X" duration and logged intake count.
///
/// Mirrors the same data [IntakeCounterCard] shows on the Intakes page,
/// but pre-renders the localized strings on the Dart side so the native
/// widget provider only has to display plain text (no duplicated
/// pluralization / i18n logic on the Kotlin side).
class HrtWidgetService {
  static const String titleKey = 'hrt_widget_title';
  static const String subtitleKey = 'hrt_widget_subtitle';
  static const String enabledKey = 'hrt_widget_enabled';

  final MedicationIntakeProvider medicationIntakeProvider;
  final PreferencesService preferencesService;

  HrtWidgetService({
    required this.medicationIntakeProvider,
    required this.preferencesService,
  });

  /// Recomputes the widget text and pushes it to the native side.
  /// Call this whenever intakes or the relevant preference change.
  Future<void> sync() async {
    final enabled = preferencesService.intakeCounterEnabled;
    await HomeWidget.saveWidgetData<bool>(enabledKey, enabled);

    if (!enabled) {
      await HomeWidget.updateWidget(
          qualifiedAndroidName: WidgetProviderNames.hrtWidget);
      return;
    }

    final firstDate = medicationIntakeProvider.firstTakenLocalDate;
    final intakeCount = medicationIntakeProvider.takenIntakes.length;

    final title =
        firstDate == null ? null : hrtDurationSince(firstDate).localizedText;
    final subtitle =
        firstDate == null ? null : t.intakesLoggedCount(count: intakeCount);

    await HomeWidget.saveWidgetData<String?>(titleKey, title);
    await HomeWidget.saveWidgetData<String?>(subtitleKey, subtitle);
    await HomeWidget.updateWidget(
        qualifiedAndroidName: WidgetProviderNames.hrtWidget);
  }
}
