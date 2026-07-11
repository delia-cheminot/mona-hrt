import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mona/i18n/build_context_extensions.dart';

typedef WeekdayToggleCallback = void Function(int day, bool selected);

class WeekdayPicker extends StatelessWidget {
  static const List<int> _weekdays = [1, 2, 3, 4, 5, 6, 7];

  final List<int> selectedDays;
  final WeekdayToggleCallback onDayToggled;
  final String? errorText;

  const WeekdayPicker({
    super.key,
    required this.selectedDays,
    required this.onDayToggled,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weekdayFormat = DateFormat.E(context.intlLanguageTag);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (errorText != null)
            Text(
              errorText!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.error),
            ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.center,
            children: _weekdays.map((day) {
              final isSelected = selectedDays.contains(day);
              return FilterChip(
                label: Text(_weekdayName(weekdayFormat, day)),
                selected: isSelected,
                showCheckmark: false,
                onSelected: (selected) => onDayToggled(day, selected),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Jan 1, 2024 is a Monday, so DateTime(2024, 1, day) maps 1..7 to Mon..Sun.
  String _weekdayName(DateFormat format, int day) =>
      format.format(DateTime(2024, 1, day));
}
