import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/i18n/helpers/supply_item_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/extensions/generic_supply_type_icon.dart';

class IntakeSupplyPicker extends StatelessWidget {
  final MedicationSupplyItem? medicationItem;
  final List<GenericSupply> generics;
  final List<MedicationSupplyItem> medicationOptions;
  final List<GenericSupply> genericOptions;
  final VoidCallback onRemoveMedication;
  final ValueChanged<GenericSupply> onRemoveGeneric;
  final ValueChanged<MedicationSupplyItem> onAddMedication;
  final ValueChanged<GenericSupply> onAddGeneric;

  const IntakeSupplyPicker({
    super.key,
    required this.medicationItem,
    required this.generics,
    required this.medicationOptions,
    required this.genericOptions,
    required this.onRemoveMedication,
    required this.onRemoveGeneric,
    required this.onAddMedication,
    required this.onAddGeneric,
  });

  Future<void> _openAddSheet(BuildContext context) async {
    final addableMedications =
        medicationOptions.where((o) => o.id != medicationItem?.id).toList();
    final selectedGenericIds = generics.map((g) => g.id).toSet();
    final addableGenerics = genericOptions
        .where((o) => !selectedGenericIds.contains(o.id))
        .toList();

    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            if (addableMedications.isNotEmpty)
              _SheetSectionHeader(title: t.medicationItemsFilter),
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
            if (addableGenerics.isNotEmpty)
              _SheetSectionHeader(title: t.genericItems),
            for (final item in addableGenerics)
              ListTile(
                leading: CircleAvatar(child: Icon(item.genericSupplyType.icon)),
                title: Text(item.name),
                subtitle: Text(item.localizedSummary),
                onTap: () {
                  onAddGeneric(item);
                  Navigator.of(sheetContext).pop();
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
            icon: const Icon(Icons.close),
            onPressed: onRemoveMedication,
          ),
        ),
      for (final generic in generics)
        ListTile(
          leading: CircleAvatar(child: Icon(generic.genericSupplyType.icon)),
          title: Text(generic.name),
          subtitle: Text(generic.localizedSummary),
          trailing: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => onRemoveGeneric(generic),
          ),
        ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.add)),
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

class _SheetSectionHeader extends StatelessWidget {
  final String title;

  const _SheetSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding:
          EdgeInsets.fromLTRB(borderPadding, borderPadding, borderPadding, 8),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
