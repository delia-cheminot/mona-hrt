import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV4 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    // add blood_tests
    await db.execute('''
      CREATE TABLE blood_tests(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dateTime TEXT NOT NULL,
        timeZone TEXT NOT NULL,
        estradiolLevels TEXT,
        testosteroneLevels TEXT
      )
      ''');

    // migrate startDate to date
    final schedules = await db.query('medication_schedules');
    for (final row in schedules) {
      final raw = row['startDate'] as String;

      final local = DateTime.parse(raw);
      final date = Date(year: local.year, month: local.month, day: local.day);

      await db.update(
        'medication_schedules',
        {'startDate': date.toString()},
        where: 'id = ?',
        whereArgs: [row['id']],
      );
    }

    // add takenTimeZone to medication_intakes
    await db.execute(
        'ALTER TABLE medication_intakes ADD COLUMN takenTimeZone TEXT');

    // use utc for takenDateTime and add takenTimeZone
    final intakes = await db.query('medication_intakes');
    final TimezoneInfo currentTimeZone =
        await FlutterTimezone.getLocalTimezone();

    for (final row in intakes) {
      final id = row['id'] as int;
      final takenDateTimeRaw = row['takenDateTime'] as String?;

      if (takenDateTimeRaw != null) {
        final local = DateTime.parse(takenDateTimeRaw);
        final localAtNoon = DateTime(local.year, local.month, local.day, 12, 0);
        final utc = localAtNoon.toUtc();

        await db.update(
          'medication_intakes',
          {
            'takenDateTime': utc.toIso8601String(),
            'takenTimeZone': currentTimeZone.identifier
          },
          where: 'id = ?',
          whereArgs: [id],
        );
      }
    }
  }
}
