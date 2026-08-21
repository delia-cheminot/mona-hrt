import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/i18n/build_context_extensions.dart';

class FormDateField extends StatelessWidget {
  final Date date;
  final Date? selectedDate;
  final ValueChanged<Date> onChanged;
  final String label;
  final String? errorText;

  const FormDateField({
    super.key,
    required this.date,
    required this.onChanged,
    this.selectedDate,
    required this.label,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(
            text: date.format(DateFormat.yMMMd(context.intlLanguageTag))),
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          errorText: errorText,
          suffixIcon: errorText != null
              ? Icon(Symbols.error_rounded)
              : Icon(Symbols.calendar_today_rounded),
        ),
        readOnly: true,
        onTap: () => _selectDate(context),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: (selectedDate ?? date).toDateTime(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      onChanged(Date(year: picked.year, month: picked.month, day: picked.day));
    }
  }
}
