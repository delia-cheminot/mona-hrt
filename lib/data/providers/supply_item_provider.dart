import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/services/repository.dart';

class SupplyItemProvider extends ChangeNotifier {
  List<SupplyItem> _items = [];
  bool _isLoading = true;
  final Repository<SupplyItem> repository;

  static final defaultRepository = Repository<SupplyItem>(
    tableName: 'supply_items',
    toMap: (item) => item.toMap(),
    fromMap: (map) => SupplyItemMapper.fromMap(Map<String, dynamic>.from(map)),
  );

  bool get isLoading => _isLoading;

  List<SupplyItem> get items => _items;

  List<MedicationSupplyItem> get medicationItems =>
      _items.whereType<MedicationSupplyItem>().toList();

  List<GenericSupply> get genericItems =>
      _items.whereType<GenericSupply>().toList();

  List<MedicationSupplyItem> get medicationItemsOrderedByRatio =>
      [...medicationItems]..sort(
          (a, b) => a.getRatio().compareTo(b.getRatio()),
        );

  List<SupplyItem> get allItemsOrderedByName => [..._items]
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  List<SupplyItem> get medicationItemsOrderedByName => medicationItems
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  List<SupplyItem> get genericItemsOrderedByName => genericItems
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  SupplyItem? getItemById(int? id) {
    try {
      return items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  SupplyItemProvider({Repository<SupplyItem>? repository})
      : repository = repository ?? defaultRepository {
    _init();
  }

  Future<void> _init() async {
    _items = await repository.getAll();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchItems() async {
    _items = await repository.getAll();
    notifyListeners();
  }

  MedicationSupplyItem? getMostUsedItemForMedication(Molecule molecule,
      AdministrationRoute administrationRoute, Ester? ester) {
    if (medicationItems.isEmpty) return null;

    final filtered = medicationItemsOrderedByRatio.where(
      (item) =>
          item.molecule == molecule &&
          item.administrationRoute == administrationRoute &&
          item.ester == ester,
    );

    return filtered.isEmpty ? null : filtered.first;
  }

  List<MedicationSupplyItem> getItemsForMedication(Molecule molecule,
      AdministrationRoute administrationRoute, Ester? ester) {
    if (medicationItems.isEmpty) return [];

    return medicationItemsOrderedByRatio
        .where(
          (item) =>
              item.molecule == molecule &&
              item.administrationRoute == administrationRoute &&
              item.ester == ester,
        )
        .toList();
  }

  Future<void> deleteItem(SupplyItem item) async {
    await repository.delete(item.id);
    await fetchItems();
  }

  Future<void> add(SupplyItem supplyItem) async {
    await repository.insert(supplyItem);
    await fetchItems();
  }

  Future<void> updateItem(SupplyItem item) async {
    await repository.update(item, item.id);
    await fetchItems();
  }
}
