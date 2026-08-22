const int oldestImportableVersion = 4;

const String _supplyItemsV4 = '''
    CREATE TABLE supply_items(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      totalDose TEXT NOT NULL,
      usedDose TEXT NOT NULL,
      concentration TEXT NOT NULL,
      name TEXT NOT NULL,
      quantity INTEGER NOT NULL,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT
    )
    ''';

const String _medicationIntakesV4 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledDateTime TEXT NOT NULL,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      dose TEXT NOT NULL,
      scheduleId INTEGER,
      side TEXT,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT
    )
    ''';

const String _medicationSchedulesV4 = '''
    CREATE TABLE medication_schedules(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      dose TEXT NOT NULL,
      intervalDays INTEGER NOT NULL,
      startDate TEXT NOT NULL,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      notificationTimes TEXT NOT NULL
    )
    ''';

const String _bloodTestsV4 = '''
    CREATE TABLE blood_tests(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dateTime TEXT NOT NULL,
      timeZone TEXT NOT NULL,
      estradiolLevels TEXT,
      testosteroneLevels TEXT
    )
    ''';

const String _medicationIntakesV5 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledDateTime TEXT NOT NULL,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      dose TEXT NOT NULL,
      scheduleId INTEGER,
      side TEXT,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      supplyItemId INTEGER,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _supplyItemsV6 = '''
    CREATE TABLE supply_items(
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
    ''';

const String _bloodTestsV7 = '''
    CREATE TABLE blood_tests(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dateTime TEXT NOT NULL,
      timeZone TEXT NOT NULL,
      estradiolLevels TEXT,
      testosteroneLevels TEXT,
      estradiolUnit TEXT,
      testosteroneUnit TEXT
    )
    ''';

const String _medicationIntakesv7 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledDateTime TEXT NOT NULL,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      dose TEXT NOT NULL,
      scheduleId INTEGER,
      side TEXT,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _supplyItemsV7 = '''
    CREATE TABLE supply_items(
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
    ''';

const String _medicationSchedulesV8 = '''
    CREATE TABLE medication_schedules(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      dose TEXT NOT NULL,
      startDate TEXT NOT NULL,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      schedulingStrategy TEXT NOT NULL
    )
    ''';

const String _medicationIntakesV8 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      dose TEXT NOT NULL,
      scheduleId INTEGER,
      side TEXT,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      scheduledTime TEXT,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _supplyItemsV10 = '''
    CREATE TABLE supply_items(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT NOT NULL,
      name TEXT NOT NULL,
      totalDose TEXT,
      usedDose TEXT,
      concentration TEXT,
      moleculeJson TEXT,
      administrationRouteName TEXT,
      esterName TEXT,
      amount INTEGER,
      genericSupplyType TEXT
    )
    ''';

const String _medicationIntakesV11 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledTime TEXT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      dose TEXT NOT NULL,
      wastedAmount TEXT,
      scheduleId INTEGER,
      side TEXT,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _medicationIntakesV12 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledTime TEXT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      dose TEXT NOT NULL,
      wastedAmount TEXT,
      deadSpace TEXT,
      scheduleId INTEGER,
      side TEXT,
      moleculeJson TEXT NOT NULL,
      administrationRouteName TEXT NOT NULL,
      esterName TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _supplyItemsV13 = '''
    CREATE TABLE supply_items(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT NOT NULL,
      name TEXT NOT NULL,
      totalDose TEXT,
      usedDose TEXT,
      concentration TEXT,
      molecule TEXT,
      administrationRoute TEXT,
      ester TEXT,
      amount INTEGER,
      genericSupplyType TEXT
    )
    ''';

const String _medicationIntakesV13 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledTime TEXT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      takenDose TEXT NOT NULL,
      wastedAmount TEXT,
      deadSpace TEXT,
      scheduleId INTEGER,
      side TEXT,
      molecule TEXT NOT NULL,
      administrationRoute TEXT NOT NULL,
      ester TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _medicationSchedulesV13 = '''
    CREATE TABLE medication_schedules(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      dose TEXT NOT NULL,
      startDate TEXT NOT NULL,
      molecule TEXT NOT NULL,
      administrationRoute TEXT NOT NULL,
      ester TEXT,
      scheduling TEXT NOT NULL
    )
    ''';

const String _medicationIntakesV14 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledTime TEXT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      takenDose TEXT NOT NULL,
      wastedAmount TEXT,
      deadSpace TEXT,
      scheduleId INTEGER,
      molecule TEXT NOT NULL,
      administrationRoute TEXT NOT NULL,
      ester TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      placements TEXT NOT NULL,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL
    )
    ''';

const String _medicationIntakesV15 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledTime TEXT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      takenDose TEXT NOT NULL,
      wastedAmount TEXT,
      deadSpace TEXT,
      scheduleId INTEGER,
      molecule TEXT NOT NULL,
      administrationRoute TEXT NOT NULL,
      ester TEXT,
      supplyItemId INTEGER,
      notes TEXT,
      placements TEXT NOT NULL,
      FOREIGN KEY (supplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL,
      FOREIGN KEY (scheduleId) REFERENCES medication_schedules(id) ON DELETE SET NULL
    )
    ''';

const String _medicationIntakesV16 = '''
    CREATE TABLE medication_intakes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      scheduledTime TEXT,
      takenDateTime TEXT,
      takenTimeZone TEXT,
      takenDose TEXT NOT NULL,
      wastedAmount TEXT,
      deadSpace TEXT,
      scheduleId INTEGER,
      molecule TEXT NOT NULL,
      administrationRoute TEXT NOT NULL,
      ester TEXT,
      medicationSupplyItemId INTEGER,
      genericSupplyItemIds TEXT NOT NULL,
      notes TEXT,
      placements TEXT NOT NULL,
      FOREIGN KEY (medicationSupplyItemId) REFERENCES supply_items(id) ON DELETE SET NULL,
      FOREIGN KEY (scheduleId) REFERENCES medication_schedules(id) ON DELETE SET NULL
    )
    ''';

const String _bloodTestsV18 = '''
    CREATE TABLE blood_tests(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      dateTime TEXT NOT NULL,
      timeZone TEXT NOT NULL,
      estradiolLevels TEXT,
      testosteroneLevels TEXT
    )
    ''';

const Map<int, List<String>> _historicalSchemas = {
  4: [
    _supplyItemsV4,
    _medicationIntakesV4,
    _medicationSchedulesV4,
    _bloodTestsV4,
  ],
  5: [
    _supplyItemsV4,
    _medicationIntakesV5,
    _medicationSchedulesV4,
    _bloodTestsV4,
  ],
  6: [
    _supplyItemsV6,
    _medicationIntakesV5,
    _medicationSchedulesV4,
    _bloodTestsV4,
  ],
  7: [
    _supplyItemsV7,
    _medicationIntakesv7,
    _medicationSchedulesV4,
    _bloodTestsV7,
  ],
  8: [
    _supplyItemsV7,
    _medicationIntakesV8,
    _medicationSchedulesV8,
    _bloodTestsV7,
  ],
  9: [
    _supplyItemsV7,
    _medicationIntakesV8,
    _medicationSchedulesV8,
    _bloodTestsV7,
  ],
  10: [
    _supplyItemsV10,
    _medicationIntakesV8,
    _medicationSchedulesV8,
    _bloodTestsV7,
  ],
  11: [
    _supplyItemsV10,
    _medicationIntakesV11,
    _medicationSchedulesV8,
    _bloodTestsV7,
  ],
  12: [
    _supplyItemsV10,
    _medicationIntakesV12,
    _medicationSchedulesV8,
    _bloodTestsV7,
  ],
  13: [
    _supplyItemsV13,
    _medicationIntakesV13,
    _medicationSchedulesV13,
    _bloodTestsV7,
  ],
  14: [
    _supplyItemsV13,
    _medicationIntakesV14,
    _medicationSchedulesV13,
    _bloodTestsV7,
  ],
  15: [
    _supplyItemsV13,
    _medicationIntakesV15,
    _medicationSchedulesV13,
    _bloodTestsV7,
  ],
  16: [
    _supplyItemsV13,
    _medicationIntakesV16,
    _medicationSchedulesV13,
    _bloodTestsV7,
  ],
  17: [
    _supplyItemsV13,
    _medicationIntakesV16,
    _medicationSchedulesV13,
    _bloodTestsV7,
  ],
  18: [
    _supplyItemsV13,
    _medicationIntakesV16,
    _medicationSchedulesV13,
    _bloodTestsV18,
  ],
};

List<String> historicalSchemaFor(int version) {
  final schema = _historicalSchemas[version];
  if (schema == null) {
    throw ArgumentError(
      'No historical schema registered for database version $version',
    );
  }
  return schema;
}
