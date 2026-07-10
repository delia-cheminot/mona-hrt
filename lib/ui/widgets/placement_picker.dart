import 'package:flutter/material.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/i18n/helpers/placement_l10n.dart';

class PlacementPicker extends StatelessWidget {
  final List<Placement> options;
  final List<Placement> selected;
  final ValueChanged<List<Placement>> onChanged;

  const PlacementPicker({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  void _toggle(Placement option) {
    List<Placement> newSelected;

    if (selected.contains(option)) {
      newSelected = selected.where((e) => e != option).toList();
    } else {
      newSelected = [...selected, option];
    }

    onChanged(newSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: options
                .map((option) => FilterChip(
                      label: Text(option.localizedName),
                      selected: selected.contains(option),
                      showCheckmark: false,
                      onSelected: (s) => _toggle(option),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
