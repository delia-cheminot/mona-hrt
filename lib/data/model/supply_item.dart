import 'package:dart_mappable/dart_mappable.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/util/validators.dart';

part 'supply_item.mapper.dart';

@MappableClass(
  discriminatorKey: 'type',
  includeSubClasses: [MedicationSupplyItem, GenericSupply],
)
abstract class SupplyItem with SupplyItemMappable {
  int get id;
  String get name;

  // coverage:ignore-start
  static String? validateName(String? value) => requiredString(value);
  // coverage:ignore-end
}
