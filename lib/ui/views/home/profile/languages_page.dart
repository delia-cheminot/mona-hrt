import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({super.key});

  static const _languages = [
    ('en', 'English', 'English'),
    ('hi', 'Hindi', 'हिंदी'),
    ('ml', 'Malayalam', 'മലയാളം'),
  ];

  @override
  Widget build(BuildContext context) {
    final preferencesService = context.watch<PreferencesService>();
    final strings = preferencesService.strings;
    final currentCode = preferencesService.languageCode;

    void onLanguageChanged(String? value) {
      if (value != null) {
        preferencesService.setLanguageCode(value);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(strings.languages)),
      body: RadioGroup<String>(
        groupValue: currentCode,
        onChanged: onLanguageChanged,
        child: ListView(
          children: [
            for (final (code, englishName, nativeName) in _languages)
              RadioListTile<String>(
                title: Text(nativeName),
                subtitle: code != 'en' ? Text(englishName) : null,
                value: code,
              ),
          ],
        ),
      ),
    );
  }
}
