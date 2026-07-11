import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/model/units.dart';

void main() {
  final calculator = GraphCalculator();
  const unit = EstradiolUnit.pg_mL;

  GraphIntake intakeAt(double offsetDays, {double dose = 5.0}) => GraphIntake(
        dose: dose,
        ester: Ester.valerate,
        time: offsetDays,
      );

  group('totalConcentrationAtTime', () {
    test('is zero before the injection offset', () {
      // Act
      final concentration =
          calculator.totalConcentrationAtTime(-1.0, [intakeAt(0.0)], unit);

      // Assert
      expect(concentration, 0.0);
    });

    test('is zero at the injection offset', () {
      // Act
      final concentration =
          calculator.totalConcentrationAtTime(0.0, [intakeAt(0.0)], unit);

      // Assert
      expect(concentration, 0.0);
    });

    test('is positive within the active window', () {
      // Act
      final concentration =
          calculator.totalConcentrationAtTime(2.0, [intakeAt(0.0)], unit);

      // Assert
      expect(concentration, greaterThan(0.0));
    });

    test('is zero at the end of the inactive window (100 days)', () {
      // Act
      final concentration =
          calculator.totalConcentrationAtTime(100.0, [intakeAt(0.0)], unit);

      // Assert
      expect(concentration, 0.0);
    });

    test('is zero past the inactive window', () {
      // Act
      final concentration =
          calculator.totalConcentrationAtTime(150.0, [intakeAt(0.0)], unit);

      // Assert
      expect(concentration, 0.0);
    });

    test('returns zero for an empty intake list', () {
      // Act
      final concentration = calculator.totalConcentrationAtTime(2.0, [], unit);

      // Assert
      expect(concentration, 0.0);
    });

    test('a fractional offset shifts the curve by exactly that amount', () {
      // Act
      final shifted =
          calculator.totalConcentrationAtTime(2.5, [intakeAt(0.5)], unit);
      final base =
          calculator.totalConcentrationAtTime(2.0, [intakeAt(0.0)], unit);

      // Assert
      expect(shifted, closeTo(base, 1e-9));
    });

    test('sums the contribution of multiple injections', () {
      // Act
      final single =
          calculator.totalConcentrationAtTime(2.0, [intakeAt(0.0)], unit);
      final two = calculator.totalConcentrationAtTime(
          2.0, [intakeAt(0.0), intakeAt(0.0)], unit);

      // Assert
      expect(two, closeTo(2 * single, 1e-6));
    });
  });

  group('generateLevelsSpots', () {
    test('returns an empty list for no intakes', () {
      // Act
      final spots = calculator.generateLevelsSpots([], unit);

      // Assert
      expect(spots, isEmpty);
    });

    test('produces numPoints + 1 spots', () {
      // Act
      final spots =
          calculator.generateLevelsSpots([intakeAt(0.0)], unit, numPoints: 10);

      // Assert
      expect(spots.length, 11);
    });

    test('spans up to maxOffset + tMaxOffset', () {
      // Act
      final spots = calculator.generateLevelsSpots(
          [intakeAt(0.0), intakeAt(3.5)], unit,
          numPoints: 10);

      // Assert
      expect(spots.last.x, closeTo(3.5 + GraphCalculator.tMaxOffset, 1e-9));
    });
  });

  group('generateBloodSpots', () {
    test('returns an empty list for no blood tests', () {
      // Act
      final spots = calculator.generateBloodSpots([]);

      // Assert
      expect(spots, isEmpty);
    });

    test('maps each blood test to a spot at (offset, level)', () {
      // Act
      final spots = calculator.generateBloodSpots(
          const [GraphBloodTest(offset: 1.5, level: 120.0)]);

      // Assert
      expect(
          spots.single,
          isA<FlSpot>()
              .having((s) => s.x, 'x', 1.5)
              .having((s) => s.y, 'y', 120.0));
    });
  });
}
