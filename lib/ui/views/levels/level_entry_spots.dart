import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:mona/data/model/level_entry.dart';

extension SpotPeak on List<FlSpot> {
  double get peakY => isEmpty ? 0 : map((spot) => spot.y).reduce(math.max);
}

extension LevelEntrySpots on List<LevelEntry> {
  List<FlSpot> toSpots() {
    if (isEmpty) return const [];
    final base = first.localDate;
    return map((entry) => FlSpot(
          entry.localDate.differenceInDays(base).toDouble(),
          entry.value.value.toDouble(),
        )).toList();
  }

  List<FlSpot> lastFiveSpots() => take(5).toList().reversed.toList().toSpots();
}
