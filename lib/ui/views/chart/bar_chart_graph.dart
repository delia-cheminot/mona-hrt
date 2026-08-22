import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';

class BarChartGraph extends StatelessWidget {
  final double window;
  BarChartGraph({required this.window});

  @override
  Widget build(BuildContext context) {
    final medicationIntakeProvider = context.watch<MedicationIntakeProvider>();
    final preferencesProvider = context.watch<PreferencesService>();
    final bloodTestProvider = context.watch<BloodTestProvider>();
    final theme = Theme.of(context);
    final unit = preferencesProvider.units.estradiol;
    final DateTime tMin = medicationIntakeProvider.getGraphLocalStart()!;
    List<GraphBloodTest> bloodTests =
        bloodTestProvider.getBloodTestsForGraph(tMin, unit);
    final List<FlSpot> bloodSpots =
        GraphCalculator().generateBloodSpots(bloodTests);

    if (medicationIntakeProvider.plottableIntakes.isEmpty) {
      return SizedBox.shrink();
    } else {
      return BarChart(
        BarChartData(
            barGroups: [
              BarChartGroupData(
                x: 0,
                barsSpace: 4,
                barRods: _buildBloodTestData(bloodSpots, theme),
              ),
            ],
            gridData: FlGridData(
              show: false,
            )),
      );
    }
  }

  List<BarChartRodData> _buildBloodTestData(
      List<FlSpot> bloodSpots, ThemeData theme) {
    return bloodSpots
        .map((i) => BarChartRodData(toY: i.y, color: theme.colorScheme.primary))
        .toList();
  }
}
