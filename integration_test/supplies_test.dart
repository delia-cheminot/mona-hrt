// Patrol E2E tests for the Supplies (pharmacy) feature.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/ui/views/supplies/supply_item_card.dart';
import 'package:patrol/patrol.dart';

import 'support/helpers.dart';

// Keys for interaction targets, mirroring the ValueKeys set on the production
// widgets under lib/ui/.

// New item (shared first page): name, type toggle, "Next".
const _newItemName = ValueKey('newItemName');
const _newItemNext = ValueKey('newItemNext');
const _newItemTypeGeneric = ValueKey('newItemTypeGeneric');

// New medication item specifics: amounts + "Add".
const _newMedicationItemTotalAmount = ValueKey('newMedicationItemTotalAmount');
const _newMedicationItemConcentration =
    ValueKey('newMedicationItemConcentration');
const _newMedicationItemAdd = ValueKey('newMedicationItemAdd');

// New generic item specifics: amount + "Add".
const _newGenericItemAmount = ValueKey('newGenericItemAmount');
const _newGenericItemAdd = ValueKey('newGenericItemAdd');

// Edit medication item.
const _editItemName = ValueKey('editItemName');
const _editItemSave = ValueKey('editItemSave');
const _editItemDelete = ValueKey('editItemDelete');

// User-visible strings asserted by these tests (see lib/l10n/app_en.arb).
const _emptyState = 'No supplies. Add an item to get started.';

// Dropdown options aren't keyed. They're selected by visible localized text.
const _moleculeEstradiol = 'Estradiol';
const _routeOral = 'Oral';
const _genericTypeSyringe = 'Syringes';

void main() {
  patrolTest('shows empty state when there are no supplies', ($) async {
    await $.launchApp();
    await $.openSupplies();

    await $(_emptyState).waitUntilVisible();
    expect($(_emptyState), findsOneWidget);
  });

  patrolTest('creates a medication item', ($) async {
    await $.launchApp();
    await $.openSupplies();

    await _createMedicationItem($, name: 'Estradiol Vial');

    // provider.add() is fire-and-forget; wait for the grid to rebuild.
    await $('Estradiol Vial').waitUntilVisible();
    expect($('Estradiol Vial'), findsOneWidget);
    expect($(_emptyState), findsNothing);
  });

  patrolTest('creates a consumable item', ($) async {
    await $.launchApp();
    await $.openSupplies();

    await _createGenericItem($, name: 'Spare Syringes');

    await $('Spare Syringes').waitUntilVisible();
    expect($('Spare Syringes'), findsOneWidget);
    expect($(_emptyState), findsNothing);
  });

  patrolTest('edits an item name', ($) async {
    await $.launchApp();
    await $.openSupplies();
    await _createMedicationItem($, name: 'Old Name');

    await $(SupplyItemCard).containing('Old Name').tap(); // -> EditItemPage
    await $(_editItemName).enterText('New Name');
    await $(_editItemSave).tap(); // pops back to the supplies grid

    await $('New Name').waitUntilVisible();
    expect($('New Name'), findsOneWidget);
    expect($('Old Name'), findsNothing);
  });

  patrolTest('deletes an item with confirmation', ($) async {
    await $.launchApp();
    await $.openSupplies();
    await _createMedicationItem($, name: 'To Delete');

    await $(SupplyItemCard).containing('To Delete').tap(); // -> EditItemPage
    await $(_editItemDelete).tap(); // form's Delete button -> confirm dialog
    await $(confirmDeleteButton).tap(); // confirm in the dialog

    await $(_emptyState).waitUntilVisible();
    expect($('To Delete'), findsNothing);
    expect($(_emptyState), findsOneWidget);
  });
}

/// From the Supplies tab: FAB -> first page (name, medication type is the
/// default) -> Next -> specifics (Estradiol + Oral avoids the conditional Ester
/// field) -> Add. Returns to the supplies grid.
Future<void> _createMedicationItem(
  PatrolIntegrationTester $, {
  required String name,
}) async {
  await $(Icons.add).tap(); // FAB: "Add an item" -> NewItemPage
  await $(_newItemName).enterText(name);
  await $(_newItemNext).tap(); // -> NewMedicationItemSpecificsPage

  await $(DropdownButtonFormField<Molecule>).tap();
  await $(_moleculeEstradiol).tap();
  await $(DropdownButtonFormField<AdministrationRoute>).tap();
  await $(_routeOral).tap();

  await $(_newMedicationItemTotalAmount).enterText('10');
  await $(_newMedicationItemConcentration).enterText('2');
  await $(_newMedicationItemAdd).tap(); // pops back to the supplies grid
}

/// From the Supplies tab: FAB -> first page (name, switch type to consumable)
/// -> Next -> specifics (type + amount) -> Add. Returns to the supplies grid.
Future<void> _createGenericItem(
  PatrolIntegrationTester $, {
  required String name,
}) async {
  await $(Icons.add).tap(); // FAB: "Add an item" -> NewItemPage
  await $(_newItemName).enterText(name);
  await $(_newItemTypeGeneric).tap(); // switch from medication to consumable
  await $(_newItemNext).tap(); // -> NewGenericItemSpecificsPage

  await $(DropdownButtonFormField<GenericSupplyType>).tap();
  await $(_genericTypeSyringe).tap();

  await $(_newGenericItemAmount).enterText('5');
  await $(_newGenericItemAdd).tap(); // pops back to the supplies grid
}
