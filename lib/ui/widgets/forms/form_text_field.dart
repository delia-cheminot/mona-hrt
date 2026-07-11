import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final VoidCallback onChanged;
  final bool readonly;
  final bool multiline;
  final String label;
  final String? suffixText;
  final String? errorText;
  final String? regexFormatter;

  /// Key applied to the inner [TextField] (not the outer widget), so e2e tests
  /// can target the input without depending on its (localized) label.
  final Key? fieldKey;

  const FormTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.onChanged,
    required this.label,
    this.suffixText,
    this.errorText,
    this.regexFormatter,
    this.readonly = false,
    this.multiline = false,
    this.fieldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        key: fieldKey,
        controller: controller,
        keyboardType: multiline ? TextInputType.multiline : inputType,
        inputFormatters: regexFormatter != null
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(regexFormatter!),
                )
              ]
            : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          suffixText: suffixText,
          errorText: errorText,
          suffixIcon: errorText != null ? Icon(Icons.error) : null,
        ),
        onChanged: (value) => onChanged(),
        readOnly: readonly,
        maxLines: multiline ? null : 1,
        minLines: multiline ? 3 : null,
      ),
    );
  }
}
