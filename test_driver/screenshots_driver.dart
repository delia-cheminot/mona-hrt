import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

const _screens = <(String, String?)>[
  ('01_home', null),
  ('02_intakes', 'navTabIntakes'),
  ('03_levels', 'navTabLevels'),
  ('04_supplies', 'navTabSupplies'),
];

Future<void> main() async {
  final outDir = Platform.environment['SCREENSHOT_OUT'] ?? 'build/screenshots';
  final iosUdid = Platform.environment['SCREENSHOT_IOS_UDID'] ?? '';

  final driver = await FlutterDriver.connect();

  for (var attempt = 0;; attempt++) {
    try {
      await driver.waitFor(
        find.byValueKey('navTabIntakes'),
        timeout: const Duration(seconds: 2),
      );
      break;
    } catch (_) {
      if (attempt >= 60) rethrow;
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  if (iosUdid.isNotEmpty) {
    final result = await Process.run('xcrun', [
      'simctl', 'status_bar', iosUdid, 'override', //
      '--time', '14:28',
      '--dataNetwork', 'wifi', '--wifiMode', 'active', '--wifiBars', '3',
      '--cellularMode', 'active', '--cellularBars', '4',
      '--batteryState', 'discharging', '--batteryLevel', '100',
    ]);
    if (result.exitCode != 0) {
      throw Exception('simctl status_bar override failed: ${result.stderr}');
    }
  }

  Future<void> capture(String name) async {
    await driver.waitUntilNoTransientCallbacks();
    await Future<void>.delayed(const Duration(milliseconds: 800));
    final path = '$outDir/$name.png';
    if (iosUdid.isNotEmpty) {
      final result = await Process.run(
        'xcrun',
        ['simctl', 'io', iosUdid, 'screenshot', path],
      );
      if (result.exitCode != 0) {
        throw Exception('simctl screenshot failed: ${result.stderr}');
      }
    } else {
      await File(path).writeAsBytes(await driver.screenshot());
    }
  }

  for (final (name, tapKey) in _screens) {
    if (tapKey != null) {
      await driver.tap(find.byValueKey(tapKey));
    }
    await capture(name);
  }

  await driver.close();
}
