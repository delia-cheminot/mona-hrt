import 'dart:math' as math;

import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/units.dart';

class GraphIntake {
  final double dose;
  final Ester ester;
  final double time; // in days

  const GraphIntake({
    required this.dose,
    required this.ester,
    required this.time,
  });
}

class GraphBloodTest {
  final double level;
  final double offset;

  const GraphBloodTest({
    required this.level,
    required this.offset,
  });
}

class GraphCalculator {
  static const double tMaxOffset = 40.0;
  static const double _inactiveWindow = 100.0;
  // Inferred with love exclusively for Mona
  //                - alix, WHSAH Collective
  static final Map<Ester, Map<String, double>> _pkparams = {
    Ester.enanthate: {
      "F": 0.708,
      "auc": 875.4,
      "k1": 0.09441,
      "k2": 3.354,
      "k3": 0.4078,
    },
    Ester.valerate: {
      "F": 0.764,
      "auc": 621.3,
      "k1": 0.2230,
      "k2": 17.62,
      "k3": 1.305,
    },
    Ester.benzoate: {
      "F": 0.723,
      "auc": 889.9,
      "k1": 0.5220,
      "k2": 521.9,
      "k3": 5.223,
    },
    Ester.cypionate: {
      "F": 0.687,
      "auc": 554.5,
      "k1": 0.0880,
      "k2": 17.95,
      "k3": 0.7177,
    },
    Ester.cypionateSuspension: {
      "F": 0.687,
      "auc": 852.6,
      "k1": 0.0973,
      "k2": 218.67,
      "k3": 6.624,
    },
    Ester.undecylate: {
      "F": 0.618,
      "auc": 385.8,
      "k1": 0.02189,
      "k2": 183.4,
      "k3": 1.564,
    },
  };

  Map<String, double> getPKParams(GraphIntake intake) {
    return _pkparams[intake.ester] ?? _pkparams[Ester.enanthate]!;
  }

  double _singleIntakeConcentration(double t, GraphIntake intake) {
    final time = intake.time;

    if (t <= time || t >= time + _inactiveWindow) return 0.0;

    Map<String, double> pkparams = getPKParams(intake);

    final f = pkparams["F"]!;
    final auc = pkparams["auc"]!;
    final k1 = pkparams["k1"]!;
    final k2 = pkparams["k2"]!;
    final k3 = pkparams["k3"]!;

    double part1 = math.exp(-k1 * (t - time)) / ((k1 - k2) * (k1 - k3));
    double part2 = math.exp(-k2 * (t - time)) / ((k1 - k2) * (k2 - k3));
    double part3 = math.exp(-k3 * (t - time)) / ((k1 - k3) * (k2 - k3));

    double concentration =
        intake.dose * f * auc * k1 * k2 * k3 * (part1 - part2 + part3);
    return concentration;
  }

  double totalConcentrationAtTime(
      double t, List<GraphIntake> intakes, EstradiolUnit unit) {
    if (intakes.isEmpty) return 0.0;

    final concentration = intakes
        .map((intake) => _singleIntakeConcentration(t, intake))
        .fold(0.0, (sum, val) => sum + val);
    return EstradiolUnit.pg_mL
        .convert(Decimal.parse(concentration.toStringAsFixed(2)), unit)
        .toDouble();
  }

  List<FlSpot> generateLevelsSpots(
      List<GraphIntake> intakes, EstradiolUnit unit,
      {double tMin = 0, int numPoints = 1000}) {
    if (intakes.isEmpty) return <FlSpot>[];

    final double tMax =
        intakes.map((i) => i.time).reduce(math.max) + tMaxOffset;
    final List<math.Point> points = [];

    for (int i = 0; i <= numPoints; i++) {
      final t = tMin + ((tMax - tMin) / numPoints) * i;
      final concentration = totalConcentrationAtTime(t, intakes, unit);
      points.add(math.Point(t, concentration));
    }

    return points.map((p) => FlSpot(p.x.toDouble(), p.y.toDouble())).toList();
  }

  List<FlSpot> generateBloodSpots(List<GraphBloodTest> bloodTests) {
    if (bloodTests.isEmpty) return <FlSpot>[];

    return bloodTests
        .map((bloodTest) => FlSpot(bloodTest.offset, bloodTest.level))
        .toList();
  }
}
