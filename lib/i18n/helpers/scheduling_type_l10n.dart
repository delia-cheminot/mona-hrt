import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/i18n/translations.g.dart';

extension SchedulingTypeL10n on SchedulingType {
  String get localizedName => switch (this) {
        SchedulingType.daily => t.scheduleFrequencyDaily,
        SchedulingType.intervalDays => t.scheduleFrequencyInterval,
        SchedulingType.weekly => t.scheduleFrequencyWeekly,
        SchedulingType.monthly => t.scheduleFrequencyMonthly,
        SchedulingType.asNeeded => t.scheduleFrequencyAsNeeded,
      };

  String get localizedDescription => switch (this) {
        SchedulingType.daily => t.scheduleFrequencyDailyDescription,
        SchedulingType.intervalDays => t.scheduleFrequencyIntervalDescription,
        SchedulingType.weekly => t.scheduleFrequencyWeeklyDescription,
        SchedulingType.monthly => t.scheduleFrequencyMonthlyDescription,
        SchedulingType.asNeeded => t.scheduleFrequencyAsNeededDescription,
      };
}
