import 'package:clock/clock.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/providers/today_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('today is the current logical day at construction', () {
    // Arrange
    final now = DateTime(2026, 6, 1, 12, 0);
    withClock(Clock(() => now), () {
      // Act
      final provider = TodayProvider();
      // Assert
      expect(provider.today, Date(year: 2026, month: 6, day: 1));
      provider.dispose();
    });
  });

  group('on resume', () {
    final cases = [
      (
        name: 'updates today when the day has changed',
        resumeAt: DateTime(2026, 6, 2, 12, 0),
        expected: Date(year: 2026, month: 6, day: 2),
      ),
      (
        name: 'keeps today when still the same day',
        resumeAt: DateTime(2026, 6, 1, 18, 0),
        expected: Date(year: 2026, month: 6, day: 1),
      ),
    ];

    for (final c in cases) {
      test(c.name, () {
        // Arrange
        var now = DateTime(2026, 6, 1, 12, 0);
        withClock(Clock(() => now), () {
          final provider = TodayProvider();
          // Act
          now = c.resumeAt;
          provider.didChangeAppLifecycleState(AppLifecycleState.resumed);
          // Assert
          expect(provider.today, c.expected);
          provider.dispose();
        });
      });
    }
  });

  test('notifies listeners when the day changes on resume', () {
    // Arrange
    var now = DateTime(2026, 6, 1, 12, 0);
    withClock(Clock(() => now), () {
      final provider = TodayProvider();
      var notifications = 0;
      provider.addListener(() => notifications++);
      // Act
      now = DateTime(2026, 6, 2, 12, 0);
      provider.didChangeAppLifecycleState(AppLifecycleState.resumed);
      // Assert
      expect(notifications, 1);
      provider.dispose();
    });
  });

  test('does not notify when the day is the same on resume', () {
    // Arrange
    var now = DateTime(2026, 6, 1, 12, 0);
    withClock(Clock(() => now), () {
      final provider = TodayProvider();
      var notifications = 0;
      provider.addListener(() => notifications++);
      // Act
      now = DateTime(2026, 6, 1, 18, 0);
      provider.didChangeAppLifecycleState(AppLifecycleState.resumed);
      // Assert
      expect(notifications, 0);
      provider.dispose();
    });
  });
}
