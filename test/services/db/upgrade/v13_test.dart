import 'package:flutter_test/flutter_test.dart';
import 'package:mona/services/db/historical_schemas.dart';
import 'package:mona/services/db/upgrade/v13.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('DbUpgradeV13', () {
    late Database db;

    setUp(() async {
      db = await openDatabase(inMemoryDatabasePath, version: 12);
      for (final stmt in historicalSchemaFor(12)) {
        await db.execute(stmt);
      }
    });

    tearDown(() async {
      await db.close();
    });

    Future<Set<String>> columnNames(String table) async {
      final columns = await db.rawQuery("PRAGMA table_info('$table')");
      return columns.map((c) => c['name'] as String).toSet();
    }

    test('supply_items columns are renamed', () async {
      final id = await db.insert('supply_items', {
        'type': 'medication',
        'name': 'Test Item',
        'totalDose': '100',
        'usedDose': '0',
        'concentration': '10',
        'moleculeJson': '{"name":"estradiol","unit":"mg"}',
        'administrationRouteName': 'oral',
        'esterName': 'valerate',
      });

      await DbUpgradeV13().upgrade(db, 12, 13);

      final names = await columnNames('supply_items');
      expect(names, containsAll({'molecule', 'administrationRoute', 'ester'}));
      expect(
        names,
        isNot(anyOf(
          contains('moleculeJson'),
          contains('administrationRouteName'),
          contains('esterName'),
        )),
      );

      final row =
          (await db.query('supply_items', where: 'id = ?', whereArgs: [id]))
              .single;
      expect(row['molecule'], '{"name":"estradiol","unit":"mg"}');
      expect(row['administrationRoute'], 'oral');
      expect(row['ester'], 'valerate');
    });

    test('medication_intakes columns are renamed and data preserved', () async {
      final id = await db.insert('medication_intakes', {
        'scheduledTime': '8:30',
        'takenDateTime': '2025-09-01T10:00:00.000Z',
        'takenTimeZone': 'Etc/UTC',
        'dose': '2.5',
        'wastedAmount': '0.1',
        'deadSpace': '0.05',
        'scheduleId': 1,
        'side': 'left',
        'moleculeJson': '{"name":"estradiol","unit":"mg"}',
        'administrationRouteName': 'injection',
        'esterName': 'valerate',
        'notes': 'a note',
      });

      await DbUpgradeV13().upgrade(db, 12, 13);

      final names = await columnNames('medication_intakes');
      expect(
        names,
        containsAll(
            {'takenDose', 'deadSpace', 'molecule', 'administrationRoute', 'ester'}),
      );
      expect(
        names,
        isNot(anyOf(
          contains('dose'),
          contains('moleculeJson'),
          contains('administrationRouteName'),
          contains('esterName'),
        )),
      );

      final row = (await db
              .query('medication_intakes', where: 'id = ?', whereArgs: [id]))
          .single;
      expect(row['takenDose'], '2.5');
      expect(row['wastedAmount'], '0.1');
      expect(row['deadSpace'], '0.05');
      expect(row['molecule'], '{"name":"estradiol","unit":"mg"}');
      expect(row['administrationRoute'], 'injection');
      expect(row['ester'], 'valerate');
      expect(row['notes'], 'a note');
    });

    test('medication_schedules columns are renamed and data preserved',
        () async {
      final id = await db.insert('medication_schedules', {
        'name': 'Morning Med',
        'dose': '5',
        'startDate': '2025-01-01T00:00:00.000Z',
        'moleculeJson': '{"name":"estradiol","unit":"mg"}',
        'administrationRouteName': 'oral',
        'esterName': 'valerate',
        'schedulingStrategy':
            '{"type":"intervalDays","intervalDays":1,"notificationTime":null}',
      });

      await DbUpgradeV13().upgrade(db, 12, 13);

      final names = await columnNames('medication_schedules');
      expect(
        names,
        containsAll({'molecule', 'administrationRoute', 'ester', 'scheduling'}),
      );
      expect(
        names,
        isNot(anyOf(
          contains('moleculeJson'),
          contains('administrationRouteName'),
          contains('esterName'),
          contains('schedulingStrategy'),
        )),
      );

      final row = (await db
              .query('medication_schedules', where: 'id = ?', whereArgs: [id]))
          .single;
      expect(row['id'], id);
      expect(row['name'], 'Morning Med');
      expect(row['dose'], '5');
      expect(row['molecule'], '{"name":"estradiol","unit":"mg"}');
      expect(row['administrationRoute'], 'oral');
      expect(row['ester'], 'valerate');
      expect(row['scheduling'],
          '{"type":"intervalDays","intervalDays":1,"notificationTime":null}');
    });
  });
}
