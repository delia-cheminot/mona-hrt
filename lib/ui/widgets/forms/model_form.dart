import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:provider/provider.dart';

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
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                        child: Text(
                          context
                              .read<PreferencesService>()
                              .strings
                              .delete,
                        ),
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
