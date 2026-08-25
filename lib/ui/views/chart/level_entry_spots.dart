import 'package:fl_chart/fl_chart.dart';
import 'package:mona/data/model/level_entry.dart';

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
