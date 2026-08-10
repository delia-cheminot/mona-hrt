import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/hrt_duration.dart';

extension HrtDurationL10n on HrtDuration {
  String get localizedText => switch (unit) {
        HrtDurationUnit.days => t.onHrtForDays(count: value),
        HrtDurationUnit.weeks => t.onHrtForWeeks(count: value),
        HrtDurationUnit.months => t.onHrtForMonths(count: value),
        HrtDurationUnit.years => t.onHrtForYears(count: value),
      };
}
