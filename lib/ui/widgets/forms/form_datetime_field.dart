import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/ui/constants/dimensions.dart';

class FormDateTimeField extends StatelessWidget {
  final DateTime datetime;
  final DateTime? selectedDatetime;
  final ValueChanged<DateTime> onChanged;
  final String label;
  final String? errorText;

  FormDateTimeField({
    required this.datetime,
    required this.onChanged,
    this.selectedDatetime,
    required this.label,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final String locale = context.intlLanguageTag;
    final DateFormat timeFormat = MediaQuery.of(context).alwaysUse24HourFormat
        ? DateFormat.Hm(locale)
        : DateFormat.jm(locale);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: TextEditingController(
                  text: DateFormat.yMMMd(locale).format(datetime)),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: label,
                errorText: errorText,
                suffixIcon: errorText != null
                    ? Icon(Icons.error)
                    : Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
          ),
          SizedBox(width: borderPadding),
          IntrinsicWidth(
            child: TextField(
              controller:
                  TextEditingController(text: timeFormat.format(datetime)),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                errorText: errorText,
                suffixIcon: errorText != null
                    ? Icon(Icons.error)
                    : Icon(Icons.access_time),
              ),
              readOnly: true,
              onTap: () => _selectTime(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDatetime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      picked = DateTime(picked.year, picked.month, picked.day, datetime.hour,
          datetime.minute);
      onChanged(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: datetime.hour, minute: datetime.minute));

    if (picked != null) {
      onChanged(DateTime(datetime.year, datetime.month, datetime.day,
          picked.hour, picked.minute));
    }
  }
}
