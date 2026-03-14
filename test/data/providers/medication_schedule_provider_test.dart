import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'generic_repository_mock.dart';

void main() {
  late MedicationScheduleProvider provider;
  late GenericRepositoryMock<MedicationSchedule> repo;

  setUp(() {
    repo = GenericRepositoryMock<MedicationSchedule>(
      withId: (i, id) => MedicationSchedule(
        id: id,
        name: i.name,
        dose: i.dose,
        intervalDays: i.intervalDays,
        molecule: i.molecule,
        administrationRoute: i.administrationRoute,
        ester: i.ester,
        notificationTimes: i.notificationTimes,
      ),
    );
    provider = MedicationScheduleProvider(repository: repo);

    repo.insert(MedicationSchedule(
      id: 1,
      name: 'Estradiol',
      dose: Decimal.parse('2.0'),
      intervalDays: 1,
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.oral,
      notificationTimes: List.empty(),
    ));
    repo.insert(MedicationSchedule(
      id: 2,
      name: 'Spironolactone',
      dose: Decimal.parse('100.0'),
      intervalDays: 1,
      molecule: KnownMolecules.estradiol,
      administrationRoute: AdministrationRoute.oral,
      notificationTimes: List.empty(),
    ));
  });

  group('MedicationScheduleProvider Tests', () {
    test('initialization loads schedules', () async {
      await provider.fetchSchedules();
      expect(provider.schedules.length, repo.items.length);
    });

    test('add inserts a new schedule', () async {
      // Arrange
      final schedule = MedicationSchedule(
        name: 'Progesterone',
        dose: Decimal.parse('200.0'),
        intervalDays: 1,
        molecule: KnownMolecules.progesterone,
        administrationRoute: AdministrationRoute.suppository,
        notificationTimes: List.empty(),
      );

      // Act
      await provider.add(schedule);

      // Assert
      expect(provider.schedules, contains(schedule));
    });

    test('updateSchedule updates an existing item', () async {
      // Arrange
      final scheduleToUpdate = repo.items.first;
      final updatedSchedule = MedicationSchedule(
        id: scheduleToUpdate.id,
        name: scheduleToUpdate.name,
        dose: Decimal.parse('5.0'),
        intervalDays: scheduleToUpdate.intervalDays,
        molecule: KnownMolecules.estradiol,
        administrationRoute: AdministrationRoute.oral,
        notificationTimes: List.empty(),
      );

      // Act
      await provider.updateSchedule(updatedSchedule);

      // Assert
      expect(provider.schedules.first.dose, Decimal.parse('5.0'));
    });

    test('deleteScheduleFromId removes the item', () async {
      // Act
      await provider.deleteScheduleFromId(1);

      // Assert
      expect(
        [provider.schedules.length, provider.schedules.first.id],
        [1, 2],
      );
    });

    test('deleteSchedule removes the item by object', () async {
      // Arrange
      final scheduleToDelete = repo.items.first;

      // Act
      await provider.deleteSchedule(scheduleToDelete);

      // Assert
      expect(
        [provider.schedules.length, provider.schedules.first.id],
        [1, 2],
      );
    });
  });
}
