import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/i18n/helpers/supply_item_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/extensions/generic_supply_type_icon.dart';
import 'package:mona/ui/views/supplies/new_item_page.dart';

class IntakeSupplyPicker extends StatelessWidget {
  final MedicationSupplyItem? medicationItem;
  final List<GenericSupply> generics;
  final List<MedicationSupplyItem> medicationOptions;
  final List<GenericSupply> genericOptions;
  final VoidCallback onRemoveMedication;
  final ValueChanged<int> onRemoveGenericAt;
  final ValueChanged<MedicationSupplyItem> onAddMedication;
  final ValueChanged<GenericSupply> onAddGeneric;

  const IntakeSupplyPicker({
    super.key,
    required this.medicationItem,
    required this.generics,
    required this.medicationOptions,
    required this.genericOptions,
    required this.onRemoveMedication,
    required this.onRemoveGenericAt,
    required this.onAddMedication,
    required this.onAddGeneric,
  });

  Future<void> _openAddSheet(BuildContext context) async {
    final addableMedications =
        medicationOptions.where((o) => o.id != medicationItem?.id).toList();
    final addableGenerics = genericOptions;

    final isEmpty = addableMedications.isEmpty && addableGenerics.isEmpty;

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            if (isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: borderPadding, vertical: 8),
                child: Text(
                  t.noItemsToAdd,
                  style: Theme.of(sheetContext).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(sheetContext).colorScheme.outline,
                      ),
                ),
              ),
            for (final item in addableMedications)
              ListTile(
                leading:
                    CircleAvatar(child: Icon(item.administrationRoute.icon)),
                title: Text(item.name),
                subtitle: Text(item.localizedConcentrationAndRemaining),
                onTap: () {
                  onAddMedication(item);
                  Navigator.of(sheetContext).pop();
                },
              ),
            for (final item in addableGenerics)
              ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(sheetContext).colorScheme.secondaryContainer,
                  child: Icon(item.genericSupplyType.icon),
                ),
                title: Text(item.name),
                subtitle: Text(item.localizedSummary),
                onTap: () {
                  onAddGeneric(item);
                  Navigator.of(sheetContext).pop();
                },
              ),
            ListTile(
              leading: CircleAvatar(
                foregroundColor:
                    Theme.of(sheetContext).colorScheme.tertiaryContainer,
                backgroundColor:
                    Theme.of(sheetContext).colorScheme.onTertiaryContainer,
                child: Icon(Symbols.add_rounded),
              ),
              title: Text(t.addAnItem),
              onTap: () async {
                Navigator.of(sheetContext).pop();
                final created = await Navigator.of(context).push(
                  MaterialPageRoute<SupplyItem?>(
                    fullscreenDialog: true,
                    builder: (_) => NewItemPage(),
                  ),
                );
                if (created is GenericSupply) {
                  onAddGeneric(created);
                } else if (created is MedicationSupplyItem) {
                  onAddMedication(created);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = medicationItem;
    final items = <Widget>[
      if (item != null)
        ListTile(
          leading: CircleAvatar(child: Icon(item.administrationRoute.icon)),
          title: Text(item.name),
          subtitle: Text(item.localizedConcentrationAndRemaining),
          trailing: IconButton(
            icon: const Icon(Symbols.close_rounded),
            onPressed: onRemoveMedication,
          ),
        ),
      for (final (index, generic) in generics.indexed)
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
            child: Icon(generic.genericSupplyType.icon),
          ),
          title: Text(generic.name),
          subtitle: Text(generic.localizedSummary),
          trailing: IconButton(
            icon: const Icon(Symbols.close_rounded),
            onPressed: () => onRemoveGenericAt(index),
          ),
        ),
      ListTile(
        leading: const Icon(Symbols.add_rounded),
        title: Text(t.chooseItem),
        onTap: () => _openAddSheet(context),
      ),
    ];

    return M3ECardList.of(
      padding: EdgeInsets.zero,
      children: items,
    );
  }
}
