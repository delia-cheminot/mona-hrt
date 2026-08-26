import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData> buildBarGroups(
  List<FlSpot> spots, {
  required double barWidth,
  required int? highlightedIndex,
  required Color barColor,
  required Color highlightColor,
}) {
  return spots
      .asMap()
      .entries
      .map(
        (entry) => BarChartGroupData(
          x: entry.key,
          barRods: [
            BarChartRodData(
              toY: entry.value.y,
              width: barWidth,
              color: entry.key == highlightedIndex ? highlightColor : barColor,
            ),
          ],
        ),
      )
      .toList();
}
