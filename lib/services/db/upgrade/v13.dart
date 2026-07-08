import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV13 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await _migrateSupplyItems(db);
    await _migrateMedicationIntakes(db);
    await _migrateMedicationSchedules(db);
  }

  Future<void> _migrateSupplyItems(Database db) async {
    await db.execute('''
      CREATE TABLE supply_items_new(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        name TEXT NOT NULL,
        totalDose TEXT,
        usedDose TEXT,
        concentration TEXT,
        molecule TEXT,
        administrationRoute TEXT,
        ester TEXT,
        amount INTEGER,
        genericSupplyType TEXT
      );
      ''');

    await db.execute('''
      INSERT INTO supply_items_new (
        id, type, name, totalDose, usedDose, concentration,
        molecule, administrationRoute, ester, amount, genericSupplyType
      )
      SELECT
        id, type, name, totalDose, usedDose, concentration,
        moleculeJson, administrationRouteName, esterName, amount, genericSupplyType
      FROM supply_items
      ''');

    await db.execute('DROP TABLE supply_items');
    await db.execute('ALTER TABLE supply_items_new RENAME TO supply_items');
  }

  Future<void> _migrateMedicationIntakes(Database db) async {
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
        side TEXT,
        molecule TEXT NOT NULL,
        administrationRoute TEXT NOT NULL,
        ester TEXT,
        supplyItemId INTEGER,
        notes TEXT,
        FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
      );
      ''');

    await db.execute('''
      INSERT INTO medication_intakes_new (
        id, scheduledTime, takenDateTime, takenTimeZone, takenDose,
        wastedAmount, deadSpace, scheduleId, side, molecule, administrationRoute,
        ester, supplyItemId, notes
      )
      SELECT
        id, scheduledTime, takenDateTime, takenTimeZone, dose,
        wastedAmount, deadSpace, scheduleId, side, moleculeJson, administrationRouteName,
        esterName, supplyItemId, notes
      FROM medication_intakes
      ''');

    await db.execute('DROP TABLE medication_intakes');
    await db.execute(
        'ALTER TABLE medication_intakes_new RENAME TO medication_intakes');
  }

  Future<void> _migrateMedicationSchedules(Database db) async {
    await db.execute('''
      CREATE TABLE medication_schedules_new(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        dose TEXT NOT NULL,
        startDate TEXT NOT NULL,
        molecule TEXT NOT NULL,
        administrationRoute TEXT NOT NULL,
        ester TEXT,
        scheduling TEXT NOT NULL
      );
      ''');

    await db.execute('''
      INSERT INTO medication_schedules_new (
        id, name, dose, startDate, molecule, administrationRoute,
        ester, scheduling
      )
      SELECT
        id, name, dose, startDate, moleculeJson, administrationRouteName,
        esterName, schedulingStrategy
      FROM medication_schedules
      ''');

    await db.execute('DROP TABLE medication_schedules');
    await db.execute(
        'ALTER TABLE medication_schedules_new RENAME TO medication_schedules');
  }
}
