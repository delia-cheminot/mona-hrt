import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/generic_supply_item.dart';

GenericSupply makeGeneric({
  int id = 1,
  String name = 'Generic',
  int amount = 1,
}) {
  return GenericSupply(
    id: id,
    name: name,
    amount: amount,
    genericSupplyType: GenericSupplyType.syringe,
  );
}

void main() {
  group('GenericSupply', () {
    group('toMap / fromMap', () {
      test('round-trips all fields', () {
        // Arrange
        final original = makeGeneric(
          id: 42,
          name: 'Syringes',
          amount: 10,
        );

        // Act
        final result = GenericSupplyMapper.fromMap(original.toMap());

        // Assert
        expect(
          result,
          isA<GenericSupply>()
              .having((s) => s.id, 'id', original.id)
              .having((s) => s.name, 'name', original.name)
              .having((s) => s.amount, 'amount', original.amount),
        );
      });
    });

    group('copyWith', () {
      test('replaces only the provided fields', () {
        // Arrange
        final original = makeGeneric(name: 'Original', amount: 5);

        // Act
        final result = original.copyWith(name: 'Updated');

        // Assert
        final expected = makeGeneric(name: 'Updated', amount: 5);
        expect(result, expected);
      });

      test('keeps existing values when no overrides are provided', () {
        // Arrange
        final original = makeGeneric(
          id: 7,
          name: 'Original',
          amount: 5,
        );

        // Act
        final result = original.copyWith();

        // Assert
        expect(
          result,
          isA<GenericSupply>()
              .having((s) => s.id, 'id', original.id)
              .having((s) => s.name, 'name', original.name)
              .having((s) => s.amount, 'amount', original.amount),
        );
      });
    });
  });
}
