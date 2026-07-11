import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/services/db/app_database.dart';
import 'package:mona/services/repository.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('SupplyItemRepository tests', () {
    late AppDatabase dbInstance;
    late Database db;
    late Repository<MedicationSupplyItem> repository;

    setUp(() async {
      AppDatabase.reset();
      dbInstance = AppDatabase.getInstance(inMemory: true);
      db = await dbInstance.database;
      await db.delete('supply_items');
      repository = Repository<MedicationSupplyItem>(
        db: db,
        tableName: 'supply_items',
        toMap: (MedicationSupplyItem item) => item.toMap(),
        fromMap: (Map<String, Object?> map) =>
            MedicationSupplyItemMapper.fromMap(map),
      );
    });

    test('Insert and retrieve a SupplyItem', () async {
      final item = MedicationSupplyItem(
        name: 'h',
        totalDose: Decimal.parse('1'),
        concentration: Decimal.parse('1'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
      );

      int insertedId = await repository.insert(item);
      final items = await repository.getAll();

      expect(
        [items.length, items[0].id],
        [1, insertedId],
      );
    });

    test('Update a SupplyItem', () async {
      final item = MedicationSupplyItem(
        name: 'h',
        totalDose: Decimal.parse('1'),
        concentration: Decimal.parse('1'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
      );
      int id = await repository.insert(item);
      final updatedItem = MedicationSupplyItem(
        name: 'h',
        id: id,
        totalDose: Decimal.parse('2'),
        concentration: Decimal.parse('1'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
      );

      await repository.update(updatedItem, id);

      final updatedItems = await repository.getAll();
      expect(
        [updatedItems.length, updatedItems[0].id, updatedItems[0].totalDose],
        [1, id, Decimal.parse('2')],
      );
    });

    test('Delete a SupplyItem', () async {
      final item = MedicationSupplyItem(
        name: 'h',
        totalDose: Decimal.parse('1'),
        concentration: Decimal.parse('1'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
      );
      int id = await repository.insert(item);

      await repository.delete(id);

      final remainingItems = await repository.getAll();
      expect(remainingItems.length, 0);
    });

    test('Only delete the specified SupplyItem', () async {
      final item1 = MedicationSupplyItem(
        id: 1,
        name: 'g',
        totalDose: Decimal.parse('1'),
        concentration: Decimal.parse('1'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
      );
      final item2 = MedicationSupplyItem(
        id: 2,
        name: 'h',
        totalDose: Decimal.parse('2'),
        concentration: Decimal.parse('1'),
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
      );
      int id1 = await repository.insert(item1);
      int id2 = await repository.insert(item2);

      await repository.delete(id1);

      final remainingItems = await repository.getAll();
      expect(
        [remainingItems.length, remainingItems[0].id],
        [1, id2],
      );
    });
  });

  group('Invalid column name test', () {
    test('Throws exception for invalid column name', () async {
      AppDatabase.reset();
      AppDatabase dbInstance = AppDatabase.getInstance(inMemory: true);
      Database db = await dbInstance.database;
      Repository<MedicationSupplyItem> repository =
          Repository<MedicationSupplyItem>(
        db: db,
        tableName: 'bad_table',
        toMap: (MedicationSupplyItem item) => item.toMap(),
        fromMap: (Map<String, Object?> map) =>
            MedicationSupplyItemMapper.fromMap(Map<String, dynamic>.from(map)),
      );

      try {
        await repository.getAll();
        fail('Expected an exception to be thrown');
      } catch (e) {
        expect(e, isA<DatabaseException>());
      }
    });
  });
}
