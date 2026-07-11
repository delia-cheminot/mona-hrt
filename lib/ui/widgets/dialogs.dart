import 'package:flutter/material.dart';
import 'package:mona/i18n/translations.g.dart';

class Dialogs {
  static Future<bool?> confirmDeleteDialog({
    required BuildContext context,
    String? title,
    String? content,
    String? cancel,
    String? confirm,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? t.deleteElement),
          content: Text(content ?? t.irreversibleAction),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancel ?? t.cancel),
            ),
            TextButton(
              key: const ValueKey('confirmDeleteConfirmButton'),
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(confirm ?? t.delete,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
          ],
        );
      },
    );
  }
}
