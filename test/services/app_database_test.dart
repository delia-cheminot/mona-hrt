import 'package:flutter_test/flutter_test.dart';
import 'package:mona/services/db/app_database.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('AppDatabase', () {
    late AppDatabase dbInstance;
    late Database db;

    setUp(() async {
      AppDatabase.reset();
      dbInstance = AppDatabase.getInstance(inMemory: true);
      db = await dbInstance.database;
    });
    test('Database is created', () async {
      expect(db.isOpen, true);
    });

    test('database initializes and tables exist', () async {
      final tables = await db
          .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");

      final tableNames = tables
          .map((t) => t['name'] as String)
          .where((name) => name != 'sqlite_sequence')
          .toSet();

      expect(
        tableNames.containsAll(
            {'supply_items', 'medication_intakes', 'medication_schedules'}),
        true,
      );
    });

    test('can insert and query supply_items', () async {
      final id = await db.insert('supply_items', {
        'type': 'medication',
        'name': 'Test Item',
        'totalDose': '100',
        'usedDose': '0',
        'concentration': '10',
        'molecule': '{"name":"estradiol","unit":"mg"}',
        'administrationRoute': 'oral',
      });

      final item = await db.query(
        'supply_items',
        where: 'id = ?',
        whereArgs: [id],
      );

      expect(
        [
          item.first['name'],
          item.first['totalDose'],
        ],
        [
          'Test Item',
          '100',
        ],
      );
    });

    test('can insert and query generic supply_items', () async {
      // Act
      final id = await db.insert('supply_items', {
        'type': 'generic',
        'name': 'Test generic Item',
        'amount': 5,
        'genericSupplyType': 'syringe',
      });

      final item = await db.query(
        'supply_items',
        where: 'id = ?',
        whereArgs: [id],
      );

      // Assert
      expect(
          item.single,
          allOf(
            containsPair('name', 'Test generic Item'),
            containsPair('amount', 5),
            containsPair('genericSupplyType', 'syringe'),
          ));
    });

    test('can insert and query medication_intakes', () async {
      final supplyItemId = await db.insert('supply_items', {
        'type': 'medication',
        'name': 'Test Item',
        'totalDose': '100',
        'usedDose': '10',
        'concentration': '200',
        'molecule': '{"name":"progesterone","unit":"mg"}',
        'administrationRoute': 'oral',
      });

      final id = await db.insert('medication_intakes', {
        'takenDateTime': null,
        'takenDose': '2.5',
        'placements': '[]',
        'molecule': '{"name":"estradiol","unit":"mg"}',
        'administrationRoute': 'oral',
        'medicationSupplyItemId': supplyItemId,
        'genericSupplyItemIds': '[]',
      });

      final allIntakes = await db.query(
        'medication_intakes',
        where: 'id = ?',
        whereArgs: [id],
      );

      final intake = allIntakes.first;

      expect(
        intake,
        allOf(
          containsPair('id', id),
          containsPair('takenDose', '2.5'),
          containsPair('takenDateTime', null),
          containsPair('placements', '[]'),
          containsPair('medicationSupplyItemId', supplyItemId),
        ),
      );
    });

    test(
        "inserting a medicationSupplyItemId that doesn't exist in medication_intakes does not succeed",
        () async {
      final supplyItemId = -67;

      expect(
          () async => await db.insert('medication_intakes', {
                'takenDateTime': null,
                'takenDose': '2.5',
                'placements': '[]',
                'molecule': '{"name":"estradiol","unit":"mg"}',
                'administrationRoute': 'oral',
                'medicationSupplyItemId': supplyItemId,
                'genericSupplyItemIds': '[]',
              }),
          throwsA(
            predicate((e) =>
                e is DatabaseException &&
                e.getResultCode() == 787), // Foreign key constraint failed code
          ));
    });

    test(
        "deleting a supplyItem sets the field medicationSupplyItemId in medication_intakes NULL",
        () async {
      final supplyItemId = await db.insert('supply_items', {
        'type': 'medication',
        'name': 'Test Item',
        'totalDose': '100',
        'usedDose': '10',
        'concentration': '200',
        'molecule': '{"name":"progesterone","unit":"mg"}',
        'administrationRoute': 'oral',
      });

      final intakeId = await db.insert('medication_intakes', {
        'takenDateTime': null,
        'takenDose': '2.5',
        'placements': '[]',
        'molecule': '{"name":"estradiol","unit":"mg"}',
        'administrationRoute': 'oral',
        'medicationSupplyItemId': supplyItemId,
        'genericSupplyItemIds': '[]',
      });

      await db
          .delete("supply_items", where: 'id = ?', whereArgs: [supplyItemId]);

      final intakes = await db
          .query("medication_intakes", where: 'id = ?', whereArgs: [intakeId]);
      final intake = intakes.single;

      expect(
        intake,
        containsPair('medicationSupplyItemId', null),
      );
    });

    test(
        "inserting a scheduleId that doesn't exist in medication_intakes does not succeed",
        () async {
      // Arrange
      final scheduleId = -67;

      // Act & Assert
      expect(
          () async => await db.insert('medication_intakes', {
                'takenDateTime': null,
                'takenDose': '2.5',
                'placements': '[]',
                'molecule': '{"name":"estradiol","unit":"mg"}',
                'administrationRoute': 'oral',
                'scheduleId': scheduleId,
                'genericSupplyItemIds': '[]',
              }),
          throwsA(
            predicate((e) =>
                e is DatabaseException &&
                e.getResultCode() == 787), // foreign key constraint failed code
          ));
    });

    test(
        "deleting a schedule sets the field scheduleId in medication_intakes NULL",
        () async {
      // Arrange
      final scheduleId = await db.insert('medication_schedules', {
        'name': 'Morning Med',
        'dose': '5',
        'startDate': DateTime(2025, 9, 13).toIso8601String(),
        'molecule': '{"name":"estradiol","unit":"mg"}',
        'administrationRoute': 'oral',
        'scheduling':
            '{"type":"intervalDays","intervalDays":1,"notificationTimes":["8:30"]}',
      });

      final intakeId = await db.insert('medication_intakes', {
        'takenDateTime': null,
        'takenDose': '2.5',
        'placements': '[]',
        'molecule': '{"name":"estradiol","unit":"mg"}',
        'administrationRoute': 'oral',
        'scheduleId': scheduleId,
        'genericSupplyItemIds': '[]',
      });

      // Act
      await db.delete("medication_schedules",
          where: 'id = ?', whereArgs: [scheduleId]);

      // Assert
      final intakes = await db
          .query("medication_intakes", where: 'id = ?', whereArgs: [intakeId]);
      final intake = intakes.single;

      expect(
        intake,
        containsPair('scheduleId', null),
      );
    });

    test('can insert and query medication_schedules', () async {
      final id = await db.insert('medication_schedules', {
        'name': 'Morning Med',
        'dose': '5',
        'startDate': DateTime(2025, 9, 13).toIso8601String(),
        'molecule': '{"name":"estradiol","unit":"mg"}',
        'administrationRoute': 'oral',
        'scheduling':
            '{"type":"intervalDays","intervalDays":1,"notificationTimes":["8:30"]}',
      });

      final schedule = await db.query(
        'medication_schedules',
        where: 'id = ?',
        whereArgs: [id],
      );

      expect(
        [
          schedule.first['name'],
          schedule.first['scheduling'],
        ],
        [
          'Morning Med',
          '{"type":"intervalDays","intervalDays":1,"notificationTimes":["8:30"]}',
        ],
      );
    });

    test('can insert and query blood_tests', () async {
      final id = await db.insert('blood_tests', {
        'dateTime': DateTime(2025, 9, 13).toIso8601String(),
        'timeZone': 'Etc/UTC',
        'estradiolLevels': '{"value":"167.1","unit":"pg/mL"}',
        'testosteroneLevels': '{"value":"1.67","unit":"ng/dL"}',
      });

      final test =
          await db.query('blood_tests', where: 'id = ?', whereArgs: [id]);

      expect([
        test.first['estradiolLevels'],
        test.first['testosteroneLevels'],
      ], [
        '{"value":"167.1","unit":"pg/mL"}',
        '{"value":"1.67","unit":"ng/dL"}',
      ]);
    });
  });
}
