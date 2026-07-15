import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV16 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
      CREATE TABLE medication_intakes_new(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        scheduledTime TEXT,
        takenDateTime TEXT,
        takenTimeZone TEXT,
        takenDose TEXT NOT NULL,
        wastedAmount TEXT,
        deadSpace TEXT,
        scheduleId INTEGER,
        molecule TEXT NOT NULL,
        administrationRoute TEXT NOT NULL,
        ester TEXT,
        medicationSupplyItemId INTEGER,
        genericSupplyItemIds TEXT NOT NULL,
        notes TEXT,
        placements TEXT NOT NULL,
        FOREIGN KEY (medicationSupplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL,
        FOREIGN KEY (scheduleId) REFERENCES medication_schedules(id) ON DELETE SET NULL
      );
      ''');

    await db.execute('''
      INSERT INTO medication_intakes_new (
        id, scheduledTime, takenDateTime, takenTimeZone, takenDose,
        wastedAmount, deadSpace, scheduleId, molecule, administrationRoute,
        ester, medicationSupplyItemId, genericSupplyItemIds, notes, placements
      )
      SELECT
        id, scheduledTime, takenDateTime, takenTimeZone, takenDose,
        wastedAmount, deadSpace, scheduleId, molecule, administrationRoute,
        ester, supplyItemId, '[]', notes, placements
      FROM medication_intakes
      ''');

    await db.execute('DROP TABLE medication_intakes');
    await db.execute(
        'ALTER TABLE medication_intakes_new RENAME TO medication_intakes');
  }
}
