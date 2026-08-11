import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV17 implements DbUpgrade {
  static const _routeRenames = {
    'transdermal spray': 'transdermalSpray',
    'transdermal drops': 'transdermalDrops',
  };

  static const _esterRenames = {
    'cypionate suspension': 'cypionateSuspension',
  };

  static const _tables = [
    'supply_items',
    'medication_intakes',
    'medication_schedules',
  ];

  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    for (final table in _tables) {
      await _renameColumn(db, table, 'administrationRoute', _routeRenames);
      await _renameColumn(db, table, 'ester', _esterRenames);
    }
  }

  Future<void> _renameColumn(
    Database db,
    String table,
    String column,
    Map<String, String> renames,
  ) async {
    for (final entry in renames.entries) {
      await db.update(
        table,
        {column: entry.value},
        where: '$column = ?',
        whereArgs: [entry.key],
      );
    }
  }
}
