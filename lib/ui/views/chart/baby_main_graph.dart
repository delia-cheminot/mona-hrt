import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BabyMainChartGraph extends StatelessWidget {
  final List<FlSpot> spots;

  final double? nowX;

  BabyMainChartGraph({required this.spots, this.nowX});
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
        extraLinesData: _nowLine(theme),
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
          if (nowX != null) _nowDotBar(theme),
        ],
      ),
    );
  }

  ExtraLinesData? _nowLine(ThemeData theme) {
    if (nowX == null) return null;

    return ExtraLinesData(
      verticalLines: [
        VerticalLine(
          x: nowX!,
          color: theme.colorScheme.tertiary,
          strokeWidth: 2,
          dashArray: [6, 4],
        ),
      ],
    );
  }

  LineChartBarData _nowDotBar(ThemeData theme) {
    return LineChartBarData(
      spots: [FlSpot(nowX!, _yAt(nowX!) ?? 0)],
      barWidth: 0,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(
          radius: 8,
          color: theme.colorScheme.tertiary,
        ),
      ),
    );
  }

  double? _yAt(double x) {
    for (var i = 0; i < spots.length - 1; i++) {
      final a = spots[i];
      final b = spots[i + 1];
      if (x >= a.x && x <= b.x) {
        if (b.x == a.x) return a.y;
        return a.y + (b.y - a.y) * (x - a.x) / (b.x - a.x);
      }
    }
    return null;
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
