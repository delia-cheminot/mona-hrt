import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/scheduled_occurrence.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/ui/views/home/split_by_day.dart';

MedicationSchedule schedule({int id = 1}) => MedicationSchedule(
      id: id,
      name: 'Med',
      dose: Decimal.one,
      scheduling: IntervalDaysSchedule(intervalDays: 1),
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.oral,
    );

IntakeSlot occurrence({
  MedicationSchedule? schedule,
  ScheduleStatus status = ScheduleStatus.today,
  TimeOfDay? time,
}) =>
    IntakeSlot(
      schedule: schedule ??
          MedicationSchedule(
            id: 0,
            name: 'Med',
            dose: Decimal.one,
            scheduling: IntervalDaysSchedule(intervalDays: 1),
            molecule: KnownMolecules.estradiol,
            administrationRoute: AdministrationRoute.oral,
          ),
      status: status,
      time: time,
    );

void main() {
  group('splitByDay', () {
    test('returns two empty lists when there are no occurrences', () {
      final split = splitByDay([]);

      expect(split.today, isEmpty);
      expect(split.upcoming, isEmpty);
    });

    test('routes upcoming status to `upcoming`, everything else to `today`',
        () {
      final a = schedule(id: 1);
      final b = schedule(id: 2);
      final c = schedule(id: 3);
      final d = schedule(id: 4);

      final split = splitByDay([
        occurrence(schedule: a, status: ScheduleStatus.today),
        occurrence(schedule: b, status: ScheduleStatus.taken),
        occurrence(schedule: c, status: ScheduleStatus.upcoming),
        occurrence(schedule: d, status: ScheduleStatus.overdue),
      ]);

      expect(split.today.map((o) => o.schedule), [d, a, b]);
      expect(split.upcoming.map((o) => o.schedule), [c]);
    });

    test('places overdue and todayOverdue first within today, preserving order',
        () {
      final a = schedule(id: 1);
      final b = schedule(id: 2);
      final c = schedule(id: 3);

      final split = splitByDay([
        occurrence(schedule: a, status: ScheduleStatus.today),
        occurrence(schedule: b, status: ScheduleStatus.todayOverdue),
        occurrence(schedule: c, status: ScheduleStatus.overdue),
      ]);

      expect(split.today.map((o) => o.schedule), [b, c, a]);
    });

    test('sorts non-overdue today occurrences by time, with null times first',
        () {
      final s = schedule(id: 1);

      final times = splitByDay([
        occurrence(schedule: s, time: const TimeOfDay(hour: 20, minute: 30)),
        occurrence(schedule: s),
        occurrence(schedule: s, time: const TimeOfDay(hour: 8, minute: 0)),
        occurrence(schedule: s, time: const TimeOfDay(hour: 14, minute: 0)),
      ]).today.map((o) => o.time).toList();

      expect(times, [
        null,
        const TimeOfDay(hour: 8, minute: 0),
        const TimeOfDay(hour: 14, minute: 0),
        const TimeOfDay(hour: 20, minute: 30),
      ]);
    });
  });
}
