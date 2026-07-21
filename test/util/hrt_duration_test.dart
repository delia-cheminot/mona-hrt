import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/date.dart';
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
        description: '13 days stays in days',
        start: Date(year: 2026, month: 6, day: 1),
        today: Date(year: 2026, month: 6, day: 14),
        expected: HrtDuration(HrtDurationUnit.days, 13),
      ),
      (
        description: '14 days switches to weeks',
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
        description: '365 days switches to years',
        start: Date(year: 2025, month: 1, day: 1),
        today: Date(year: 2026, month: 1, day: 1),
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
}
