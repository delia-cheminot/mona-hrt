import 'dart:io';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/app.dart';
import 'package:mona/i18n/locale_provider.dart';
import 'package:mona/main.dart' as app;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screenshot_seed.dart';

const String _localeTag =
    String.fromEnvironment('SCREENSHOT_LOCALE', defaultValue: 'en');

Locale _localeFromTag(String tag) {
  final parts = tag.split('-');
  return parts.length == 2 ? Locale(parts[0], parts[1]) : Locale(parts[0]);
}

Future<void> _waitForHome(WidgetTester tester) async {
  await tester.pumpAndSettle();
  for (var i = 0;
      i < 50 && find.byIcon(Symbols.settings_rounded).evaluate().isEmpty;
      i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await tester.pumpAndSettle();
}

Future<void> _openTab(WidgetTester tester, String key) async {
  await tester.tap(find.byKey(ValueKey(key)));
  await tester.pumpAndSettle();
}

void main() {
  final frozenClock = Clock.fixed(screenshotClockInstant);
  withClock(frozenClock, () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('capture store screenshots', (tester) async {
      await withClock(frozenClock, () async {
        await (await SharedPreferences.getInstance()).clear();
        await seedScreenshotData();

        app.main();
        await _waitForHome(tester);

        final context = tester.element(find.byType(MonaApp));
        context.read<LocaleProvider>().setLocale(_localeFromTag(_localeTag));
        await tester.pumpAndSettle();

        if (Platform.isAndroid) {
          await binding.convertFlutterSurfaceToImage();
          await tester.pumpAndSettle();
        }

        await binding.takeScreenshot('01_home');

        await _openTab(tester, 'navTabIntakes');
        await binding.takeScreenshot('02_intakes');

        await _openTab(tester, 'navTabLevels');
        await binding.takeScreenshot('03_levels');

        await _openTab(tester, 'navTabSupplies');
        await binding.takeScreenshot('04_supplies');
      });
    });
  });
}
