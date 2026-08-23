import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartGraph extends StatelessWidget {
  final List<FlSpot> spots;
  final List<String> labels;

  BarChartGraph({required this.spots, required this.labels});

  static const double _barWidth = 18;
  static const double _groupsSpace = 12;
  static const double _bottomReservedSize = 52;
  static const double _leftReservedSize = 40;
  static const double _leftAxisWidth = 48;
  static const double _chartLeftInset = 8;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (spots.isEmpty) {
      return const SizedBox.shrink();
    }

    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final contentWidth = spots.isEmpty
        ? 0.0
        : spots.length * _barWidth + (spots.length - 1) * _groupsSpace;
    final chartWidth = math.max(
      MediaQuery.of(context).size.width,
      contentWidth + _chartLeftInset,
    );

    final yInterval = maxY <= 0 ? 1.0 : maxY / 4;

    return LayoutBuilder(
      builder: (context, constraints) {
        final height =
            constraints.maxHeight.isFinite ? constraints.maxHeight : 200.0;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: _leftAxisWidth,
              height: height,
              child: _buildLeftAxisLabels(context, maxY, yInterval),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: chartWidth,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: _chartLeftInset),
                    child: BarChart(
                      curve: Curves.easeOutQuad,
                      BarChartData(
                        maxY: maxY * 1.2,
                        alignment: BarChartAlignment.start,
                        groupsSpace: _groupsSpace,
                        barGroups: _buildBarGroups(spots, theme),
                        gridData: const FlGridData(
                          show: false,
                        ),
                        titlesData: _titlesData(context, labels),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLeftAxisLabels(
    BuildContext context,
    double maxY,
    double yInterval,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final labels = <double>[
      maxY * 1.2,
      yInterval * 3,
      yInterval * 2,
      yInterval,
      0,
    ];

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: labels
            .map(
              (value) => Text(
                value.toStringAsFixed(0),
                style: textTheme.labelSmall,
              ),
            )
            .toList(),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(
    List<FlSpot> entries,
    ThemeData theme,
  ) {
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
                gradient: _barsGradient(theme),
              ),
            ],
          ),
        )
        .toList();
  }

  LinearGradient _barsGradient(ThemeData theme) => LinearGradient(
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.secondary,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  FlTitlesData _titlesData(
    BuildContext context,
    List<String> labels,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: _bottomReservedSize,
          interval: 1,
          getTitlesWidget: (value, meta) {
            final index = value.toInt();
            if (index < 0 || index >= labels.length) {
              return const SizedBox.shrink();
            }

            return SideTitleWidget(
              meta: meta,
              space: 10,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Text(
                  labels[index],
                  style: textTheme.labelSmall,
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: _leftReservedSize,
        ),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }
}
