import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartGraph extends StatelessWidget {
  final List<FlSpot> spots;
  BarChartGraph({required this.spots});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (spots.isEmpty) {
      return SizedBox.shrink();
    } else {
      return BarChart(
        BarChartData(
            barGroups: [
              BarChartGroupData(
                x: 0,
                barsSpace: 4,
                barRods: _buildBloodTestData(spots, theme),
              ),
            ],
            gridData: FlGridData(
              show: false,
            )),
      );
    }
  }

  List<BarChartRodData> _buildBloodTestData(
      List<FlSpot> entries, ThemeData theme) {
    return entries
        .map((i) => BarChartRodData(toY: i.y, color: theme.colorScheme.primary))
        .toList();
  }
}
