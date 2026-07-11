import 'package:dart_mappable/dart_mappable.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/util/validators.dart';

part 'generic_supply_item.mapper.dart';

@MappableEnum()
enum GenericSupplyType {
  syringe,
  wipe,
  needle,
  gloves,
  bandage;
}

@MappableClass(discriminatorValue: 'generic')
class GenericSupply extends SupplyItem with GenericSupplyMappable {
  @override
  final int id;
  @override
  final String name;
  final int amount;
  final GenericSupplyType genericSupplyType;

  GenericSupply({
    int? id,
    required this.name,
    required this.amount,
    required this.genericSupplyType,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch;

  // coverage:ignore-start
  static String? validateAmount(String? value) => requiredPositiveInt(value);
  // coverage:ignore-end
}
