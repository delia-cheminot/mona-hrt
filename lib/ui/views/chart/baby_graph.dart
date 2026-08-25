import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mona/ui/views/chart/bar_groups.dart';

class BabyBarChartGraph extends StatelessWidget {
  final List<FlSpot> spots;

  BabyBarChartGraph({required this.spots});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (spots.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 48,
      width: 96,
      child: BarChart(
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
            barColor: theme.colorScheme.secondaryContainer,
            highlightColor: theme.colorScheme.tertiary,
          ),
          gridData: const FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
