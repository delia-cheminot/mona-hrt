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
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';

import '../fixtures.dart';

@GenerateNiceMocks([
  MockSpec<MedicationIntakeProvider>(),
  MockSpec<SupplyItemProvider>(),
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
  late MedicationIntakeManager manager;

  setUp(() {
    mockMedicationIntakeProvider = MockMedicationIntakeProvider();
    mockSupplyItemProvider = MockSupplyItemProvider();
    manager = MedicationIntakeManager(
        mockMedicationIntakeProvider, mockSupplyItemProvider);
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
          final supplyItem = aMedicationSupplyItem();

          // Act
          try {
            await manager.takeMedication(
              takenDose: Decimal.parse('2'),
              takenDateTime: localDate,
              schedule: schedule,
              supplyItem: supplyItem,
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
        final supplyItemId = 99;
        final scheduleId = 42;

        setUp(() async {
          // Arrange
          final supplyItem = aMedicationSupplyItem(
            id: supplyItemId,
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
            supplyItem: supplyItem,
            schedule: schedule,
            side: InjectionSide.right,
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

        test('propagates side to the intake', () {
          // Assert
          expect(addedIntake.side, InjectionSide.right);
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

        test('sets supplyItemId from the supplyItem', () {
          // Assert
          expect(addedIntake.supplyItemId, supplyItemId);
        });

        test('sets notes on the intake', () {
          // Assert
          expect(addedIntake.notes, notes);
        });
      });

      group('null supplyItem', () {
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
            supplyItem: null,
            schedule: schedule,
          );
        });

        test('sets supplyItemId on the intake to null', () {
          // Assert
          expect(addedIntake.supplyItemId, isNull);
        });

        test('does not call the supply provider', () {
          // Assert
          verifyNever(mockSupplyItemProvider.updateItem(any));
        });
      });

      group('GenericSupply', () {
        late MedicationIntake addedIntake;
        late GenericSupply updatedSupplyItem;
        final supplyItem = aGenericSupply(id: 7, amount: 5);

        setUp(() async {
          // Arrange
          final schedule = aMedicationSchedule(
            administrationRoute: AdministrationRoute.injection,
          );
          final date = DateTime.utc(2025, 9, 14, 12, 0);

          when(mockMedicationIntakeProvider.add(any)).thenAnswer((inv) async {
            addedIntake = inv.positionalArguments.first as MedicationIntake;
          });
          when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
            updatedSupplyItem = inv.positionalArguments.first as GenericSupply;
          });

          // Act
          await manager.takeMedication(
            takenDose: Decimal.parse('2'),
            takenDateTime: date,
            supplyItem: supplyItem,
            schedule: schedule,
            deadSpace: Decimal.parse('100'),
          );
        });

        test('decrements amount by 1', () {
          // Assert
          expect(updatedSupplyItem.amount, supplyItem.amount - 1);
        });

        test('sets supplyItemId on the intake', () {
          // Assert
          expect(addedIntake.supplyItemId, supplyItem.id);
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
              supplyItem: supplyItem,
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
              supplyItem: supplyItem,
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
              supplyItem: supplyItem,
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
              supplyItem: supplyItem,
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
        final intake = aMedicationIntake(supplyItemId: 10);

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
        late GenericSupply updatedSupplyItem;
        final supplyItem = aGenericSupply(id: 7, amount: 5);
        final intake = aMedicationIntake(supplyItemId: supplyItem.id);

        setUp(() async {
          // Arrange
          when(mockSupplyItemProvider.getItemById(supplyItem.id))
              .thenReturn(supplyItem);
          when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
            updatedSupplyItem = inv.positionalArguments.first as GenericSupply;
          });

          // Act
          await manager.deleteIntake(intake);
        });

        test('increments amount by 1', () {
          // Assert
          expect(updatedSupplyItem.amount, supplyItem.amount + 1);
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
          final intake =
              aMedicationIntake(supplyItemId: supplyItem.id, dose: dose);

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
            supplyItemId: supplyItem.id,
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
            supplyItemId: supplyItem.id,
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
            supplyItemId: supplyItem.id,
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
            supplyItemId: supplyItem.id,
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
            supplyItemId: supplyItem.id,
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
          supplyItemId: null,
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
          side: InjectionSide.left,
          supplyItem: null,
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
              .having((i) => i.side, 'side', InjectionSide.left)
              .having((i) => i.notes, 'notes', newNotes)
              .having((i) => i.supplyItemId, 'supplyItemId', isNull),
        );
      });

      group('supply transitions', () {
        Future<List<SupplyItem>> capture({
          SupplyItem? previous,
          SupplyItem? next,
          Decimal? previousDose,
          Decimal? previousWasted,
          Decimal? previousDeadSpace,
          Decimal? newDose,
          Decimal? newWasted,
          Decimal? newDeadSpace,
        }) async {
          final intake = aMedicationIntake(
            supplyItemId: previous?.id,
            dose: previousDose ?? Decimal.zero,
            wastedAmount: previousWasted,
            deadSpace: previousDeadSpace,
          );
          if (previous != null) {
            when(mockSupplyItemProvider.getItemById(previous.id))
                .thenReturn(previous);
          }
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
            supplyItem: next,
          );
          return updates;
        }

        test('no-op when previous and new are both null', () async {
          expect(await capture(), isEmpty);
        });

        test('no-op when previous and new are the same GenericSupply',
            () async {
          final item = aGenericSupply(amount: 5);
          expect(await capture(previous: item, next: item), isEmpty);
        });

        test('null -> GenericSupply: decrements the new one', () async {
          final next = aGenericSupply(amount: 5);
          expect(
            await capture(next: next),
            [_generic(id: next.id, amount: 4)],
          );
        });

        test('GenericSupply -> null: increments the previous one', () async {
          final previous = aGenericSupply(amount: 5);
          expect(
            await capture(previous: previous),
            [_generic(id: previous.id, amount: 6)],
          );
        });

        test('different GenericSupplies: puts back previous, uses new',
            () async {
          final previous = aGenericSupply(amount: 5);
          final next = aGenericSupply(amount: 2);
          expect(
            await capture(previous: previous, next: next),
            unorderedMatches([
              _generic(id: previous.id, amount: 6),
              _generic(id: next.id, amount: 1),
            ]),
          );
        });

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
              next: next,
              newDose: Decimal.parse('2'),
              newWasted: Decimal.parse('0.5'),
            ),
            [_medication(id: next.id, usedDose: '8')],
          );
        });

        test(
            'null -> MedicationSupplyItem with deadSpace: increases usedDose by'
            ' takenDose + (concentration x wastedAmount) + (concentration x deadSpace x 0.001)',
            () async {
          final next = aMedicationSupplyItem(
            usedDose: Decimal.parse('1'),
            concentration: Decimal.parse('10'),
          );
          // 1 + 2 + 0.5 x 10 + 100 x 0.001 x 10 = 9.
          expect(
            await capture(
              next: next,
              newDose: Decimal.parse('2'),
              newWasted: Decimal.parse('0.5'),
              newDeadSpace: Decimal.parse('100'),
            ),
            [_medication(id: next.id, usedDose: '9')],
          );
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
              previous: previous,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
            ),
            [_medication(id: previous.id, usedDose: '3')],
          );
        });

        test(
            'MedicationSupplyItem with deadSpace -> null: rolls back usedDose by'
            ' the previous used dose including deadSpace', () async {
          final previous = aMedicationSupplyItem(
            usedDose: Decimal.parse('10'),
            concentration: Decimal.parse('10'),
          );
          // 10 - (2 + 0.5 x 10 + 100 x 0.001 x 10) = 2.
          expect(
            await capture(
              previous: previous,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
              previousDeadSpace: Decimal.parse('100'),
            ),
            [_medication(id: previous.id, usedDose: '2')],
          );
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
              previous: item,
              next: item,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
              newDose: Decimal.parse('3'),
              newWasted: Decimal.parse('0.2'),
            ),
            [_medication(id: item.id, usedDose: '8')],
          );
        });

        test(
            'same MedicationSupplyItem with changed deadSpace: adjusts usedDose'
            ' by the delta including deadSpace', () async {
          final item = aMedicationSupplyItem(
            totalDose: Decimal.parse('100'),
            usedDose: Decimal.parse('20'),
            concentration: Decimal.parse('10'),
          );
          // old: 2 + 0.5 x 10 + 100 x 0.001 x 10 = 8
          // new: 3 + 0.2 x 10 + 50 x 0.001 x 10 = 5.5
          // 20 + (5.5 - 8) = 17.5
          expect(
            await capture(
              previous: item,
              next: item,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
              previousDeadSpace: Decimal.parse('100'),
              newDose: Decimal.parse('3'),
              newWasted: Decimal.parse('0.2'),
              newDeadSpace: Decimal.parse('50'),
            ),
            [_medication(id: item.id, usedDose: '17.5')],
          );
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
              previous: previous,
              next: next,
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

        test(
            'GenericSupply -> MedicationSupplyItem: puts back the generic and'
            ' uses dose on the new item', () async {
          final previous = aGenericSupply(amount: 5);
          final next = aMedicationSupplyItem(
            usedDose: Decimal.parse('4'),
            concentration: Decimal.parse('10'),
          );
          // 4 + (3 + 0.2 x 10) = 9.
          expect(
            await capture(
              previous: previous,
              next: next,
              newDose: Decimal.parse('3'),
              newWasted: Decimal.parse('0.2'),
            ),
            unorderedMatches([
              _generic(id: previous.id, amount: 6),
              _medication(id: next.id, usedDose: '9'),
            ]),
          );
        });

        test(
            'MedicationSupplyItem -> GenericSupply: rolls back the medication'
            ' and uses the new generic', () async {
          final previous = aMedicationSupplyItem(
            usedDose: Decimal.parse('10'),
            concentration: Decimal.parse('10'),
          );
          final next = aGenericSupply(amount: 5);
          // 10 - (2 + 0.5 x 10) = 3.
          expect(
            await capture(
              previous: previous,
              next: next,
              previousDose: Decimal.parse('2'),
              previousWasted: Decimal.parse('0.5'),
            ),
            unorderedMatches([
              _medication(id: previous.id, usedDose: '3'),
              _generic(id: next.id, amount: 4),
            ]),
          );
        });
      });
    });

    group('getNextSide', () {
      test('returns right when last injection side is left', () {
        // Arrange
        final firstIntake = MedicationIntake(
          id: 1,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 14, 12, 0),
          takenTimeZone: 'Etc/UTC',
          scheduleId: 42,
          side: InjectionSide.left,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        );
        when(mockMedicationIntakeProvider.getLastTakenInjectionIntake())
            .thenReturn(firstIntake);

        // Act
        final InjectionSide nextSide = manager.getNextSide();

        // Assert
        expect(nextSide, InjectionSide.right);
      });

      test('returns left when last injection side is right', () {
        // Arrange
        final lastIntake = MedicationIntake(
          id: 2,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 15, 12, 0),
          takenTimeZone: 'Etc/UTC',
          scheduleId: 42,
          side: InjectionSide.right,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        );
        when(mockMedicationIntakeProvider.getLastTakenInjectionIntake())
            .thenReturn(lastIntake);

        // Act / Assert
        expect(manager.getNextSide(), InjectionSide.left);
      });

      test('returns left when there is no last injection intake', () {
        // Arrange
        when(mockMedicationIntakeProvider.getLastTakenInjectionIntake())
            .thenReturn(null);

        // Act / Assert
        expect(manager.getNextSide(), InjectionSide.left);
      });

      test('returns left when last injection intake side is null', () {
        // Arrange
        final intake = MedicationIntake(
          id: 3,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 16, 12, 0),
          takenTimeZone: 'Etc/UTC',
          scheduleId: 42,
          side: null,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        );
        when(mockMedicationIntakeProvider.getLastTakenInjectionIntake())
            .thenReturn(intake);

        // Act / Assert
        expect(manager.getNextSide(), InjectionSide.left);
      });

      test(
          'alternates from last injection even when a non-injection intake was taken more recently',
          () {
        // Arrange
        final lastInjection = MedicationIntake(
          id: 4,
          takenDose: Decimal.parse('2.5'),
          takenDateTime: DateTime.utc(2025, 9, 14, 12, 0),
          takenTimeZone: 'Etc/UTC',
          scheduleId: 42,
          side: InjectionSide.left,
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.injection,
        );
        when(mockMedicationIntakeProvider.getLastTakenInjectionIntake())
            .thenReturn(lastInjection);

        // Act / Assert
        expect(manager.getNextSide(), InjectionSide.right);
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
