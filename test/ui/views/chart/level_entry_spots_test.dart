import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/level_entry.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/ui/views/levels/level_entry_spots.dart';

LevelEntry _entry(int day, String value) => (
      localDate: Date(year: 2025, month: 1, day: day),
      value: UnitValue(Decimal.parse(value), EstradiolUnit.pg_mL),
    );

void main() {
  group('toSpots', () {
    test('returns an empty list for no entries', () {
      // Arrange
      final entries = <LevelEntry>[];

      // Act
      final spots = entries.toSpots();

      // Assert
      expect(spots, isEmpty);
    });

    test('maps each entry to a spot of (day offset from first, value)', () {
      // Arrange
      final entries = [
        _entry(1, '100.0'),
        _entry(3, '150.0'),
        _entry(6, '120.0'),
      ];

      // Act
      final spots = entries.toSpots();

      // Assert
      expect(spots.map((s) => (s.x, s.y)),
          [(0.0, 100.0), (2.0, 150.0), (5.0, 120.0)]);
    });
  });

  group('lastFiveSpots', () {
    test('takes the five newest entries, oldest first', () {
      // Arrange
      final entries = [
        _entry(6, '60.0'),
        _entry(5, '50.0'),
        _entry(4, '40.0'),
        _entry(3, '30.0'),
        _entry(2, '20.0'),
        _entry(1, '10.0'),
      ];

      // Act
      final spots = entries.lastFiveSpots();

      // Assert
      expect(spots.map((s) => (s.x, s.y)), [
        (0.0, 20.0),
        (1.0, 30.0),
        (2.0, 40.0),
        (3.0, 50.0),
        (4.0, 60.0),
      ]);
    });

    test('includes every entry when there are fewer than five', () {
      // Arrange
      final entries = [
        _entry(3, '30.0'),
        _entry(2, '20.0'),
        _entry(1, '10.0'),
      ];

      // Act
      final spots = entries.lastFiveSpots();

      // Assert
      expect(spots.map((s) => (s.x, s.y)),
          [(0.0, 10.0), (1.0, 20.0), (2.0, 30.0)]);
    });
  });
}
