import 'package:decimal/decimal.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mona/controllers/medication_intake_manager.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/services/preferences_service.dart';

import '../fixtures.dart';

@GenerateNiceMocks([
  MockSpec<MedicationIntakeProvider>(),
  MockSpec<SupplyItemProvider>(),
  MockSpec<PreferencesService>(),
])
import 'medication_intake_manager_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
    const MethodChannel('flutter_timezone'),
    (MethodCall call) async {
      if (call.method == 'getLocalTimezone') return 'UTC';
      return null;
    },
  );

  late MockMedicationIntakeProvider mockMedicationIntakeProvider;
  late MockSupplyItemProvider mockSupplyItemProvider;
  late MockPreferencesService mockPreferencesService;
  late MedicationIntakeManager manager;

  setUp(() {
    mockMedicationIntakeProvider = MockMedicationIntakeProvider();
    mockSupplyItemProvider = MockSupplyItemProvider();
    mockPreferencesService = MockPreferencesService();
    when(mockPreferencesService.placementsList).thenReturn(const [
      PresetPlacement(PlacementPreset.left),
      PresetPlacement(PlacementPreset.right),
    ]);
    when(mockPreferencesService.placementSuggestionPerSchedule)
        .thenReturn(false);
    manager = MedicationIntakeManager(mockMedicationIntakeProvider,
        mockSupplyItemProvider, mockPreferencesService);
  });

  group('MedicationIntakeManager', () {
    group('takeMedication', () {
      group('takenDateTime validation', () {
        final localDate = DateTime(2025, 9, 14, 12, 0);

        test('throws ArgumentError when takenDateTime is not UTC', () async {
          // Arrange
          final schedule = aMedicationSchedule();

          // Act / Assert
          await expectLater(
            manager.takeMedication(
              takenDose: Decimal.parse('2'),
              takenDateTime: localDate,
              schedule: schedule,
            ),
            throwsArgumentError,
          );
        });

        test('does not add an intake when takenDateTime is not UTC', () async {
          // Arrange
          final schedule = aMedicationSchedule();

          // Act
          try {
            await manager.takeMedication(
              takenDose: Decimal.parse('2'),
              takenDateTime: localDate,
              schedule: schedule,
            );
          } on ArgumentError {/* swallowed */}

          // Assert
          verifyNever(mockMedicationIntakeProvider.add(any));
        });

        test('does not update the supply item when takenDateTime is not UTC',
            () async {
          // Arrange
          final schedule = aMedicationSchedule();
          final medicationItem = aMedicationSupplyItem();

          // Act
          try {
            await manager.takeMedication(
              takenDose: Decimal.parse('2'),
              takenDateTime: localDate,
              schedule: schedule,
              medicationItem: medicationItem,
            );
          } on ArgumentError {/* swallowed */}

          // Assert
          verifyNever(mockSupplyItemProvider.updateItem(any));
        });
      });

      group('MedicationIntake creation', () {
        late MedicationIntake addedIntake;
        final dose = Decimal.parse('3');
        final takenDate = DateTime.utc(2025, 9, 14, 12, 0);
        final notes = 'yummy';
        final medicationItemId = 99;
        final scheduleId = 42;

        setUp(() async {
          // Arrange
          final medicationItem = aMedicationSupplyItem(
            id: medicationItemId,
            administrationRoute: AdministrationRoute.injection,
            ester: Ester.enanthate,
          );
          final schedule = aMedicationSchedule(
            id: scheduleId,
            dose: dose,
            administrationRoute: AdministrationRoute.injection,
            ester: Ester.enanthate,
          );

          when(mockMedicationIntakeProvider.add(any)).thenAnswer((inv) async {
            addedIntake = inv.positionalArguments.first as MedicationIntake;
          });

          // Act
          await manager.takeMedication(
            takenDose: dose,
            takenDateTime: takenDate,
            medicationItem: medicationItem,
            schedule: schedule,
            placements: [aPlacement(preset: PlacementPreset.leftThigh)],
            notes: notes,
          );
        });

        test('marks the intake as taken', () {
          // Assert
          expect(addedIntake.isTaken, isTrue);
        });

        test('propagates dose to the intake', () {
          // Assert
          expect(addedIntake.takenDose, dose);
        });

        test('propagates takenDateTime to the intake', () {
          // Assert
          expect(addedIntake.takenDateTime, takenDate);
        });

        test('sets takenTimeZone from the local timezone', () {
          // Assert
          expect(addedIntake.takenTimeZone, 'UTC');
        });

        test('propagates placements to the intake', () {
          // Assert
          expect(addedIntake.placements,
              [aPlacement(preset: PlacementPreset.leftThigh)]);
        });

        test('propagates scheduleId from the schedule', () {
          // Assert
          expect(addedIntake.scheduleId, scheduleId);
        });

        test('propagates molecule from the schedule', () {
          // Assert
          expect(addedIntake.molecule, KnownMolecules.estradiol);
        });

        test('propagates administrationRoute from the schedule', () {
          // Assert
          expect(
              addedIntake.administrationRoute, AdministrationRoute.injection);
        });

        test('propagates ester from the schedule', () {
          // Assert
          expect(addedIntake.ester, Ester.enanthate);
        });

        test('sets medicationSupplyItemId from the medicationItem', () {
          // Assert
          expect(addedIntake.medicationSupplyItemId, medicationItemId);
        });

        test('sets notes on the intake', () {
          // Assert
          expect(addedIntake.notes, notes);
        });
      });

      group('no supply items', () {
        late MedicationIntake addedIntake;

        setUp(() async {
          // Arrange
          final schedule = aMedicationSchedule();
          final date = DateTime.utc(2025, 9, 14, 12, 0);

          when(mockMedicationIntakeProvider.add(any)).thenAnswer((inv) async {
            addedIntake = inv.positionalArguments.first as MedicationIntake;
          });

          // Act
          await manager.takeMedication(
            takenDose: Decimal.parse('2'),
            takenDateTime: date,
            schedule: schedule,
          );
        });

        test('sets medicationSupplyItemId on the intake to null', () {
          // Assert
          expect(addedIntake.medicationSupplyItemId, isNull);
        });

        test('sets genericSupplyItemIds on the intake to empty', () {
          // Assert
          expect(addedIntake.genericSupplyItemIds, isEmpty);
        });

        test('does not call the supply provider', () {
          // Assert
          verifyNever(mockSupplyItemProvider.updateItem(any));
        });
      });

      group('generic items', () {
        late MedicationIntake addedIntake;
        final updatedItems = <GenericSupply>[];
        final syringe = aGenericSupply(id: 7, amount: 5);
        final needle = aGenericSupply(id: 8, amount: 3);

        setUp(() async {
          // Arrange
          updatedItems.clear();
          final schedule = aMedicationSchedule(
            administrationRoute: AdministrationRoute.injection,
          );
          final date = DateTime.utc(2025, 9, 14, 12, 0);

          when(mockMedicationIntakeProvider.add(any)).thenAnswer((inv) async {
            addedIntake = inv.positionalArguments.first as MedicationIntake;
          });
          when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
            updatedItems.add(inv.positionalArguments.first as GenericSupply);
          });

          // Act
          await manager.takeMedication(
            takenDose: Decimal.parse('2'),
            takenDateTime: date,
            genericItems: [syringe, needle],
            schedule: schedule,
          );
        });

        test('decrements each generic amount by 1', () {
          // Assert
          expect(
            updatedItems,
            unorderedMatches([
              _generic(id: syringe.id, amount: syringe.amount - 1),
              _generic(id: needle.id, amount: needle.amount - 1),
            ]),
          );
        });

        test('sets genericSupplyItemIds on the intake', () {
          // Assert
          expect(addedIntake.genericSupplyItemIds, [syringe.id, needle.id]);
        });
      });

      group('MedicationSupplyItem', () {
        group('with no deadSpace', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('1'),
            concentration: Decimal.parse('1'),
          );
          final dose = Decimal.parse('2');

          setUp(() async {
            // Arrange
            final schedule = aMedicationSchedule(dose: dose);
            final date = DateTime.utc(2025, 9, 14, 12, 0);

            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.takeMedication(
              takenDose: dose,
              takenDateTime: date,
              medicationItem: supplyItem,
              schedule: schedule,
            );
          });

          test('increases usedDose by the given dose', () {
            // Assert
            expect(updatedSupplyItem.usedDose, supplyItem.usedDose + dose);
          });
        });

        group('with deadSpace > 0', () {
          late MedicationIntake addedIntake;
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('1'),
            concentration: Decimal.parse('10'),
          );
          final dose = Decimal.parse('2');
          // 100 μL x 0.001 mL/μL x concentration 10 = 1 extra dose unit.
          final deadSpace = Decimal.parse('100');
          final expectedExtra = Decimal.parse('1');

          setUp(() async {
            // Arrange
            final schedule = aMedicationSchedule(dose: dose);
            final date = DateTime.utc(2025, 9, 14, 12, 0);

            when(mockMedicationIntakeProvider.add(any)).thenAnswer((inv) async {
              addedIntake = inv.positionalArguments.first as MedicationIntake;
            });
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.takeMedication(
              takenDose: dose,
              takenDateTime: date,
              medicationItem: supplyItem,
              schedule: schedule,
              deadSpace: deadSpace,
            );
          });

          test('adds the deadSpace dose to usedDose', () {
            // Assert
            expect(
              updatedSupplyItem.usedDose,
              supplyItem.usedDose + dose + expectedExtra,
            );
          });

          test('records the original dose (without deadSpace) on the intake',
              () {
            // Assert
            expect(addedIntake.takenDose, dose);
          });

          test('persists deadSpace in μL on the intake', () {
            // Assert
            expect(addedIntake.deadSpace, deadSpace);
          });
        });

        group('with deadSpace == 0', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('1'),
            concentration: Decimal.parse('10'),
          );
          final dose = Decimal.parse('2');

          setUp(() async {
            // Arrange
            final schedule = aMedicationSchedule(dose: dose);
            final date = DateTime.utc(2025, 9, 14, 12, 0);

            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.takeMedication(
              takenDose: dose,
              takenDateTime: date,
              medicationItem: supplyItem,
              schedule: schedule,
              deadSpace: Decimal.zero,
            );
          });

          test('does not adjust usedDose', () {
            // Assert
            expect(updatedSupplyItem.usedDose, supplyItem.usedDose + dose);
          });
        });

        group('with wastedAmount > 0', () {
          late MedicationIntake addedIntake;
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('1'),
            concentration: Decimal.parse('10'),
          );
          final dose = Decimal.parse('2');
          // 0.5 mL x concentration 10 = 5 extra dose units.
          final wastedAmount = Decimal.parse('0.5');
          final expectedExtra = Decimal.parse('5');

          setUp(() async {
            // Arrange
            final schedule = aMedicationSchedule(dose: dose);
            final date = DateTime.utc(2025, 9, 14, 12, 0);

            when(mockMedicationIntakeProvider.add(any)).thenAnswer((inv) async {
              addedIntake = inv.positionalArguments.first as MedicationIntake;
            });
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.takeMedication(
              takenDose: dose,
              takenDateTime: date,
              medicationItem: supplyItem,
              schedule: schedule,
              wastedAmount: wastedAmount,
            );
          });

          test('adds the wasted dose (concentration x mL) to usedDose', () {
            // Assert
            expect(
              updatedSupplyItem.usedDose,
              supplyItem.usedDose + dose + expectedExtra,
            );
          });

          test('persists wastedAmount in mL on the intake', () {
            // Assert
            expect(addedIntake.wastedAmount, wastedAmount);
          });

          test(
              'records the original takenDose (in molecule units) on the intake',
              () {
            // Assert
            expect(addedIntake.takenDose, dose);
          });
        });
      });
    });

    group('deleteIntake', () {
      group('when supply lookup returns null', () {
        final intake = aMedicationIntake(medicationSupplyItemId: 10);

        setUp(() async {
          // Act
          await manager.deleteIntake(intake);
        });

        test('deletes the intake on the provider', () {
          // Assert
          verify(mockMedicationIntakeProvider.deleteIntake(intake)).called(1);
        });

        test('does not call updateItem', () {
          // Assert
          verifyNever(mockSupplyItemProvider.updateItem(any));
        });
      });

      group('GenericSupply', () {
        final updatedItems = <GenericSupply>[];
        final syringe = aGenericSupply(id: 7, amount: 5);
        final needle = aGenericSupply(id: 8, amount: 3);
        final intake = aMedicationIntake(
          genericSupplyItemIds: [syringe.id, needle.id],
        );

        setUp(() async {
          // Arrange
          updatedItems.clear();
          when(mockSupplyItemProvider.getItemsByIds([syringe.id, needle.id]))
              .thenReturn([syringe, needle]);
          when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
            updatedItems.add(inv.positionalArguments.first as GenericSupply);
          });

          // Act
          await manager.deleteIntake(intake);
        });

        test('increments each generic amount by 1', () {
          // Assert
          expect(
            updatedItems,
            unorderedMatches([
              _generic(id: syringe.id, amount: syringe.amount + 1),
              _generic(id: needle.id, amount: needle.amount + 1),
            ]),
          );
        });

        test('deletes the intake on the provider', () {
          // Assert
          verify(mockMedicationIntakeProvider.deleteIntake(intake)).called(1);
        });
      });

      group('MedicationSupplyItem', () {
        group('when intake.dose is within usedDose', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('5'),
          );
          final dose = Decimal.parse('2');
          final intake = aMedicationIntake(
              medicationSupplyItemId: supplyItem.id, dose: dose);

          setUp(() async {
            // Arrange
            when(mockSupplyItemProvider.getItemById(supplyItem.id))
                .thenReturn(supplyItem);
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.deleteIntake(intake);
          });

          test('decreases usedDose by intake.dose', () {
            // Assert
            expect(updatedSupplyItem.usedDose, supplyItem.usedDose - dose);
          });

          test('deletes the intake on the provider', () {
            // Assert
            verify(mockMedicationIntakeProvider.deleteIntake(intake)).called(1);
          });
        });

        group('when intake.dose exceeds usedDose', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('1'),
          );
          final intake = aMedicationIntake(
            medicationSupplyItemId: supplyItem.id,
            dose: Decimal.parse('5'),
          );

          setUp(() async {
            // Arrange
            when(mockSupplyItemProvider.getItemById(supplyItem.id))
                .thenReturn(supplyItem);
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.deleteIntake(intake);
          });

          test('clamps usedDose to zero', () {
            // Assert
            expect(updatedSupplyItem.usedDose, Decimal.zero);
          });
        });

        group('when intake.dose is zero', () {
          final supplyItem = aMedicationSupplyItem(
            usedDose: Decimal.parse('5'),
          );
          final intake = aMedicationIntake(
            medicationSupplyItemId: supplyItem.id,
            dose: Decimal.zero,
          );

          setUp(() async {
            // Arrange
            when(mockSupplyItemProvider.getItemById(supplyItem.id))
                .thenReturn(supplyItem);

            // Act
            await manager.deleteIntake(intake);
          });

          test('does not call updateItem', () {
            // Assert
            verifyNever(mockSupplyItemProvider.updateItem(any));
          });

          test('deletes the intake on the provider', () {
            // Assert
            verify(mockMedicationIntakeProvider.deleteIntake(intake)).called(1);
          });
        });

        group('when intake has a wastedAmount', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            totalDose: Decimal.parse('100'),
            usedDose: Decimal.parse('20'),
            concentration: Decimal.parse('10'),
          );
          final dose = Decimal.parse('2');
          // 0.5 mL x concentration 10 = 5 dose units to put back on top of dose.
          final wastedAmount = Decimal.parse('0.5');
          final expectedRollback = Decimal.parse('7'); // 2 + 5
          final intake = aMedicationIntake(
            medicationSupplyItemId: supplyItem.id,
            dose: dose,
            wastedAmount: wastedAmount,
          );

          setUp(() async {
            // Arrange
            when(mockSupplyItemProvider.getItemById(supplyItem.id))
                .thenReturn(supplyItem);
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.deleteIntake(intake);
          });

          test(
              'decreases usedDose by takenDose + (concentration x wastedAmount)',
              () {
            // Assert
            expect(updatedSupplyItem.usedDose,
                supplyItem.usedDose - expectedRollback);
          });
        });

        group('when intake has a deadSpace', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            totalDose: Decimal.parse('100'),
            usedDose: Decimal.parse('20'),
            concentration: Decimal.parse('10'),
          );
          final dose = Decimal.parse('2');
          // 100 μL x 0.001 mL/μL x concentration 10 = 1 dose unit to put back on top of dose.
          final deadSpace = Decimal.parse('100');
          final expectedRollback = Decimal.parse('3'); // 2 + 1
          final intake = aMedicationIntake(
            medicationSupplyItemId: supplyItem.id,
            dose: dose,
            deadSpace: deadSpace,
          );

          setUp(() async {
            // Arrange
            when(mockSupplyItemProvider.getItemById(supplyItem.id))
                .thenReturn(supplyItem);
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.deleteIntake(intake);
          });

          test(
              'decreases usedDose by takenDose + (concentration x deadSpace x 0.001)',
              () {
            // Assert
            expect(updatedSupplyItem.usedDose,
                supplyItem.usedDose - expectedRollback);
          });
        });

        group('when intake has both wastedAmount and deadSpace', () {
          late MedicationSupplyItem updatedSupplyItem;
          final supplyItem = aMedicationSupplyItem(
            totalDose: Decimal.parse('100'),
            usedDose: Decimal.parse('30'),
            concentration: Decimal.parse('10'),
          );
          final dose = Decimal.parse('2');
          // 0.5 mL x concentration 10 = 5 dose units.
          final wastedAmount = Decimal.parse('0.5');
          // 100 μL x 0.001 mL/μL x concentration 10 = 1 dose unit.
          final deadSpace = Decimal.parse('100');
          final expectedRollback = Decimal.parse('8'); // 2 + 5 + 1
          final intake = aMedicationIntake(
            medicationSupplyItemId: supplyItem.id,
            dose: dose,
            wastedAmount: wastedAmount,
            deadSpace: deadSpace,
          );

          setUp(() async {
            // Arrange
            when(mockSupplyItemProvider.getItemById(supplyItem.id))
                .thenReturn(supplyItem);
            when(mockSupplyItemProvider.updateItem(any))
                .thenAnswer((inv) async {
              updatedSupplyItem =
                  inv.positionalArguments.first as MedicationSupplyItem;
            });

            // Act
            await manager.deleteIntake(intake);
          });

          test(
              'decreases usedDose by takenDose + (concentration x wastedAmount) + (concentration x deadSpace x 0.001)',
              () {
            // Assert
            expect(updatedSupplyItem.usedDose,
                supplyItem.usedDose - expectedRollback);
          });
        });
      });
    });

    group('editIntake', () {
      final takenDate = DateTime.utc(2025, 10, 1, 8, 0);
      test('updates all editable fields and preserves the id', () async {
        // Arrange
        late MedicationIntake updatedIntake;
        final intake = aMedicationIntake(
          id: 1,
          dose: Decimal.parse('2'),
          medicationSupplyItemId: null,
          wastedAmount: null,
          deadSpace: null,
        );
        final newDose = Decimal.parse('3');
        final newWasted = Decimal.parse('0.2');
        final newDeadSpace = Decimal.parse('50');
        final newTimezone = 'Europe/Paris';
        final newNotes = 'edited';

        when(mockMedicationIntakeProvider.updateIntake(any))
            .thenAnswer((inv) async {
          updatedIntake = inv.positionalArguments.first as MedicationIntake;
        });

        // Act
        await manager.editIntake(
          intake,
          takenDose: newDose,
          wastedAmount: newWasted,
          deadSpace: newDeadSpace,
          takenDateTime: takenDate,
          takenTimeZone: newTimezone,
          placements: [aCustomPlacement('belly')],
          medicationItem: null,
          notes: newNotes,
        );

        // Assert
        expect(
          updatedIntake,
          isA<MedicationIntake>()
              .having((i) => i.id, 'id', intake.id)
              .having((i) => i.takenDose, 'takenDose', newDose)
              .having((i) => i.wastedAmount, 'wastedAmount', newWasted)
              .having((i) => i.deadSpace, 'deadSpace', newDeadSpace)
              .having((i) => i.takenDateTime, 'takenDateTime', takenDate)
              .having((i) => i.takenTimeZone, 'takenTimeZone', newTimezone)
              .having((i) => i.placements, 'placements',
                  [aCustomPlacement('belly')])
              .having((i) => i.notes, 'notes', newNotes)
              .having((i) => i.medicationSupplyItemId, 'medicationSupplyItemId',
                  isNull),
        );
      });

      group('supply transitions', () {
        Future<List<SupplyItem>> capture({
          MedicationSupplyItem? previousMedication,
          MedicationSupplyItem? nextMedication,
          List<GenericSupply> previousGenerics = const [],
          List<GenericSupply> nextGenerics = const [],
          Decimal? previousDose,
          Decimal? previousWasted,
          Decimal? previousDeadSpace,
          Decimal? newDose,
          Decimal? newWasted,
          Decimal? newDeadSpace,
        }) async {
          final intake = aMedicationIntake(
            medicationSupplyItemId: previousMedication?.id,
            genericSupplyItemIds:
                previousGenerics.map((generic) => generic.id).toList(),
            dose: previousDose ?? Decimal.zero,
            wastedAmount: previousWasted,
            deadSpace: previousDeadSpace,
          );
          if (previousMedication != null) {
            when(mockSupplyItemProvider.getItemById(previousMedication.id))
                .thenReturn(previousMedication);
          }
          final nextGenericIds = nextGenerics.map((generic) => generic.id);
          final removedGenerics = previousGenerics
              .where((generic) => !nextGenericIds.contains(generic.id))
              .toList();
          when(mockSupplyItemProvider
                  .getItemsByIds(removedGenerics.map((g) => g.id).toList()))
              .thenReturn(removedGenerics);
          final updates = <SupplyItem>[];
          when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
            updates.add(inv.positionalArguments.first as SupplyItem);
          });

          await manager.editIntake(
            intake,
            takenDose: newDose ?? Decimal.zero,
            wastedAmount: newWasted,
            deadSpace: newDeadSpace,
            takenDateTime: takenDate,
            takenTimeZone: 'Etc/UTC',
            medicationItem: nextMedication,
            genericItems: nextGenerics,
          );
          return updates;
        }

        test('no-op when there is no medication and no generics', () async {
          expect(await capture(), isEmpty);
        });

        group('generics', () {
          test('no-op when the generic list is unchanged', () async {
            final item = aGenericSupply(amount: 5);
            expect(
              await capture(
                previousGenerics: [item],
                nextGenerics: [item],
              ),
              isEmpty,
            );
          });

          test('added generic: decrements it', () async {
            final added = aGenericSupply(amount: 5);
            expect(
              await capture(nextGenerics: [added]),
              [_generic(id: added.id, amount: 4)],
            );
          });

          test('removed generic: increments it', () async {
            final removed = aGenericSupply(amount: 5);
            expect(
              await capture(previousGenerics: [removed]),
              [_generic(id: removed.id, amount: 6)],
            );
          });

          test('swapped generic: puts back the removed, uses the added',
              () async {
            final removed = aGenericSupply(amount: 5);
            final added = aGenericSupply(amount: 2);
            expect(
              await capture(
                previousGenerics: [removed],
                nextGenerics: [added],
              ),
              unorderedMatches([
                _generic(id: removed.id, amount: 6),
                _generic(id: added.id, amount: 1),
              ]),
            );
          });

          test('keeps one generic while adding another', () async {
            final kept = aGenericSupply(amount: 5);
            final added = aGenericSupply(amount: 2);
            expect(
              await capture(
                previousGenerics: [kept],
                nextGenerics: [kept, added],
              ),
              [_generic(id: added.id, amount: 1)],
            );
          });
        });

        group('medication', () {
          test(
              'null -> MedicationSupplyItem: increases usedDose by'
              ' takenDose + (concentration x wastedAmount)', () async {
            final next = aMedicationSupplyItem(
              usedDose: Decimal.parse('1'),
              concentration: Decimal.parse('10'),
            );
            // 1 + 2 + 0.5 x 10 = 8.
            expect(
              await capture(
                nextMedication: next,
                newDose: Decimal.parse('2'),
                newWasted: Decimal.parse('0.5'),
              ),
              [_medication(id: next.id, usedDose: '8')],
            );
          });

          test(
              'null -> MedicationSupplyItem with deadSpace: increases usedDose'
              ' by takenDose + (concentration x wastedAmount) + (concentration x deadSpace x 0.001)',
              () async {
            // Arrange
            final next = aMedicationSupplyItem(
              usedDose: Decimal.parse('1'),
              concentration: Decimal.parse('10'),
            );

            // Act
            // 1 + 2 + 0.5 x 10 + 100 x 0.001 x 10 = 9.
            final updates = await capture(
              nextMedication: next,
              newDose: Decimal.parse('2'),
              newWasted: Decimal.parse('0.5'),
              newDeadSpace: Decimal.parse('100'),
            );

            // Assert
            expect(updates, [_medication(id: next.id, usedDose: '9')]);
          });

          test(
              'MedicationSupplyItem -> null: rolls back usedDose by the previous'
              ' used dose', () async {
            final previous = aMedicationSupplyItem(
              usedDose: Decimal.parse('10'),
              concentration: Decimal.parse('10'),
            );
            // 10 - (2 + 0.5 x 10) = 3.
            expect(
              await capture(
                previousMedication: previous,
                previousDose: Decimal.parse('2'),
                previousWasted: Decimal.parse('0.5'),
              ),
              [_medication(id: previous.id, usedDose: '3')],
            );
          });

          test(
              'MedicationSupplyItem with deadSpace -> null: rolls back usedDose'
              ' by the previous used dose including deadSpace', () async {
            // Arrange
            final previous = aMedicationSupplyItem(
              usedDose: Decimal.parse('10'),
              concentration: Decimal.parse('10'),
            );

            // Act
            // 10 - (2 + 0.5 x 10 + 100 x 0.001 x 10) = 2.
            final updates = await capture(
              previousMedication: previous,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
              previousDeadSpace: Decimal.parse('100'),
            );

            // Assert
            expect(updates, [_medication(id: previous.id, usedDose: '2')]);
          });

          test(
              'same MedicationSupplyItem: adjusts usedDose by the delta between'
              ' old and new used dose', () async {
            final item = aMedicationSupplyItem(
              usedDose: Decimal.parse('10'),
              concentration: Decimal.parse('10'),
            );
            // old: 2 + 0.5 x 10 = 7; new: 3 + 0.2 x 10 = 5; 10 + (5 - 7) = 8.
            expect(
              await capture(
                previousMedication: item,
                nextMedication: item,
                previousDose: Decimal.parse('2'),
                previousWasted: Decimal.parse('0.5'),
                newDose: Decimal.parse('3'),
                newWasted: Decimal.parse('0.2'),
              ),
              [_medication(id: item.id, usedDose: '8')],
            );
          });

          test(
              'same MedicationSupplyItem with changed deadSpace: adjusts'
              ' usedDose by the delta including deadSpace', () async {
            // Arrange
            final item = aMedicationSupplyItem(
              totalDose: Decimal.parse('100'),
              usedDose: Decimal.parse('20'),
              concentration: Decimal.parse('10'),
            );

            // Act
            // old: 2 + 0.5 x 10 + 100 x 0.001 x 10 = 8
            // new: 3 + 0.2 x 10 + 50 x 0.001 x 10 = 5.5
            // 20 + (5.5 - 8) = 17.5
            final updates = await capture(
              previousMedication: item,
              nextMedication: item,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
              previousDeadSpace: Decimal.parse('100'),
              newDose: Decimal.parse('3'),
              newWasted: Decimal.parse('0.2'),
              newDeadSpace: Decimal.parse('50'),
            );

            // Assert
            expect(updates, [_medication(id: item.id, usedDose: '17.5')]);
          });

          test(
              'different MedicationSupplyItems: rolls back previous and uses new',
              () async {
            final previous = aMedicationSupplyItem(
              usedDose: Decimal.parse('10'),
              concentration: Decimal.parse('10'),
            );
            final next = aMedicationSupplyItem(
              usedDose: Decimal.parse('4'),
              concentration: Decimal.parse('10'),
            );
            // previous: 10 - (2 + 5) = 3; new: 4 + (3 + 2) = 9.
            expect(
              await capture(
                previousMedication: previous,
                nextMedication: next,
                previousDose: Decimal.parse('2'),
                previousWasted: Decimal.parse('0.5'),
                newDose: Decimal.parse('3'),
                newWasted: Decimal.parse('0.2'),
              ),
              unorderedMatches([
                _medication(id: previous.id, usedDose: '3'),
                _medication(id: next.id, usedDose: '9'),
              ]),
            );
          });
        });

        test(
            'medication and generics change together: rolls back the old'
            ' medication, uses the new one, and swaps the generic', () async {
          final previousMedication = aMedicationSupplyItem(
            usedDose: Decimal.parse('10'),
            concentration: Decimal.parse('10'),
          );
          final nextMedication = aMedicationSupplyItem(
            usedDose: Decimal.parse('4'),
            concentration: Decimal.parse('10'),
          );
          final removedGeneric = aGenericSupply(amount: 5);
          final addedGeneric = aGenericSupply(amount: 2);
          // previous medication: 10 - (2 + 0.5 x 10) = 3.
          // next medication: 4 + (3 + 0.2 x 10) = 9.
          expect(
            await capture(
              previousMedication: previousMedication,
              nextMedication: nextMedication,
              previousGenerics: [removedGeneric],
              nextGenerics: [addedGeneric],
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
              newDose: Decimal.parse('3'),
              newWasted: Decimal.parse('0.2'),
            ),
            unorderedMatches([
              _medication(id: previousMedication.id, usedDose: '3'),
              _medication(id: nextMedication.id, usedDose: '9'),
              _generic(id: removedGeneric.id, amount: 6),
              _generic(id: addedGeneric.id, amount: 1),
            ]),
          );
        });
      });
    });

    group('getOrderedPlacements', () {
      test('orders sites from least- to most-recently used', () {
        // Arrange
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc).thenReturn([
          anInjection(
            takenDateTime: DateTime.utc(2025, 9, 15),
            placements: const [PresetPlacement(PlacementPreset.right)],
          ),
          anInjection(
            takenDateTime: DateTime.utc(2025, 9, 14),
            placements: const [PresetPlacement(PlacementPreset.left)],
          ),
        ]);

        // Act
        final ordered = manager.getOrderedPlacements(scheduleId: 42);

        // Assert
        expect(ordered, const [
          PresetPlacement(PlacementPreset.left),
          PresetPlacement(PlacementPreset.right),
        ]);
      });

      test('puts never-used sites before used ones', () {
        // Arrange
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc).thenReturn([
          anInjection(
            takenDateTime: DateTime.utc(2025, 9, 15),
            placements: const [PresetPlacement(PlacementPreset.left)],
          ),
        ]);

        // Act
        final ordered = manager.getOrderedPlacements(scheduleId: 42);

        // Assert
        expect(ordered, const [
          PresetPlacement(PlacementPreset.right),
          PresetPlacement(PlacementPreset.left),
        ]);
      });

      test('a multi-site intake marks all of its sites used', () {
        // Arrange
        when(mockPreferencesService.placementsList).thenReturn(const [
          PresetPlacement(PlacementPreset.left),
          PresetPlacement(PlacementPreset.right),
          PresetPlacement(PlacementPreset.leftArm),
        ]);
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc).thenReturn([
          anInjection(
            takenDateTime: DateTime.utc(2025, 9, 15),
            placements: const [
              PresetPlacement(PlacementPreset.left),
              PresetPlacement(PlacementPreset.right),
            ],
          ),
        ]);

        // Act
        final ordered = manager.getOrderedPlacements(scheduleId: 42);

        // Assert
        expect(ordered, const [
          PresetPlacement(PlacementPreset.leftArm),
          PresetPlacement(PlacementPreset.left),
          PresetPlacement(PlacementPreset.right),
        ]);
      });

      test('returns an empty list when there are no configured sites', () {
        // Arrange
        when(mockPreferencesService.placementsList).thenReturn(const []);
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc)
            .thenReturn([]);

        // Act
        final ordered = manager.getOrderedPlacements(scheduleId: 42);

        // Assert
        expect(ordered, isEmpty);
      });

      test('per-schedule scope ignores history from other schedules', () {
        // Arrange
        when(mockPreferencesService.placementSuggestionPerSchedule)
            .thenReturn(true);
        when(mockMedicationIntakeProvider.getTakenIntakesDescForSchedule(42))
            .thenReturn([
          anInjection(
            scheduleId: 42,
            takenDateTime: DateTime.utc(2025, 9, 14),
            placements: const [PresetPlacement(PlacementPreset.right)],
          ),
        ]);
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc).thenReturn([
          anInjection(
            scheduleId: 99,
            takenDateTime: DateTime.utc(2025, 9, 16),
            placements: const [PresetPlacement(PlacementPreset.left)],
          ),
        ]);

        // Act
        final ordered = manager.getOrderedPlacements(scheduleId: 42);

        // Assert
        expect(ordered, const [
          PresetPlacement(PlacementPreset.left),
          PresetPlacement(PlacementPreset.right),
        ]);
      });
    });

    group('suggestNextPlacement', () {
      test('returns the most stale site (first of the ordered list)', () {
        // Arrange
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc).thenReturn([
          anInjection(
            takenDateTime: DateTime.utc(2025, 9, 15),
            placements: const [PresetPlacement(PlacementPreset.left)],
          ),
        ]);

        // Act
        final suggestion = manager.suggestNextPlacement(scheduleId: 42);

        // Assert
        expect(suggestion, const PresetPlacement(PlacementPreset.right));
      });

      test('returns null when there are no configured sites', () {
        // Arrange
        when(mockPreferencesService.placementsList).thenReturn(const []);
        when(mockMedicationIntakeProvider.takenIntakesSortedDesc)
            .thenReturn([]);

        // Act
        final suggestion = manager.suggestNextPlacement(scheduleId: 42);

        // Assert
        expect(suggestion, isNull);
      });
    });

    group('suggestMedicationItem', () {
      test('suggests the previous intake vial when it still matches', () {
        // Arrange
        final schedule = aMedicationSchedule(
          id: 42,
          administrationRoute: AdministrationRoute.injection,
          ester: Ester.enanthate,
        );
        final vial = aMedicationSupplyItem(
          id: 7,
          administrationRoute: AdministrationRoute.injection,
          ester: Ester.enanthate,
        );
        when(mockMedicationIntakeProvider.getLastTakenIntakeForSchedule(42))
            .thenReturn(aMedicationIntake(medicationSupplyItemId: 7));
        when(mockSupplyItemProvider.getItemById(7)).thenReturn(vial);

        // Act
        final suggestion = manager.suggestMedicationItem(schedule: schedule);

        // Assert
        expect(suggestion, vial);
      });

      test('suggests the previous intake vial even when it is empty', () {
        // Arrange
        final schedule = aMedicationSchedule(id: 42);
        final emptyVial = aMedicationSupplyItem(
          id: 7,
          totalDose: Decimal.parse('10'),
          usedDose: Decimal.parse('10'),
        );
        when(mockMedicationIntakeProvider.getLastTakenIntakeForSchedule(42))
            .thenReturn(aMedicationIntake(medicationSupplyItemId: 7));
        when(mockSupplyItemProvider.getItemById(7)).thenReturn(emptyVial);

        // Act
        final suggestion = manager.suggestMedicationItem(schedule: schedule);

        // Assert
        expect(suggestion, emptyVial);
      });

      test('falls back to most-used when previous vial no longer matches', () {
        // Arrange
        final schedule = aMedicationSchedule(
          id: 42,
          administrationRoute: AdministrationRoute.injection,
          ester: Ester.enanthate,
        );
        final mismatchedVial = aMedicationSupplyItem(
          id: 7,
          administrationRoute: AdministrationRoute.oral,
        );
        final fallback = aMedicationSupplyItem(
          id: 8,
          administrationRoute: AdministrationRoute.injection,
          ester: Ester.enanthate,
        );
        when(mockMedicationIntakeProvider.getLastTakenIntakeForSchedule(42))
            .thenReturn(aMedicationIntake(medicationSupplyItemId: 7));
        when(mockSupplyItemProvider.getItemById(7))
            .thenReturn(mismatchedVial);
        when(mockSupplyItemProvider.getMostUsedItemForMedication(
                KnownMolecules.estradiol,
                AdministrationRoute.injection,
                Ester.enanthate))
            .thenReturn(fallback);

        // Act
        final suggestion = manager.suggestMedicationItem(schedule: schedule);

        // Assert
        expect(suggestion, fallback);
      });

      test('falls back to most-used when the previous vial was deleted', () {
        // Arrange
        final schedule = aMedicationSchedule(id: 42);
        final fallback = aMedicationSupplyItem(id: 8);
        when(mockMedicationIntakeProvider.getLastTakenIntakeForSchedule(42))
            .thenReturn(aMedicationIntake(medicationSupplyItemId: 7));
        when(mockSupplyItemProvider.getItemById(7)).thenReturn(null);
        when(mockSupplyItemProvider.getMostUsedItemForMedication(
                any, any, any))
            .thenReturn(fallback);

        // Act
        final suggestion = manager.suggestMedicationItem(schedule: schedule);

        // Assert
        expect(suggestion, fallback);
      });

      test('falls back to most-used when there is no history', () {
        // Arrange
        final schedule = aMedicationSchedule(id: 42);
        final fallback = aMedicationSupplyItem(id: 8);
        when(mockMedicationIntakeProvider.getLastTakenIntakeForSchedule(42))
            .thenReturn(null);
        when(mockSupplyItemProvider.getMostUsedItemForMedication(
                any, any, any))
            .thenReturn(fallback);

        // Act
        final suggestion = manager.suggestMedicationItem(schedule: schedule);

        // Assert
        expect(suggestion, fallback);
      });

      test('returns null when nothing matches', () {
        // Arrange
        final schedule = aMedicationSchedule(id: 42);
        when(mockMedicationIntakeProvider.getLastTakenIntakeForSchedule(42))
            .thenReturn(null);
        when(mockSupplyItemProvider.getMostUsedItemForMedication(
                any, any, any))
            .thenReturn(null);

        // Act
        final suggestion = manager.suggestMedicationItem(schedule: schedule);

        // Assert
        expect(suggestion, isNull);
      });
    });
  });
}

TypeMatcher<GenericSupply> _generic({required int id, required int amount}) =>
    isA<GenericSupply>()
        .having((g) => g.id, 'id', id)
        .having((g) => g.amount, 'amount', amount);

TypeMatcher<MedicationSupplyItem> _medication({
  required int id,
  required String usedDose,
}) =>
    isA<MedicationSupplyItem>()
        .having((m) => m.id, 'id', id)
        .having((m) => m.usedDose, 'usedDose', Decimal.parse(usedDose));
