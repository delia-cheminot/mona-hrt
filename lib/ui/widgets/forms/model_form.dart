import 'package:flutter/material.dart';
import 'package:mona/ui/constants/dimensions.dart';

class ModelForm extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  final VoidCallback? onDelete;
  final bool isFormValid;
  final VoidCallback saveChanges;
  final String submitButtonLabel;

  const ModelForm({
    required this.title,
    required this.fields,
    this.onDelete,
    required this.isFormValid,
    required this.saveChanges,
    required this.submitButtonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: isFormValid ? saveChanges : null,
              child: Text(submitButtonLabel),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...fields,
              if (onDelete != null) ...[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Divider(),
                    ),
                    Container(
                      padding: pagePadding,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: onDelete,
                        child: Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
