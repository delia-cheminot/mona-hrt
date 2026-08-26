import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/i18n/helpers/scheduling_type_l10n.dart';

class SchedulingTypePicker extends StatelessWidget {
  final SchedulingType value;
  final ValueChanged<SchedulingType> onChanged;

  const SchedulingTypePicker({
    super.key,
    required this.value,
    required this.onChanged,
  });

  Key? _optionKey(SchedulingType type) => switch (type) {
        SchedulingType.intervalDays => const ValueKey('scheduleTypeInterval'),
        SchedulingType.monthly => const ValueKey('scheduleTypeMonthly'),
        _ => null,
      };

  Future<void> _openTypeSheet(BuildContext context) async {
    final selected = await showModalBottomSheet<SchedulingType>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (final type in SchedulingType.values)
              ListTile(
                key: _optionKey(type),
                title: Text(type.localizedName),
                subtitle: Text(type.localizedDescription),
                trailing:
                    type == value ? const Icon(Symbols.check_rounded) : null,
                onTap: () => Navigator.of(sheetContext).pop(type),
              ),
          ],
        ),
      ),
    );

    if (selected == null || selected == value) return;
    onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    return M3ECardColumn(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: 8),
      children: [
        ListTile(
          key: const ValueKey('schedulingTypePicker'),
          title: Text(value.localizedName),
          subtitle: Text(value.localizedDescription),
          trailing: const Icon(Symbols.edit_rounded),
          onTap: () => _openTypeSheet(context),
        ),
      ],
    );
  }
}
