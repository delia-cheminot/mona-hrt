import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';

class TimeListCard extends StatelessWidget {
  final List<TimeOfDay> times;
  final IconData rowIcon;
  final String addLabel;
  final VoidCallback onAdd;
  final ValueChanged<int> onEdit;
  final ValueChanged<int> onDelete;
  final List<Widget> trailingChildren;
  final Key? addTileKey;

  const TimeListCard({
    super.key,
    required this.times,
    required this.rowIcon,
    required this.addLabel,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
    this.trailingChildren = const [],
    this.addTileKey,
  });

  @override
  Widget build(BuildContext context) {
    final addCardIndex = times.length;
    return M3ECardColumn(
      padding: EdgeInsets.zero,
      onTap: (index) {
        if (index == addCardIndex) onAdd();
      },
      children: [
        for (int i = 0; i < times.length; i++)
          ListTile(
            leading: Icon(rowIcon),
            title: Text(times[i].format(context)),
            onTap: () => onEdit(i),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => onDelete(i),
            ),
          ),
        ListTile(
          key: addTileKey,
          leading: const Icon(Icons.add),
          title: Text(addLabel),
          onTap: onAdd,
        ),
        ...trailingChildren,
      ],
    );
  }
}
