import 'package:flutter/material.dart';
import 'package:intl/locale.dart' as intl;
import 'package:mona/i18n/locale_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';

typedef LanguageNames = ({String english, String native});

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  static const Map<String, LanguageNames> languageNames = {
    'de': (english: 'German', native: 'Deutsch'),
    'en': (english: 'English', native: 'English'),
    'en-GB': (english: 'British English', native: 'English (UK)'),
    'es': (english: 'Spanish', native: 'Español'),
    'et': (english: 'Estonian', native: 'Eesti'),
    'fr': (english: 'French', native: 'Français'),
    'gl': (english: 'Galician', native: 'Galego'),
    'is': (english: 'Icelandic', native: 'Íslenska'),
    'ko': (english: 'Korean', native: '한국어'),
    'nl': (english: 'Dutch', native: 'Nederlands'),
    'pl': (english: 'Polish', native: 'Polski'),
    'pt': (english: 'Portuguese', native: 'Português'),
    'pt-BR': (english: 'Brazilian Portuguese', native: 'Português do Brasil'),
    'ru': (english: 'Russian', native: 'Русский'),
    'sk': (english: 'Slovak', native: 'Slovenský'),
    'th': (english: 'Thai', native: 'ภาษาไทย'),
    'tok': (english: 'Toki Pona', native: 'toki pona'),
    'uk': (english: 'Ukrainian', native: 'Українська'),
  };

  static String? nativeNameOf(String tag) => languageNames[tag]?.native;

  @override
  Widget build(BuildContext context) {
    final preferencesService = context.watch<PreferencesService>();
    final localeProvider = context.read<LocaleProvider>();
    final savedTag = preferencesService.savedLanguageTag;

    void onLanguageChanged(String? value) {
      if (value == null) {
        localeProvider.setFollowSystemLocale();
        return;
      }

      final parsed = intl.Locale.tryParse(value);
      if (parsed == null) return;

      localeProvider.setLocale(Locale.fromSubtags(
        languageCode: parsed.languageCode,
        scriptCode: parsed.scriptCode,
        countryCode: parsed.countryCode,
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.language)),
      body: RadioGroup<String?>(
        groupValue: savedTag,
        onChanged: onLanguageChanged,
        child: ListView(
          children: [
            RadioListTile<String?>(
              title: Text(t.languageFollowDevice),
              value: null,
            ),
            for (final tag in languageNames.keys) _buildTile(tag),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String tag) {
    final names = languageNames[tag];
    return RadioListTile<String?>(
      title: Text(names?.native ?? tag),
      subtitle: (names != null && tag != 'en') ? Text(names.english) : null,
      value: tag,
    );
  }
}
