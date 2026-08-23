import 'package:mona/data/model/intake_slot.dart';
import 'package:mona/data/model/scheduling_strategy.dart';

({
  List<IntakeSlot> today,
  List<IntakeSlot> asNeeded,
  List<IntakeSlot> upcoming,
}) splitByDay(List<IntakeSlot> occurrences) {
  final overdueToday = <IntakeSlot>[];
  final otherToday = <IntakeSlot>[];
  final asNeeded = <IntakeSlot>[];
  final upcoming = <IntakeSlot>[];

  for (final occurrence in occurrences) {
    if (occurrence.status == ScheduleStatus.upcoming) {
      upcoming.add(occurrence);
    } else if (occurrence.status == ScheduleStatus.overdue ||
        occurrence.status == ScheduleStatus.todayOverdue) {
      overdueToday.add(occurrence);
    } else if (occurrence.status == ScheduleStatus.asNeeded) {
      asNeeded.add(occurrence);
    } else {
      otherToday.add(occurrence);
    }
  }

  otherToday.sort(_byTimeNullsFirst);

  return (
    today: [...overdueToday, ...otherToday],
    asNeeded: asNeeded,
    upcoming: upcoming,
  );
}

int _byTimeNullsFirst(IntakeSlot a, IntakeSlot b) {
  final at = a.time;
  final bt = b.time;
  if (at == null && bt == null) return 0;
  if (at == null) return -1;
  if (bt == null) return 1;
  final hourCompare = at.hour.compareTo(bt.hour);
  return hourCompare != 0 ? hourCompare : at.minute.compareTo(bt.minute);
}
