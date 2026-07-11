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
    'en': (english: 'English', native: 'English'),
    'fr': (english: 'French', native: 'Français'),
    'es': (english: 'Spanish', native: 'Español'),
    'de': (english: 'German', native: 'Deutsch'),
    'pt': (english: 'Portuguese', native: 'Português'),
    'pt-BR': (english: 'Brazilian Portuguese', native: 'Português do Brasil'),
    'sk': (english: 'Slovak', native: 'Slovenský'),
    'uk': (english: 'Ukrainian', native: 'Українська'),
    'ru': (english: 'Russian', native: 'Русский'),
    'th': (english: 'Thai', native: 'ภาษาไทย'),
    'et': (english: 'Estonian', native: 'Eesti'),
    'pl': (english: 'Polish', native: 'Polski'),
    'tok': (english: 'Toki Pona', native: 'toki pona'),
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
            for (final locale in AppLocale.values) _buildTile(locale),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(AppLocale locale) {
    final tag = locale.languageTag;
    final names = languageNames[tag];
    return RadioListTile<String?>(
      title: Text(names?.native ?? tag),
      subtitle: (names != null && locale != AppLocale.en)
          ? Text(names.english)
          : null,
      value: tag,
    );
  }
}
