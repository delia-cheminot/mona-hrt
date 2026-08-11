import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV17 implements DbUpgrade {
  static const _renames = {
    'transdermal spray': 'transdermalSpray',
    'transdermal drops': 'transdermalDrops',
  };

  static const _tables = [
    'supply_items',
    'medication_intakes',
    'medication_schedules',
  ];

  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    for (final table in _tables) {
      for (final entry in _renames.entries) {
        await db.update(
          table,
          {'administrationRoute': entry.value},
          where: 'administrationRoute = ?',
          whereArgs: [entry.key],
        );
      }
    }
  }
}
