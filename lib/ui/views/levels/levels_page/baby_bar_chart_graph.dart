import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mona/ui/views/levels/bar_groups.dart';

class BabyBarChartGraph extends StatelessWidget {
  final List<FlSpot> spots;

  BabyBarChartGraph({required this.spots});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (spots.isEmpty) {
      return const SizedBox.shrink();
    }

    return BarChart(
      curve: Curves.easeOutQuad,
      BarChartData(
        maxY: spots.map((e) => e.y).reduce((a, b) => a > b ? a : b),
        alignment: BarChartAlignment.spaceEvenly,
        groupsSpace: 10,
        barTouchData: BarTouchData(enabled: false),
        barGroups: buildBarGroups(
          spots,
          barWidth: 10,
          highlightedIndex: spots.length - 1,
          barColor: theme.colorScheme.surfaceContainerHighest,
          highlightColor: theme.colorScheme.primary,
        ),
        gridData: const FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
