import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';

class Dialogs {
  static Future<bool?> confirmDelete(BuildContext context) {
    final strings =
        Provider.of<PreferencesService>(context, listen: false).strings;
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(strings.deleteThisElement),
          content: Text(strings.actionCannotBeUndone),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(strings.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(strings.delete),
            ),
          ],
        );
      },
    );
  }
}
