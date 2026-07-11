import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mona/controllers/supply_item_manager.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import '../mocks/mocks.mocks.dart';

void main() {
  late SupplyItemManager manager;
  late MockSupplyItemProvider mockSupplyItemProvider;

  setUp(() {
    mockSupplyItemProvider = MockSupplyItemProvider();
    manager = SupplyItemManager(mockSupplyItemProvider);
  });

  group('SupplyItemManager', () {
    group('useDose', () {
      late MedicationSupplyItem item;

      setUp(() {
        item = MedicationSupplyItem(
          name: 'h',
          totalDose: Decimal.parse('10'),
          usedDose: Decimal.parse('5'),
          concentration: Decimal.parse('1'),
          molecule: KnownMolecules.estradiol,
          administrationRoute: AdministrationRoute.oral,
        );

        when(mockSupplyItemProvider.updateItem(any)).thenAnswer((_) async {});
      });
      test('should use amount correctly', () async {
        await manager.useDose(item, Decimal.parse('5'));

        final captured = verify(
          mockSupplyItemProvider.updateItem(captureAny),
        ).captured.first as MedicationSupplyItem;

        expect(captured.usedDose, Decimal.parse('10'));
      });

      test(
          'should clamp dose when using more than available and update provider',
          () async {
        await manager.useDose(item, Decimal.parse('6'));

        final updated = (verify(mockSupplyItemProvider.updateItem(captureAny))
            .captured
            .first as MedicationSupplyItem);

        expect(updated.usedDose, Decimal.parse('10'));
      });

      test(
          'should clamp dose when putting back more than the maximum quantity of a supply and update provider',
          () async {
        await manager.useDose(item, Decimal.parse('-6'));

        final updated = (verify(mockSupplyItemProvider.updateItem(captureAny))
            .captured
            .first as MedicationSupplyItem);

        expect(updated.usedDose, Decimal.parse('0'));
      });

      test('use zero amount', () async {
        await manager.useDose(item, Decimal.zero);

        expect(item.usedDose, Decimal.parse('5'));
        verifyNever(mockSupplyItemProvider.updateItem(item));
      });
    });

    group('use', () {
      test('decrements amount by 1', () async {
        // Arrange
        late GenericSupply updatedItem;
        final item = GenericSupply(
            id: 7,
            name: 'Syringe',
            amount: 5,
            genericSupplyType: GenericSupplyType.syringe);
        when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
          updatedItem = inv.positionalArguments.first as GenericSupply;
        });

        // Act
        await manager.use(item);

        // Assert
        expect(updatedItem.amount, item.amount - 1);
      });
    });

    group('putBack', () {
      test('increments amount by 1', () async {
        // Arrange
        late GenericSupply updatedItem;
        final item = GenericSupply(
            id: 7,
            name: 'Syringe',
            amount: 5,
            genericSupplyType: GenericSupplyType.syringe);
        when(mockSupplyItemProvider.updateItem(any)).thenAnswer((inv) async {
          updatedItem = inv.positionalArguments.first as GenericSupply;
        });

        // Act
        await manager.putBack(item);

        // Assert
        expect(updatedItem.amount, item.amount + 1);
      });
    });

    group('switchDoses', () {
      late MedicationSupplyItem baseItem;
      late MedicationSupplyItem nextItem;

      setUp(() {
        baseItem = MedicationSupplyItem(
          id: 0,
          name: 'progesterone',
          totalDose: Decimal.parse('30'),
          usedDose: Decimal.parse('10'),
          concentration: Decimal.parse('1'),
          molecule: KnownMolecules.progesterone,
          administrationRoute: AdministrationRoute.oral,
        );

        nextItem = baseItem.copyWith(id: 1);

        when(mockSupplyItemProvider.updateItem(any)).thenAnswer((_) async {});
      });

      test('previousItem is null and nextItem is null', () async {
        manager.switchDoses(null, null, Decimal.ten, Decimal.zero);

        verifyNever(mockSupplyItemProvider.updateItem(any));
      });

      test('previousItem is null and nextItem is valid', () async {
        await manager.switchDoses(
            null, nextItem, Decimal.one, Decimal.parse('2'));

        final captured = verify(mockSupplyItemProvider.updateItem(captureAny))
            .captured
            .first as MedicationSupplyItem;

        expect(captured.usedDose, Decimal.parse('12'));
      });

      test('previousItem is valid and nextItem is null', () async {
        await manager.switchDoses(
            baseItem, null, Decimal.one, Decimal.parse('2'));

        final captured = verify(mockSupplyItemProvider.updateItem(captureAny))
            .captured
            .first as MedicationSupplyItem;

        expect(captured.usedDose, Decimal.parse('9'));
      });

      test('previousItem and nextItem are the same', () async {
        manager.switchDoses(
            baseItem, baseItem, Decimal.parse('6'), Decimal.parse('7'));

        final captured = verify(mockSupplyItemProvider.updateItem(captureAny))
            .captured
            .first as MedicationSupplyItem;

        expect(captured.usedDose, Decimal.parse('11'));
      });

      test('previousItem and nextItem are different and both valid', () async {
        await manager.switchDoses(
            baseItem, nextItem, Decimal.parse('6'), Decimal.parse('7'));

        final captured = verify(mockSupplyItemProvider.updateItem(captureAny))
            .captured
            .cast<MedicationSupplyItem>();

        expect(captured.length, 2);
        final prev = captured.firstWhere((e) => e.id == baseItem.id);
        final next = captured.firstWhere((e) => e.id == nextItem.id);

        expect(prev.usedDose, Decimal.parse('4'));
        expect(next.usedDose, Decimal.parse('17'));
      });
    });
  });
}
