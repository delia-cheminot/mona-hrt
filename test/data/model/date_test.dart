import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:mona/data/model/date.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';

import '../../util/test_clock.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en');
    tz.initializeTimeZones();
  });

  group('Date', () {
    group('constructor', () {
      test('builds a UTC midnight value from year/month/day', () {
        // Act
        final date = Date(year: 2026, month: 3, day: 30);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 30));
      });

      test('defaults month and day to 1', () {
        // Act
        final date = Date(year: 2026);

        // Assert
        expect(date.value, DateTime.utc(2026, 1, 1));
      });
    });

    group('Date.fromUtc', () {
      test('throws if value is not UTC', () {
        // Arrange
        final invalidDate = DateTime(2026, 3, 30, 12, 0);

        // Act & Assert
        expect(() => Date.fromUtc(invalidDate), throwsArgumentError);
      });

      test('throws if value is not at midnight', () {
        // Arrange
        final invalidDate = DateTime.utc(2026, 3, 30, 12, 0);

        // Act & Assert
        expect(() => Date.fromUtc(invalidDate), throwsArgumentError);
      });

      test('accepts valid UTC midnight date', () {
        // Arrange
        final validDate = DateTime.utc(2026, 3, 30);

        // Act
        final date = Date.fromUtc(validDate);

        // Assert
        expect(date.value, validDate);
      });
    });

    group('Date.fromDateTime', () {
      test('3:59am belongs to the previous day', () {
        // Arrange
        final input = DateTime(2026, 3, 30, 3, 59);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 29));
      });

      test('4:00am belongs to the current day', () {
        // Arrange
        final input = DateTime(2026, 3, 30, 4, 0);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 30));
      });

      test('midnight belongs to the previous day', () {
        // Arrange
        final input = DateTime(2026, 3, 30, 0, 0);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 29));
      });

      test('noon belongs to the current day', () {
        // Arrange
        final input = DateTime(2026, 3, 30, 12, 0);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 30));
      });

      test('3:59am on the 1st rolls back to the last day of the previous month',
          () {
        // Arrange
        final input = DateTime(2026, 3, 1, 3, 59);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 2, 28));
      });

      test('3:59am on Jan 1st rolls back to Dec 31st of the previous year', () {
        // Arrange
        final input = DateTime(2026, 1, 1, 3, 59);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2025, 12, 31));
      });
    });

    group('Date.fromDateTime with a custom start-of-day (4:30am)', () {
      setUp(() => logicalDayStartMinutes = 270);
      tearDown(() => logicalDayStartMinutes = 240);

      test('4:29am belongs to the previous day', () {
        // Arrange
        final input = DateTime(2026, 3, 30, 4, 29);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 29));
      });

      test('4:30am belongs to the current day', () {
        // Arrange
        final input = DateTime(2026, 3, 30, 4, 30);

        // Act
        final date = Date.fromDateTime(input);

        // Assert
        expect(date.value, DateTime.utc(2026, 3, 30));
      });
    });

    group('toDateTimeAt with a custom start-of-day (4:30am)', () {
      setUp(() => logicalDayStartMinutes = 270);
      tearDown(() => logicalDayStartMinutes = 240);

      test('a time before the start rolls to the next calendar day', () {
        // Arrange
        final date = Date(year: 2026, month: 3, day: 30);

        // Act
        final result = date.toDateTimeAt(const TimeOfDay(hour: 4, minute: 29));

        // Assert
        expect(result, DateTime(2026, 3, 31, 4, 29));
      });

      test('a time at the start stays on the same calendar day', () {
        // Arrange
        final date = Date(year: 2026, month: 3, day: 30);

        // Act
        final result = date.toDateTimeAt(const TimeOfDay(hour: 4, minute: 30));

        // Assert
        expect(result, DateTime(2026, 3, 30, 4, 30));
      });
    });

    group('Date.fromString / toString', () {
      test('round-trip preserves the date', () {
        // Arrange
        final original = Date.fromDateTime(DateTime(2026, 3, 30, 12, 0));

        // Act
        final restored = Date.fromString(original.toString());

        // Assert
        expect(restored, original);
      });

      test('throws if string is not UTC midnight', () {
        // Arrange
        final invalidString = '2026-03-30T12:00:00Z';

        // Act & Assert
        expect(() => Date.fromString(invalidString), throwsArgumentError);
      });

      test('throws if string is not in ISO format', () {
        // Arrange
        final invalidString = '03/30/2026';

        // Act & Assert
        expect(() => Date.fromString(invalidString), throwsFormatException);
      });
    });

    group('DateTime/String toDate extensions', () {
      test('DateTime.toDate matches Date.fromDateTime at 3:59 boundary', () {
        final input = DateTime(2026, 3, 30, 3, 59);
        expect(input.toDate, Date.fromDateTime(input));
      });

      test('DateTime.toDate matches Date.fromDateTime at noon', () {
        final input = DateTime(2026, 3, 30, 12, 0);
        expect(input.toDate, Date.fromDateTime(input));
      });

      test('String.toDate round-trips Date.toString', () {
        final date = Date.fromDateTime(DateTime(2026, 3, 30, 12, 0));
        expect(date.toString().toDate, date);
      });

      test('String.toDate throws like Date.fromString when not UTC midnight',
          () {
        expect(
          () => '2026-03-30T12:00:00Z'.toDate,
          throwsArgumentError,
        );
      });
    });

    group('today', () {
      test('Date.today() is the current logical day after 4am', () {
        withFixedClock(() {
          // Act & Assert
          expect(Date.today(), Date(year: 2026, month: 6, day: 1));
        }, at: DateTime(2026, 6, 1, 12, 0));
      });

      test('Date.today() rolls back to the previous day before 4am', () {
        withFixedClock(() {
          // Act & Assert
          expect(Date.today(), Date(year: 2026, month: 5, day: 31));
        }, at: DateTime(2026, 6, 1, 3, 0));
      });

      test('isToday is true for today', () {
        withFixedClock(() {
          // Arrange
          final today = Date.today();

          // Act & Assert
          expect(today.isToday, isTrue);
        });
      });

      test('isToday is false for dates other than today', () {
        withFixedClock(() {
          // Arrange
          final yesterday = Date.fromDateTime(
            clock.now().subtract(const Duration(days: 1)),
          );

          // Act & Assert
          expect(yesterday.isToday, isFalse);
        });
      });
    });

    group('differenceInDays', () {
      test('difference between two identical dates is 0', () {
        // Arrange
        final a = Date.fromDateTime(DateTime(2026, 3, 30, 12, 0));
        final b = Date.fromDateTime(DateTime(2026, 3, 30, 14, 0));

        // Act
        final diff = a.differenceInDays(b);

        // Assert
        expect(diff, 0);
      });

      test('difference between two dates is correct', () {
        // Arrange
        final a = Date.fromDateTime(DateTime(2026, 3, 30, 12, 0));
        final b = Date.fromDateTime(DateTime(2026, 3, 28, 12, 0));

        // Act & Assert
        expect(a.differenceInDays(b), 2);
      });

      test('difference across a DST change is still 1', () {
        // Arrange — France switches to summer time on March 29 2026 at 2am
        final paris = getLocation('Europe/Paris');
        final before = Date.fromDateTime(TZDateTime(paris, 2026, 3, 28, 12, 0));
        final after = Date.fromDateTime(TZDateTime(paris, 2026, 3, 29, 12, 0));

        // Act
        final diff = after.differenceInDays(before);

        // Assert
        expect(diff, 1);
      });
    });

    group('daysAwayFromToday', () {
      test('today is 0 days away', () {
        withFixedClock(() {
          // Arrange
          final today = Date.today();

          // Act & Assert
          expect(today.daysAwayFromToday, 0);
        });
      });

      test('yesterday and tomorrow are both 1 day away', () {
        withFixedClock(() {
          // Arrange
          final now = clock.now();
          final yesterday =
              Date.fromDateTime(now.subtract(const Duration(days: 1)));
          final tomorrow = Date.fromDateTime(now.add(const Duration(days: 1)));

          // Act & Assert
          expect(yesterday.daysAwayFromToday, 1);
          expect(tomorrow.daysAwayFromToday, 1);
        });
      });
    });

    group('position relative to today', () {
      test('isBeforeToday is true for past dates', () {
        // Arrange
        final yesterday = Date.today().subtract(const Duration(days: 1));

        // Act & Assert
        expect(yesterday.isBeforeToday, isTrue);
      });

      test('isBeforeToday is false for today and future dates', () {
        // Arrange
        final today = Date.today();
        final tomorrow = Date.today().add(const Duration(days: 1));

        // Act & Assert
        expect(
            [today.isBeforeToday, tomorrow.isBeforeToday], [isFalse, isFalse]);
      });

      test('isAfterToday is true for future dates', () {
        // Arrange
        final tomorrow = Date.today().add(const Duration(days: 1));

        // Act & Assert
        expect(tomorrow.isAfterToday, isTrue);
      });

      test('isAfterToday is false for today and past dates', () {
        // Arrange
        final today = Date.today();
        final yesterday = Date.today().subtract(const Duration(days: 1));

        // Act & Assert
        expect(
            [today.isAfterToday, yesterday.isAfterToday], [isFalse, isFalse]);
      });
    });

    group('isBefore, isAfter, isSameDayAs', () {
      group('isSameDayAs', () {
        final cases = [
          (
            description: 'same day',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 15),
            expected: true,
          ),
          (
            description: 'different day',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 16),
            expected: false,
          ),
        ];

        for (final c in cases) {
          test(c.description, () {
            final result = c.a.isSameDayAs(c.b);
            expect(result, c.expected);
          });
        }
      });

      group('isBefore', () {
        final cases = [
          (
            description: 'date is before other',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 16),
            expected: true,
          ),
          (
            description: 'date is after other',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 14),
            expected: false,
          ),
          (
            description: 'same day',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 15),
            expected: false,
          ),
        ];

        for (final c in cases) {
          test(c.description, () {
            final result = c.a.isBefore(c.b);
            expect(result, c.expected);
          });
        }
      });

      group('isAfter', () {
        final cases = [
          (
            description: 'date is after other',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 14),
            expected: true,
          ),
          (
            description: 'date is before other',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 16),
            expected: false,
          ),
          (
            description: 'same day',
            a: Date(year: 2024, month: 6, day: 15),
            b: Date(year: 2024, month: 6, day: 15),
            expected: false,
          ),
        ];

        for (final c in cases) {
          test(c.description, () {
            final result = c.a.isAfter(c.b);
            expect(result, c.expected);
          });
        }
      });
    });

    group('add and subtract', () {
      test('adding a duration results in the correct date', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final newDate = date.add(const Duration(days: 5));

        // Assert
        expect(newDate.value, DateTime.utc(2024, 6, 20));
      });

      test('subtracting a duration results in the correct date', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final newDate = date.subtract(const Duration(days: 10));

        // Assert
        expect(newDate.value, DateTime.utc(2024, 6, 5));
      });
    });

    group('addMonths', () {
      test('adds months within the same year', () {
        // Arrange
        final date = Date(year: 2026, month: 3, day: 21);

        // Act
        final result = date.addMonths(3);

        // Assert
        expect(result, Date(year: 2026, month: 6, day: 21));
      });

      test('rolls over into the next year', () {
        // Arrange
        final date = Date(year: 2026, month: 11, day: 21);

        // Act
        final result = date.addMonths(3);

        // Assert
        expect(result, Date(year: 2027, month: 2, day: 21));
      });

      test('subtracts months with a negative argument', () {
        // Arrange
        final date = Date(year: 2026, month: 1, day: 21);

        // Act
        final result = date.addMonths(-2);

        // Assert
        expect(result, Date(year: 2025, month: 11, day: 21));
      });

      test('preserves the day of month', () {
        // Arrange
        final date = Date(year: 2026, month: 1, day: 28);

        // Act
        final result = date.addMonths(1);

        // Assert
        expect(result.day, 28);
      });
    });

    group('differenceInMonths', () {
      final cases = [
        (
          description: 'identical dates are 0 months apart',
          a: Date(year: 2025, month: 1, day: 1),
          b: Date(year: 2025, month: 1, day: 1),
          expected: 0,
        ),
        (
          description: 'counts whole months within a year',
          a: Date(year: 2025, month: 1, day: 1),
          b: Date(year: 2025, month: 12, day: 15),
          expected: 11,
        ),
        (
          description: 'does not count a partial final month',
          a: Date(year: 2025, month: 1, day: 31),
          b: Date(year: 2025, month: 5, day: 30),
          expected: 3,
        ),
        (
          description: 'is unsigned regardless of argument order',
          a: Date(year: 2025, month: 12, day: 15),
          b: Date(year: 2025, month: 1, day: 1),
          expected: 11,
        ),
        (
          description: 'counts across a year boundary',
          a: Date(year: 2025, month: 1, day: 1),
          b: Date(year: 2026, month: 1, day: 1),
          expected: 12,
        ),
      ];

      for (final c in cases) {
        test(c.description, () {
          // Act
          final result = c.a.differenceInMonths(c.b);

          // Assert
          expect(result, c.expected);
        });
      }
    });

    group('differenceInYears', () {
      final cases = [
        (
          description: 'less than a year is 0',
          a: Date(year: 2025, month: 1, day: 1),
          b: Date(year: 2025, month: 12, day: 31),
          expected: 0,
        ),
        (
          description: 'exactly one year is 1',
          a: Date(year: 2025, month: 1, day: 1),
          b: Date(year: 2026, month: 1, day: 1),
          expected: 1,
        ),
        (
          description: 'partial final year does not count',
          a: Date(year: 2025, month: 6, day: 1),
          b: Date(year: 2027, month: 5, day: 1),
          expected: 1,
        ),
      ];

      for (final c in cases) {
        test(c.description, () {
          // Act
          final result = c.a.differenceInYears(c.b);

          // Assert
          expect(result, c.expected);
        });
      }
    });

    group('export', () {
      test('toDateTime returns a DateTime at noon of the same day', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final dateTime = date.toDateTime();

        // Assert
        expect(dateTime, DateTime(2024, 6, 15, 12));
      });

      test('toUtcDateTime returns the original UTC DateTime value', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final utcDateTime = date.toUtcDateTime();

        // Assert
        expect(utcDateTime, DateTime.utc(2024, 6, 15));
      });

      test('toString returns the ISO string representation of the date', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final string = date.toString();

        // Assert
        expect(string, '2024-06-15T00:00:00.000Z');
      });
    });

    group('format', () {
      test('formats date with yMMMd', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final formatted = date.format(DateFormat.yMMMd('en'));

        // Assert
        expect(formatted,
            DateFormat.yMMMd('en').format(DateTime.utc(2024, 6, 15)));
      });

      test('formats date with a custom pattern', () {
        // Arrange
        final date = Date(year: 2024, month: 6, day: 15);

        // Act
        final formatted = date.format(DateFormat('dd/MM/yyyy', 'en'));

        // Assert
        expect(formatted, '15/06/2024');
      });
    });
  });
}
