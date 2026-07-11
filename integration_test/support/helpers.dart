// Shared helpers for the Patrol E2E suite: app launch and per-feature
// navigation, reused across the *_test.dart files.

import 'package:flutter/material.dart';
import 'package:mona/main.dart' as app;
import 'package:patrol/patrol.dart';

/// Confirm button in the shared delete-confirmation dialog (see dialogs.dart).
const confirmDeleteButton = ValueKey('confirmDeleteConfirmButton');

// Keyed navigation entry points (see main_tabs.dart / settings_page.dart).
const _settingsSchedulesTile = ValueKey('settingsSchedulesTile');
const _navTabIntakes = ValueKey('navTabIntakes');
const _navTabSupplies = ValueKey('navTabSupplies');

extension MonaHelper on PatrolIntegrationTester {
  /// Launches the real app and waits for the home screen to be interactive.
  Future<void> launchApp() async {
    app.main();
    await pumpAndSettle();
    // main() initialises asynchronously (timezone data, preferences) before
    // runApp; poll until the home AppBar's settings button is on screen.
    await this(Icons.settings).waitUntilVisible();
  }

  /// Home -> Settings -> Schedules.
  Future<void> openSchedules() async {
    await this(Icons.settings).tap();
    await this(_settingsSchedulesTile).scrollTo().tap();
  }

  /// Switches to the Intakes tab via the bottom navigation bar.
  Future<void> openIntakes() async {
    await this(_navTabIntakes).tap(); // keyed NavigationDestination
  }

  /// Switches to the Supplies tab via the bottom navigation bar.
  Future<void> openSupplies() async {
    await this(_navTabSupplies).tap(); // keyed NavigationDestination
  }
}
