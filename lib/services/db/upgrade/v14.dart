import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:sqflite/sqlite_api.dart';

class DbUpgradeV14 implements DbUpgrade {
  @override
  Future<void> upgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
      ALTER TABLE medication_intakes ADD COLUMN placements TEXT NOT NULL DEFAULT '[]';
      ''');

    final rows = await db.query('medication_intakes');
    for (final row in rows) {
      final side = row['side'] as String?;
      if (side == null) continue;

      final placement = switch (side) {
        'left' => '[{"kind":"preset","preset":"left"}]',
        'right' => '[{"kind":"preset","preset":"right"}]',
        _ => null,
      };

      if (placement == null) continue;

      await db.update(
        'medication_intakes',
        {'placements': placement},
        where: 'id = ?',
        whereArgs: [row['id']],
      );
    }
  }
}
