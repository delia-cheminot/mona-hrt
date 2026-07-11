import 'dart:convert';

import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV8 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await _migrateMedicationIntakes(db);
    await _migrateMedicationSchedules(db);
  }

  // drops unused scheduledDateTime
  //  adds scheduledTime
  Future<void> _migrateMedicationIntakes(Database db) async {
    await db.execute('''
      CREATE TABLE medication_intakes_new (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        takenDateTime TEXT,
        takenTimeZone TEXT,
        dose TEXT NOT NULL,
        scheduleId INTEGER,
        side TEXT,
        moleculeJson TEXT NOT NULL,
        administrationRouteName TEXT NOT NULL,
        esterName TEXT,
        supplyItemId INTEGER,
        notes TEXT,
        scheduledTime TEXT,
        FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
      );
      ''');

    await db.execute('''
      INSERT INTO medication_intakes_new (
        id, takenDateTime, takenTimeZone,
        dose, scheduleId, side, moleculeJson,
        administrationRouteName, esterName, supplyItemId, notes
      )
      SELECT
        id, takenDateTime, takenTimeZone,
        dose, scheduleId, side, moleculeJson,
        administrationRouteName, esterName, supplyItemId, notes
      FROM medication_intakes
      ''');

    await db.execute('DROP TABLE medication_intakes');
    await db.execute(
        'ALTER TABLE medication_intakes_new RENAME TO medication_intakes');
  }

  // drops intervalDays and notificationTimes, adds schedulingStrategy
  // intervalDays >= 2 -> IntervalDaysSchedule
  //  intervalDays == 1, no notification -> IntervalDaysSchedule
  //  intervalDays == 1, notifications -> DailySchedule
  Future<void> _migrateMedicationSchedules(Database db) async {
    await db.execute('''
      CREATE TABLE medication_schedules_new(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        dose TEXT NOT NULL,
        startDate TEXT NOT NULL,
        moleculeJson TEXT NOT NULL,
        administrationRouteName TEXT NOT NULL,
        esterName TEXT,
        schedulingStrategy TEXT NOT NULL
      );
      ''');

    final rows = await db.query('medication_schedules');
    for (final row in rows) {
      final intervalDays = row['intervalDays'] as int;
      final rawTimes = row['notificationTimes'] as String? ?? '[]';
      final times = (jsonDecode(rawTimes) as List).cast<String>();

      final Map<String, Object?> strategy;
      if (intervalDays == 1 && times.isNotEmpty) {
        strategy = {
          'type': 'daily',
          'intakeTimes': times,
          'notify': true,
        };
      } else {
        strategy = {
          'type': 'intervalDays',
          'intervalDays': intervalDays,
          'notificationTime': times.isEmpty ? null : times.first,
        };
      }

      await db.insert('medication_schedules_new', {
        'id': row['id'],
        'name': row['name'],
        'dose': row['dose'],
        'startDate': row['startDate'],
        'moleculeJson': row['moleculeJson'],
        'administrationRouteName': row['administrationRouteName'],
        'esterName': row['esterName'],
        'schedulingStrategy': jsonEncode(strategy),
      });
    }

    await db.execute('DROP TABLE medication_schedules');
    await db.execute(
        'ALTER TABLE medication_schedules_new RENAME TO medication_schedules');
  }
}
