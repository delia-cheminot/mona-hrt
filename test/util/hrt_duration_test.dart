import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/hrt_duration.dart';

import '../util/test_clock.dart';

void main() {
  group('hrtDurationSince', () {
    final cases = [
      (
        description: 'same day reads as 1 day',
        start: Date(year: 2026, month: 6, day: 1),
        today: Date(year: 2026, month: 6, day: 1),
        expected: HrtDuration(HrtDurationUnit.days, 1),
      ),
      (
        description: '6 days stays in days',
        start: Date(year: 2026, month: 6, day: 1),
        today: Date(year: 2026, month: 6, day: 7),
        expected: HrtDuration(HrtDurationUnit.days, 6),
      ),
      (
        description: '7 days switches to 1 week',
        start: Date(year: 2026, month: 6, day: 1),
        today: Date(year: 2026, month: 6, day: 8),
        expected: HrtDuration(HrtDurationUnit.weeks, 1),
      ),
      (
        description: '13 days is still 1 week',
        start: Date(year: 2026, month: 6, day: 1),
        today: Date(year: 2026, month: 6, day: 14),
        expected: HrtDuration(HrtDurationUnit.weeks, 1),
      ),
      (
        description: '14 days switches to 2 weeks',
        start: Date(year: 2026, month: 6, day: 1),
        today: Date(year: 2026, month: 6, day: 15),
        expected: HrtDuration(HrtDurationUnit.weeks, 2),
      ),
      (
        description: '89 days is still weeks',
        start: Date(year: 2026, month: 3, day: 1),
        today: Date(year: 2026, month: 5, day: 29),
        expected: HrtDuration(HrtDurationUnit.weeks, 12),
      ),
      (
        description: '90 days switches to months',
        start: Date(year: 2026, month: 3, day: 1),
        today: Date(year: 2026, month: 5, day: 30),
        expected: HrtDuration(HrtDurationUnit.months, 2),
      ),
      (
        description: 'partial final month does not count',
        start: Date(year: 2025, month: 1, day: 31),
        today: Date(year: 2025, month: 5, day: 30),
        expected: HrtDuration(HrtDurationUnit.months, 3),
      ),
      (
        description: 'under a year stays in months',
        start: Date(year: 2025, month: 1, day: 1),
        today: Date(year: 2025, month: 12, day: 15),
        expected: HrtDuration(HrtDurationUnit.months, 11),
      ),
      (
        description: 'one calendar year switches to years',
        start: Date(year: 2025, month: 1, day: 1),
        today: Date(year: 2026, month: 1, day: 1),
        expected: HrtDuration(HrtDurationUnit.years, 1),
      ),
      (
        description: '365 days that cross a leap day stay in months',
        start: Date(year: 2024, month: 1, day: 1),
        today: Date(year: 2024, month: 12, day: 31),
        expected: HrtDuration(HrtDurationUnit.months, 11),
      ),
      (
        description: 'leap year anniversary reads as 1 year',
        start: Date(year: 2024, month: 1, day: 1),
        today: Date(year: 2025, month: 1, day: 1),
        expected: HrtDuration(HrtDurationUnit.years, 1),
      ),
    ];

    for (final c in cases) {
      test(c.description, () {
        withFixedClock(
          () {
            // Act
            final result = hrtDurationSince(c.start);

            // Assert
            expect(result, c.expected);
          },
          at: DateTime(c.today.year, c.today.month, c.today.day, 12, 0),
        );
      });
    }
  });

  group('hrtDurationText', () {
    test('formats days', () {
      expect(hrtDurationText(const HrtDuration(HrtDurationUnit.days, 3)),
          t.onHrtForDays(count: 3));
    });

    test('formats weeks', () {
      expect(hrtDurationText(const HrtDuration(HrtDurationUnit.weeks, 2)),
          t.onHrtForWeeks(count: 2));
    });

    test('formats months', () {
      expect(hrtDurationText(const HrtDuration(HrtDurationUnit.months, 5)),
          t.onHrtForMonths(count: 5));
    });

    test('formats years', () {
      expect(hrtDurationText(const HrtDuration(HrtDurationUnit.years, 1)),
          t.onHrtForYears(count: 1));
    });
  });

  group('hrtWidgetDurationText', () {
    test('is null when there is no first taken date', () {
      final result = hrtWidgetDurationText(
        firstTakenLocalDate: null,
        intakeCounterEnabled: true,
      );

      expect(result, isNull);
    });

    test('is null when the intake counter is disabled', () {
      final result = hrtWidgetDurationText(
        firstTakenLocalDate: Date(year: 2026, month: 6, day: 1),
        intakeCounterEnabled: false,
      );

      expect(result, isNull);
    });

    test('formats the duration since the first taken date', () {
      withFixedClock(
        () {
          final result = hrtWidgetDurationText(
            firstTakenLocalDate: Date(year: 2026, month: 6, day: 1),
            intakeCounterEnabled: true,
          );

          expect(result, t.onHrtForDays(count: 2));
        },
        at: DateTime(2026, 6, 3, 12, 0),
      );
    });
  });
}
