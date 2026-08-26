import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:mona/services/db/db_tables.dart';
import 'package:mona/services/db/upgrade/db_upgrade.dart';
import 'package:mona/services/db/upgrade/v10.dart';
import 'package:mona/services/db/upgrade/v11.dart';
import 'package:mona/services/db/upgrade/v12.dart';
import 'package:mona/services/db/upgrade/v13.dart';
import 'package:mona/services/db/upgrade/v14.dart';
import 'package:mona/services/db/upgrade/v15.dart';
import 'package:mona/services/db/upgrade/v16.dart';
import 'package:mona/services/db/upgrade/v17.dart';
import 'package:mona/services/db/upgrade/v18.dart';
import 'package:mona/services/db/upgrade/v2.dart';
import 'package:mona/services/db/upgrade/v3.dart';
import 'package:mona/services/db/upgrade/v4.dart';
import 'package:mona/services/db/upgrade/v5.dart';
import 'package:mona/services/db/upgrade/v6.dart';
import 'package:mona/services/db/upgrade/v7.dart';
import 'package:mona/services/db/upgrade/v8.dart';
import 'package:mona/services/db/upgrade/v9.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

const int currentDatabaseVersion = 18;

final Map<int, DbUpgrade> _upgrades = {
  2: DbUpgradeV2(),
  3: DbUpgradeV3(),
  4: DbUpgradeV4(),
  5: DbUpgradeV5(),
  6: DbUpgradeV6(),
  7: DbUpgradeV7(),
  8: DbUpgradeV8(),
  9: DbUpgradeV9(),
  10: DbUpgradeV10(),
  11: DbUpgradeV11(),
  12: DbUpgradeV12(),
  13: DbUpgradeV13(),
  14: DbUpgradeV14(),
  15: DbUpgradeV15(),
  16: DbUpgradeV16(),
  17: DbUpgradeV17(),
  18: DbUpgradeV18(),
};

class AppDatabase {
  static const String _backupSuffix = '.bak';

  static AppDatabase? _instance;
  static Database? _database;
  final bool inMemory;

  AppDatabase._init({required this.inMemory});

  static AppDatabase getInstance({bool inMemory = false}) {
    _instance ??= AppDatabase._init(inMemory: inMemory);
    return _instance!;
  }

  Future<Database> get database async {
    WidgetsFlutterBinding.ensureInitialized();

    if (_database != null) return _database!;

    assert(currentDatabaseVersion == _upgrades.entries.last.key,
        "Current database version mismatches last upgrade version.");

    if (Platform.isLinux || Platform.isWindows) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    _database = inMemory ? await _initInMemoryDB() : await _initFileDB();
    return _database!;
  }

  Future<Database> _initInMemoryDB() async {
    return openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: _createDB,
      onOpen: _onOpen,
    );
  }

  Future<String> filePath() async {
    return join(await getDatabasesPath(), 'app_database.db');
  }

  Future<String> backupFilePath() async {
    return '${await filePath()}$_backupSuffix';
  }

  Future<void> _recoverInterruptedImport() async {
    final dbPath = await filePath();
    final bak = File(await backupFilePath());
    if (!await bak.exists()) return;

    final live = File(dbPath);
    if (await live.exists()) {
      await bak.delete();
    } else {
      await bak.rename(dbPath);
    }
  }

  Future<Database> _initFileDB() async {
    await _recoverInterruptedImport();
    return await openDatabase(
      await filePath(),
      version: currentDatabaseVersion,
      onCreate: _createDB,
      onUpgrade: applyAppUpgrades,
      onOpen: _onOpen,
    );
  }

  Future _onOpen(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _createDB(Database db, int version) async {
    await db.execute(createSupplyItemsTable);
    await db.execute(createMedicationSchedulesTable);
    await db.execute(createMedicationIntakesTable);
    await db.execute(createBloodTestsTable);
  }

  Future<void> applyAppUpgrades(
      Database db, int oldVersion, int newVersion) async {
    for (var version = oldVersion + 1; version <= newVersion; version++) {
      final upgrade = _upgrades[version];
      if (upgrade == null) {
        throw StateError(
            'No upgrade registered for database version $version. ');
      }
      await upgrade.upgrade(db, oldVersion, newVersion);
    }
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }

  static void reset() {
    _database = null;
    _instance = null;
  }
}
