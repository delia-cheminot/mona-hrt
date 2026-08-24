import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BabyBarChartGraph extends StatelessWidget {
  final List<FlSpot> spots;

  BabyBarChartGraph({required this.spots});

  static const double _barWidth = 10;
  static const double _groupsSpace = 12;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (spots.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    return SizedBox(
      height: 48,
      width: 96,
      child: BarChart(
        curve: Curves.easeOutQuad,
        BarChartData(
          maxY: maxY * 1.1,
          alignment: BarChartAlignment.start,
          groupsSpace: _groupsSpace,
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
                width: _barWidth,
                color: entry.key == lastIndex
                    ? theme.colorScheme.tertiary
                    // light gray
                    : theme.colorScheme.secondaryFixed,
              ),
            ],
          ),
        )
        .toList();
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
