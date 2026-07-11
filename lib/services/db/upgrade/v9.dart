import 'dart:convert';

import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV9 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await _migrateIntervalDaysNotificationTimes(db);
  }

  // IntervalDaysSchedule: notificationTime (string|null)
  //   -> notificationTimes (List<string>)
  // null or missing -> []
  // "HH:mm"          -> ["HH:mm"]
  Future<void> _migrateIntervalDaysNotificationTimes(Database db) async {
    final rows = await db.query('medication_schedules');
    for (final row in rows) {
      final raw = row['schedulingStrategy'] as String?;
      if (raw == null) continue;

      final strategy = jsonDecode(raw) as Map<String, Object?>;
      if (strategy['type'] != 'intervalDays') continue;

      final previous = strategy.remove('notificationTime') as String?;
      strategy['notificationTimes'] =
          previous == null ? <String>[] : [previous];

      await db.update(
        'medication_schedules',
        {'schedulingStrategy': jsonEncode(strategy)},
        where: 'id = ?',
        whereArgs: [row['id']],
      );
    }
  }
}
