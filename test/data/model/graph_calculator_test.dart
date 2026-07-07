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
      expect(calculator.totalConcentrationAtTime(-1.0, [intakeAt(0.0)], unit),
          0.0);
    });

    test('is zero at the injection offset', () {
      expect(
          calculator.totalConcentrationAtTime(0.0, [intakeAt(0.0)], unit), 0.0);
    });

    test('is positive within the active window', () {
      expect(calculator.totalConcentrationAtTime(2.0, [intakeAt(0.0)], unit),
          greaterThan(0.0));
    });

    test('is zero at the end of the inactive window (100 days)', () {
      expect(calculator.totalConcentrationAtTime(100.0, [intakeAt(0.0)], unit),
          0.0);
    });

    test('is zero past the inactive window', () {
      expect(calculator.totalConcentrationAtTime(150.0, [intakeAt(0.0)], unit),
          0.0);
    });

    test('returns zero for an empty intake list', () {
      expect(calculator.totalConcentrationAtTime(2.0, [], unit), 0.0);
    });

    test('a fractional offset shifts the curve by exactly that amount', () {
      final shifted =
          calculator.totalConcentrationAtTime(2.5, [intakeAt(0.5)], unit);
      final base =
          calculator.totalConcentrationAtTime(2.0, [intakeAt(0.0)], unit);

      expect(shifted, closeTo(base, 1e-9));
    });

    test('sums the contribution of multiple injections', () {
      final single =
          calculator.totalConcentrationAtTime(2.0, [intakeAt(0.0)], unit);
      final two = calculator.totalConcentrationAtTime(
          2.0, [intakeAt(0.0), intakeAt(0.0)], unit);

      expect(two, closeTo(2 * single, 1e-6));
    });
  });

  group('generateLevelsSpots', () {
    test('returns an empty list for no intakes', () {
      expect(calculator.generateLevelsSpots([], unit), isEmpty);
    });

    test('produces numPoints + 1 spots', () {
      final spots =
          calculator.generateLevelsSpots([intakeAt(0.0)], unit, numPoints: 10);

      expect(spots.length, 11);
    });

    test('spans up to maxOffset + tMaxOffset', () {
      final spots = calculator.generateLevelsSpots(
          [intakeAt(0.0), intakeAt(3.5)], unit,
          numPoints: 10);

      expect(spots.last.x, closeTo(3.5 + GraphCalculator.tMaxOffset, 1e-9));
    });
  });

  group('generateBloodSpots', () {
    test('returns an empty list for no blood tests', () {
      expect(calculator.generateBloodSpots([]), isEmpty);
    });

    test('maps each blood test to a spot at (offset, level)', () {
      final spots = calculator.generateBloodSpots(
          const [GraphBloodTest(offset: 1.5, level: 120.0)]);

      expect(
          spots.single,
          isA<FlSpot>()
              .having((s) => s.x, 'x', 1.5)
              .having((s) => s.y, 'y', 120.0));
    });
  });
}
