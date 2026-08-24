import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartGraph extends StatelessWidget {
  final List<FlSpot> spots;
  final List<String> labels;
  final String unit;

  BarChartGraph(
      {required this.spots, required this.labels, required this.unit});

  static const double _barWidth = 18;
  static const double _groupsSpace = 12;
  static const double _bottomReservedSize = 52;
  static const double _chartInset = 40;

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

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final neededWidth = contentWidth + _chartInset * 2;
        final shouldScroll = neededWidth > availableWidth;
        final chartWidth = shouldScroll ? neededWidth : availableWidth;

        final chart = SizedBox(
          width: chartWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              left: _chartInset,
              right: _chartInset,
            ),
            child: BarChart(
              curve: Curves.easeOutQuad,
              BarChartData(
                maxY: maxY,
                alignment: BarChartAlignment.start,
                groupsSpace: _groupsSpace,
                barTouchData: _touchData(theme),
                barGroups: _buildBarGroups(spots, theme),
                gridData: const FlGridData(
                  show: false,
                ),
                titlesData: _titlesData(context, labels),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        );

        if (!shouldScroll) {
          return chart;
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          child: chart,
        );
      },
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

  BarTouchData _touchData(ThemeData theme) => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => theme.colorScheme.tertiaryContainer,
          tooltipBorderRadius: BorderRadius.circular(8),
          fitInsideVertically: true,
          getTooltipItem: (
            group,
            groupIndex,
            rod,
            rodIndex,
          ) {
            return BarTooltipItem(
              '${rod.toY}\n$unit',
              TextStyle(color: theme.colorScheme.onTertiaryContainer),
            );
          },
        ),
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
      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
