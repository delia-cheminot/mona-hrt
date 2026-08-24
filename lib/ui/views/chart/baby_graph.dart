import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
          alignment: BarChartAlignment.start,
          groupsSpace: 12,
          barTouchData: BarTouchData(enabled: false),
          barGroups: _buildBarGroups(spots, theme),
          gridData: const FlGridData(
            show: false,
          ),
          titlesData: _titlesData(),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(
    List<FlSpot> entries,
    ThemeData theme,
  ) {
    final lastIndex = entries.length - 1;
    return entries
        .asMap()
        .entries
        .map(
          (entry) => BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.y,
                width: 10,
                color: entry.key == lastIndex
                    ? theme.colorScheme.tertiary
                    : theme.colorScheme.secondaryContainer,
              ),
            ],
          ),
        )
        .toList();
  }

  FlTitlesData _titlesData() => FlTitlesData(show: false);
}
