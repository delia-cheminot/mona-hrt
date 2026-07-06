import 'package:intl/intl.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';

extension MedicationScheduleL10n on MedicationSchedule {
  String get localizedSummary => '$dose ${molecule.localizedUnit} • '
      '${molecule.localizedNameWithEster(ester)} • '
      '${administrationRoute.localizedName}';

  String get localizedFrequency {
    return switch (scheduling) {
      IntervalDaysSchedule(intervalDays: 1) => t.scheduleFrequencyDaily,
      IntervalDaysSchedule(intervalDays: final n) =>
        t.scheduleFrequencyEveryNDays(days: n),
      DailySchedule _ => t.scheduleFrequencyDaily,
      WeeklySchedule s => () {
          if (s.daysOfWeek.length == 7) {
            return t.scheduleFrequencyDaily;
          }
          final formatter = DateFormat.E(
              intlSafeLanguageTag(LocaleSettings.currentLocale.languageTag));
          final days = s.daysOfWeek
              .map((d) => formatter.format(DateTime(2024, 1, d)))
              .join(', ');
          return days[0].toUpperCase() + days.substring(1);
        }(),
    };
  }

  String get localizedSummaryWithFrequency =>
      '$localizedSummary\n$localizedFrequency';
}
