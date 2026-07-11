import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';

MedicationSupplyItem makeMed({
  int id = 1,
  String name = 'Med',
  String totalDose = '100',
  String usedDose = '0',
  String concentration = '1',
  Molecule? molecule,
  AdministrationRoute route = AdministrationRoute.oral,
}) {
  return MedicationSupplyItem(
    id: id,
    name: name,
    totalDose: Decimal.parse(totalDose),
    usedDose: Decimal.parse(usedDose),
    concentration: Decimal.parse(concentration),
    molecule: molecule ?? KnownMolecules.estradiol,
    administrationRoute: route,
  );
}

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
  group('SupplyItem', () {
    group('fromMap', () {
      test('builds a MedicationSupplyItem when type is medication', () {
        // Arrange
        final map = makeMed().toMap();

        // Act
        final result = SupplyItemMapper.fromMap(map);

        // Assert
        expect(result, isA<MedicationSupplyItem>());
      });

      test('builds a GenericSupply when type is generic', () {
        // Arrange
        final map = makeGeneric().toMap();

        // Act
        final result = SupplyItemMapper.fromMap(map);

        // Assert
        expect(result, isA<GenericSupply>());
      });
    });
  });
}
