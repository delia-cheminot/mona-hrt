import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/i18n/locale_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LocaleProvider', () {
    tearDown(() {
      TestWidgetsFlutterBinding.instance.platformDispatcher
          .clearLocaleTestValue();
    });

    test('constructor follows device locale when no language tag is stored',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final preferences = await PreferencesService.init();
      TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue =
          const Locale('de', 'DE');

      // Act
      final provider = LocaleProvider(preferences);

      // Assert
      expect(provider.locale, const Locale('de'));
    });

    test('constructor loads locale from stored BCP-47 language tag', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'language_tag': 'fr'});
      final preferences = await PreferencesService.init();
      TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue =
          const Locale('en', 'US');

      // Act
      final provider = LocaleProvider(preferences);

      // Assert
      expect(provider.locale, const Locale('fr'));
    });

    test('constructor loads script and country from stored language tag',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'language_tag': 'pt-BR'});
      final preferences = await PreferencesService.init();

      // Act
      final provider = LocaleProvider(preferences);

      // Assert
      expect(provider.locale, const Locale('pt', 'BR'));
    });

    test(
        'constructor uses English fallback when stored language is unsupported',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'language_tag': 'ja'});
      final preferences = await PreferencesService.init();

      // Act
      final provider = LocaleProvider(preferences);

      // Assert
      expect(provider.locale, const Locale('en'));
    });

    test('setLocale updates current locale when it changes', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final preferences = await PreferencesService.init();
      TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue =
          const Locale('en', 'US');
      final provider = LocaleProvider(preferences);

      // Act
      provider.setLocale(const Locale('de'));

      // Assert
      expect(provider.locale, const Locale('de'));
    });

    test('setLocale notifies listeners when locale changes', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final preferences = await PreferencesService.init();
      TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue =
          const Locale('en', 'US');
      final provider = LocaleProvider(preferences);
      var listenerCalls = 0;
      provider.addListener(() {
        listenerCalls++;
      });

      // Act
      provider.setLocale(const Locale('es'));

      // Assert
      expect(listenerCalls, 1);
    });

    test('setLocale does not notify listeners when locale is unchanged',
        () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'language_tag': 'es'});
      final preferences = await PreferencesService.init();
      final provider = LocaleProvider(preferences);
      var listenerCalls = 0;
      provider.addListener(() {
        listenerCalls++;
      });

      // Act
      provider.setLocale(const Locale('es'));

      // Assert
      expect(listenerCalls, 0);
    });

    test('setLocale persists language tag to preferences', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({});
      final preferences = await PreferencesService.init();
      TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue =
          const Locale('en', 'US');
      final provider = LocaleProvider(preferences);

      // Act
      provider.setLocale(const Locale('fr'));

      // Assert
      expect(preferences.savedLanguageTag, 'fr');
    });

    test('setFollowSystemLocale uses system locale', () async {
      // Arrange
      SharedPreferences.setMockInitialValues({'language_tag': 'fr'});
      final preferences = await PreferencesService.init();
      TestWidgetsFlutterBinding.instance.platformDispatcher.localeTestValue =
          const Locale('de', 'DE');
      final provider = LocaleProvider(preferences);

      // Act
      await provider.setFollowSystemLocale();

      // Assert
      expect(provider.locale, const Locale('de'));
    });
  });
}
