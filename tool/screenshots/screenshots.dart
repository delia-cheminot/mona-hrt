import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:mona/main.dart' as app;
import 'package:shared_preferences/shared_preferences.dart';

import 'screenshot_seed.dart';

const String _localeTag =
    String.fromEnvironment('SCREENSHOT_LOCALE', defaultValue: 'en');

void main() {
  withClock(Clock.fixed(screenshotClockInstant), () async {
    enableFlutterDriverExtension();
    WidgetsApp.debugAllowBannerOverride = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setString('language_tag', _localeTag);
    await seedScreenshotData();

    app.main();
  });
}
