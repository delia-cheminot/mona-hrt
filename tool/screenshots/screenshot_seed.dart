import 'package:clock/clock.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/services/db/app_database.dart';
import 'package:sqflite/sqflite.dart';

final DateTime screenshotClockInstant = DateTime(2026, 6, 1, 12, 0);

const String _tz = 'UTC';

DateTime _daysAgoUtc(int days, {int hour = 12}) {
  final now = clock.now();
  return DateTime.utc(now.year, now.month, now.day, hour)
      .subtract(Duration(days: days));
}

Decimal _d(String value) => Decimal.parse(value);

Future<void> seedScreenshotData() async {
  final db = await AppDatabase.getInstance().database;
  await _clear(db);
  await _insertSchedules(db);
  await _insertIntakes(db);
  await _insertBloodTests(db);
  await _insertSupplies(db);
}

Future<void> _clear(Database db) async {
  for (final table in const [
    'medication_intakes',
    'medication_schedules',
    'blood_tests',
    'supply_items',
  ]) {
    await db.delete(table);
  }
}

Future<void> _insert(Database db, String table, Map<String, Object?> map) {
  return db.insert(table, map, conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<void> _insertSchedules(Database db) async {
  final today = Date.today();

  final daily = MedicationSchedule(
    id: 101,
    name: 'Estradiol gel',
    dose: _d('1.5'),
    molecule: KnownMolecules.estradiol,
    administrationRoute: AdministrationRoute.gel,
    startDate: today,
    scheduling: const DailySchedule(
      intakeTimes: [
        TimeOfDay(hour: 8, minute: 0),
        TimeOfDay(hour: 10, minute: 0),
        TimeOfDay(hour: 18, minute: 0),
      ],
    ),
  );

  final optional = MedicationSchedule(
    id: 102,
    name: 'Progesterone',
    dose: _d('100'),
    molecule: KnownMolecules.progesterone,
    administrationRoute: AdministrationRoute.oral,
    startDate: today.subtract(const Duration(days: 30)),
    scheduling: const AsNeededSchedule(),
  );

  final upcoming = MedicationSchedule(
    id: 103,
    name: 'Decapeptyl',
    dose: _d('11.25'),
    molecule: KnownMolecules.decapeptyl,
    administrationRoute: AdministrationRoute.injection,
    ester: Ester.enanthate,
    startDate: today.add(const Duration(days: 3)),
    scheduling: const IntervalDaysSchedule(intervalDays: 7),
  );

  for (final schedule in [daily, optional, upcoming]) {
    await _insert(db, 'medication_schedules', schedule.toMap());
  }
}

Future<void> _insertIntakes(Database db) async {
  final injections = [
    (id: 201, days: 3),
    (id: 202, days: 10),
    (id: 203, days: 17),
  ].map(
    (e) => MedicationIntake(
      id: e.id,
      takenDose: _d('4'),
      takenDateTime: _daysAgoUtc(e.days),
      takenTimeZone: _tz,
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.injection,
      ester: Ester.enanthate,
    ),
  );

  final oral = MedicationIntake(
    id: 204,
    takenDose: _d('100'),
    takenDateTime: _daysAgoUtc(1),
    takenTimeZone: _tz,
    molecule: KnownMolecules.progesterone,
    administrationRoute: AdministrationRoute.oral,
    scheduleId: 102,
  );

  final patch = MedicationIntake(
    id: 205,
    takenDose: _d('0.1'),
    takenDateTime: _daysAgoUtc(2),
    takenTimeZone: _tz,
    molecule: KnownMolecules.estradiol,
    administrationRoute: AdministrationRoute.patch,
    notes: 'Left hip',
  );

  final dailyTaken = MedicationIntake(
    id: 206,
    scheduledTime: const TimeOfDay(hour: 8, minute: 0),
    takenDose: _d('1.5'),
    takenDateTime: _daysAgoUtc(0, hour: 8),
    takenTimeZone: _tz,
    molecule: KnownMolecules.estradiol,
    administrationRoute: AdministrationRoute.gel,
    scheduleId: 101,
  );

  for (final intake in [...injections, oral, patch, dailyTaken]) {
    await _insert(db, 'medication_intakes', intake.toMap());
  }
}

Future<void> _insertBloodTests(Database db) async {
  final rows = [
    (id: 301, days: 7, e: '150', t: '40'),
    (id: 302, days: 21, e: '180', t: '20'),
    (id: 303, days: 35, e: '120', t: '90'),
    (id: 304, days: 49, e: '60', t: '150'),
    (id: 305, days: 63, e: '90', t: '260'),
  ];

  for (final row in rows) {
    final test = BloodTest(
      id: row.id,
      dateTime: _daysAgoUtc(row.days, hour: 9),
      timeZone: _tz,
      estradiolLevels: UnitValue(_d(row.e), EstradiolUnit.pg_mL),
      testosteroneLevels: UnitValue(_d(row.t), TestosteroneUnit.ng_dL),
    );
    await _insert(db, 'blood_tests', test.toMap());
  }
}

Future<void> _insertSupplies(Database db) async {
  final vial = MedicationSupplyItem(
    id: 401,
    name: 'Estradiol Enanthate 20 mg/mL',
    totalDose: _d('200'),
    usedDose: _d('40'),
    concentration: _d('20'),
    molecule: KnownMolecules.estradiol,
    administrationRoute: AdministrationRoute.injection,
    ester: Ester.enanthate,
  );

  final gel = MedicationSupplyItem(
    id: 402,
    name: 'Estradiol gel 0.06%',
    totalDose: _d('80'),
    usedDose: _d('25'),
    concentration: _d('0.6'),
    molecule: KnownMolecules.estradiol,
    administrationRoute: AdministrationRoute.gel,
  );

  final syringes = GenericSupply(
    id: 403,
    name: 'Syringes',
    amount: 30,
    genericSupplyType: GenericSupplyType.syringe,
  );

  final needles = GenericSupply(
    id: 404,
    name: 'Needles',
    amount: 25,
    genericSupplyType: GenericSupplyType.needle,
  );

  for (final item in <SupplyItem>[vial, gel, syringes, needles]) {
    await _insert(db, 'supply_items', item.toMap());
  }
}
