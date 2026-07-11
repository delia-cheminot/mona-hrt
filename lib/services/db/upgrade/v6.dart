import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV6 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await _upgradeSupplyItems(db);
  }

  // Rebuilds supply_items so that medication-only columns are nullable, adds
  // the polymorphic `type` discriminator + `amount` column for generic supplies,
  // and drops the unused `quantity` column. Foreign key enforcement is
  // disabled by AppDatabase during migrations: dropping the old table would
  // otherwise trigger ON DELETE SET NULL on medication_intakes.supplyItemId.
  Future<void> _upgradeSupplyItems(Database db) async {
    await db.execute('''
      CREATE TABLE supply_items_new(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        name TEXT NOT NULL,
        totalDose TEXT,
        usedDose TEXT,
        concentration TEXT,
        moleculeJson TEXT,
        administrationRouteName TEXT,
        esterName TEXT,
        amount INTEGER
      )
      ''');

    await db.execute('''
      INSERT INTO supply_items_new (
        id, type, name,
        totalDose, usedDose, concentration,
        moleculeJson, administrationRouteName, esterName,
        amount
      )
      SELECT
        id, 'medication', name,
        totalDose, usedDose, concentration,
        moleculeJson, administrationRouteName, esterName,
        NULL
      FROM supply_items
      ''');

    await db.execute('DROP TABLE supply_items');
    await db.execute('ALTER TABLE supply_items_new RENAME TO supply_items');
  }
}
