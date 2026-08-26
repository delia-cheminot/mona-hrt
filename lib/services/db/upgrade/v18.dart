import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV18 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
      CREATE TABLE blood_tests_new(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dateTime TEXT NOT NULL,
        timeZone TEXT NOT NULL,
        estradiolLevels TEXT,
        testosteroneLevels TEXT
      );
      ''');

    await db.execute('''
      INSERT INTO blood_tests_new (
        id, dateTime, timeZone, estradiolLevels, testosteroneLevels
      )
      SELECT
        id,
        dateTime,
        timeZone,
        CASE
          WHEN estradiolLevels IS NOT NULL
          THEN '{"value":"' || estradiolLevels || '","unit":"' ||
               COALESCE(estradiolUnit, 'pg/mL') || '"}'
        END,
        CASE
          WHEN testosteroneLevels IS NOT NULL
          THEN '{"value":"' || testosteroneLevels || '","unit":"' ||
               COALESCE(testosteroneUnit, 'ng/dL') || '"}'
        END
      FROM blood_tests
      ''');

    await db.execute('DROP TABLE blood_tests');
    await db.execute('ALTER TABLE blood_tests_new RENAME TO blood_tests');
  }
}
