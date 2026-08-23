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

    final minX = spots.map((e) => e.x).reduce((a, b) => a < b ? a : b);
    final maxX = spots.map((e) => e.x).reduce((a, b) => a > b ? a : b);
    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final xPadding = minX == maxX ? 1.0 : (maxX - minX) * 0.1;
    final yPadding = maxY <= 0 ? 1.0 : maxY * 0.15;
    return SizedBox(
      height: 200,
      width: 96,
      child: LineChart(
        LineChartData(
          minX: minX - xPadding,
          maxX: maxX + xPadding,
          minY: 0,
          maxY: maxY + yPadding,
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
