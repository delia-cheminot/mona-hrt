import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:mona/services/db/app_database.dart';
import 'package:mona/services/db/historical_schemas.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sqflite/sqflite.dart';

class BackupService {
  bool get isDesktop =>
      Platform.isLinux || Platform.isWindows || Platform.isMacOS;

  bool get isAndroid => !isDesktop && Platform.isAndroid;

  static const _tables = [
    'medication_intakes',
    'medication_schedules',
    'supply_items',
    'blood_tests',
  ];

  Future<String> _generateBackupJson() async {
    final db = await AppDatabase.getInstance().database;
    final packageInfo = await PackageInfo.fromPlatform();

    final data = {
      for (final table in _tables) table: await db.query(table),
    };

    final backupData = {
      'metadata': {
        'app_version': packageInfo.version,
        'database_version': await db.getVersion(),
        'export_date': DateTime.now().toIso8601String(),
      },
      'data': data,
    };

    return const JsonEncoder.withIndent('  ').convert(backupData);
  }

  Future<void> _processImport(Map<String, dynamic> backupData) async {
    final metadata = backupData['metadata'] as Map<String, dynamic>;
    final backupVersion = metadata['database_version'] as int;
    final dataSection = backupData['data'] as Map<String, dynamic>;

    final appDb = AppDatabase.getInstance();
    final dbPath = await appDb.filePath();
    final backupPath = await appDb.backupFilePath();

    await appDb.close();
    final hadExistingDb = await File(dbPath).exists();
    if (hadExistingDb) {
      await File(dbPath).rename(backupPath);
    }

    try {
      final db = await openDatabase(
        dbPath,
        version: backupVersion,
        onCreate: (db, version) async {
          for (final statement in historicalSchemaFor(version)) {
            await db.execute(statement);
          }
        },
        onOpen: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        },
      );

      try {
        await db.transaction((txn) async {
          await txn.execute('PRAGMA defer_foreign_keys = ON');

          for (final entry in dataSection.entries) {
            final rows = entry.value;
            for (final row in rows) {
              await txn.insert(entry.key, Map<String, Object?>.from(row));
            }
          }
        });
      } finally {
        await db.close();
      }

      if (hadExistingDb) {
        final bak = File(backupPath);
        if (await bak.exists()) {
          await bak.delete();
        }
      }
    } catch (_) {
      await _rollback(dbPath, backupPath, hadExistingDb);
      rethrow;
    }
  }

  Future<void> _rollback(
      String dbPath, String backupPath, bool hadExistingDb) async {
    final partialDatabase = File(dbPath);
    if (await partialDatabase.exists()) {
      await partialDatabase.delete();
    }

    if (hadExistingDb) {
      final bak = File(backupPath);
      if (await bak.exists()) {
        await bak.rename(dbPath);
      }
    }
  }

  void _validateBackup(Map<String, dynamic> backupData) {
    if (!backupData.containsKey('metadata') || backupData['metadata'] is! Map) {
      throw const FormatException('Invalid backup: missing metadata');
    }

    if (!backupData.containsKey('data') || backupData['data'] is! Map) {
      throw const FormatException(
          'Invalid backup: missing or invalid data object');
    }

    final metadata = backupData['metadata'] as Map<String, dynamic>;
    final version = metadata['database_version'];
    if (version is! int) {
      throw const FormatException(
          'Invalid backup: missing or invalid database version');
    }
    if (version < oldestImportableVersion || version > currentDatabaseVersion) {
      throw FormatException(
        'Unsupported backup version: $version '
        '(supported range: $oldestImportableVersion..$currentDatabaseVersion)',
      );
    }

    final dataSection = backupData['data'] as Map<String, dynamic>;
    for (final entry in dataSection.entries) {
      if (entry.value != null && entry.value is! List) {
        throw FormatException('Invalid backup: ${entry.key} must be a list');
      }
    }
  }

  String _timestampedFileName() {
    final ts =
        DateTime.now().toIso8601String().split('.').first.replaceAll(':', '-');
    return 'mona_backup_$ts.json';
  }

  Future<String?> exportData() async {
    final jsonString = await _generateBackupJson();
    final bytes = Uint8List.fromList(utf8.encode(jsonString));

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Mona Backup',
      fileName: _timestampedFileName(),
      type: isAndroid ? FileType.any : FileType.custom,
      allowedExtensions: isAndroid ? null : ['json'],
      bytes: bytes,
    );

    if (outputFile != null) {
      if (isDesktop && !outputFile.endsWith('.json')) {
        outputFile += '.json';
      }
      if (isDesktop) {
        await File(outputFile).writeAsString(jsonString);
      }
      return outputFile;
    }
    return null;
  }

  Future<bool> importData() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: isAndroid ? FileType.any : FileType.custom,
      allowedExtensions: isAndroid ? null : ['json'],
    );

    if (result == null || result.files.single.path == null) {
      return false;
    }

    final file = File(result.files.single.path!);
    final jsonString = await file.readAsString();
    final Map<String, dynamic> backupData = jsonDecode(jsonString);

    _validateBackup(backupData);
    await _processImport(backupData);
    return true;
  }
}
