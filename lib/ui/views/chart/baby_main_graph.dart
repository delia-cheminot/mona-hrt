import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BabyMainChartGraph extends StatelessWidget {
  final List<FlSpot> spots;

  BabyMainChartGraph({required this.spots});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (spots.isEmpty) {
      return const SizedBox.shrink();
    }
    return LineChart(
      LineChartData(
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: _titlesData(),
        lineTouchData: LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: theme.colorScheme.primary,
            barWidth: 2,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: theme.colorScheme.primary.withValues(alpha: 0.24),
            ),
          ),
        ],
      ),
    );
  }

  FlTitlesData _titlesData() => FlTitlesData(
        show: true,
        bottomTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );
}
