const String createSupplyItemsTable = '''
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

const String createMedicationIntakesTable = '''
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

const String createMedicationSchedulesTable = '''
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

const String createBloodTestsTable = '''
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
