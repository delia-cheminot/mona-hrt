// Patrol E2E tests for the Medication Schedules feature.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:patrol/patrol.dart';

import 'support/helpers.dart';

// Keys for interaction targets, mirroring the ValueKeys set on the production
// widgets under lib/ui/.
const _newScheduleName = ValueKey('newScheduleName');
const _newScheduleAmount = ValueKey('newScheduleAmount');
const _newScheduleNext = ValueKey('newScheduleNext');
const _newScheduleSave = ValueKey('newScheduleSave');
const _newScheduleEvery = ValueKey('newScheduleEvery');
const _scheduleTypeInterval = ValueKey('scheduleTypeInterval');
const _addNotificationTile = ValueKey('addNotificationTile');
const _editScheduleInfoTile = ValueKey('editScheduleInfoTile');
const _editScheduleName = ValueKey('editScheduleName');
const _editScheduleSave = ValueKey('editScheduleSave');
const _editScheduleDelete = ValueKey('editScheduleDelete');

// User-visible strings asserted by these tests (see lib/l10n/app_en.arb).
const _emptyState = 'Add a schedule to get started.';

// Dropdown option labels: selected by their visible (localized) text. The
// option lists come from shared enum dropdown builders used app-wide, so they
// are not individually keyed; the dropdowns themselves are opened with a stable
// typed finder ($(DropdownButtonFormField<Molecule>)).
const _moleculeEstradiol = 'Estradiol';
const _routeOral = 'Oral';

void main() {
  patrolTest('deletes a schedule with confirmation', ($) async {
    await $.launchApp();
    await $.openSchedules();
    await _createIntervalSchedule($, name: 'To Delete');

    await $(ListTile).containing('To Delete').tap(); // data, not localized
    await $(_editScheduleInfoTile).tap();

    await $(_editScheduleDelete)
        .tap(); // form's Delete button -> confirm dialog
    await $(confirmDeleteButton).tap(); // confirm in the dialog

    await $(_emptyState).waitUntilVisible();
    expect($('To Delete'), findsNothing);
    expect($(_emptyState), findsOneWidget);
  });

  patrolTest('shows empty state when there are no schedules', ($) async {
    await $.launchApp();
    await $.openSchedules();

    await $(_emptyState).waitUntilVisible();
    expect($(_emptyState), findsOneWidget);
  });

  patrolTest('creates an interval schedule', ($) async {
    await $.launchApp();
    await $.openSchedules();

    await $(Icons.add).tap(); // FAB: "Add a schedule"
    await _fillMainInfoAndNext($, name: 'Interval Estradiol');

    await $(_scheduleTypeInterval).tap();
    await $(_newScheduleEvery).enterText('3');
    await $(_newScheduleSave).tap();

    // provider.add() is fire-and-forget; wait for the list to rebuild.
    await $('Interval Estradiol').waitUntilVisible();
    expect($('Interval Estradiol'), findsOneWidget);
  });

  patrolTest('creates a daily schedule', ($) async {
    await $.launchApp();
    await $.openSchedules();

    await $(Icons.add).tap();
    await _fillMainInfoAndNext($, name: 'Daily Estradiol');

    // "Every day" is the default type. Add one intake time via the time
    // picker (a daily schedule requires at least one time to be valid).
    await $(_addNotificationTile).tap();
    await $('OK').tap(); // accept the default time (Material time picker)
    await $(_newScheduleSave).tap();

    await $('Daily Estradiol').waitUntilVisible();
    expect($('Daily Estradiol'), findsOneWidget);
  });

  patrolTest('edits a schedule name', ($) async {
    await $.launchApp();
    await $.openSchedules();
    await _createIntervalSchedule($, name: 'Old Name');

    await $(ListTile).containing('Old Name').tap(); // -> EditSchedulePage
    await $(_editScheduleInfoTile).tap(); // -> EditScheduleMainInfoPage
    await $(_editScheduleName).enterText('New Name');
    await $(_editScheduleSave).tap(); // pops back to EditSchedulePage

    // Wait for the change to be reflected in the EditSchedulePage title before
    // navigating back, ensuring the provider update has finished.
    await $('New Name').waitUntilVisible();
    await $(Icons.arrow_back).tap(); // back to the schedules list

    await $('New Name').waitUntilVisible();
    expect($('New Name'), findsOneWidget);
    expect($('Old Name'), findsNothing);
  });
}

/// Fills the first create-schedule page (name, molecule, route, amount) with a
/// combination that does NOT surface the conditional Ester field
/// (Estradiol + Oral), then taps "Next".
Future<void> _fillMainInfoAndNext(
  PatrolIntegrationTester $, {
  required String name,
  String dose = '2',
}) async {
  await $(_newScheduleName).enterText(name);

  await $(DropdownButtonFormField<Molecule>).tap();
  await $(_moleculeEstradiol).tap();

  await $(DropdownButtonFormField<AdministrationRoute>).tap();
  await $(_routeOral).tap();

  await $(_newScheduleAmount).enterText(dose);

  await $(_newScheduleNext).tap();
}

/// End-to-end helper: creates a minimal interval schedule and returns to the
/// schedules list (used by the edit/delete tests as a precondition).
Future<void> _createIntervalSchedule(
  PatrolIntegrationTester $, {
  required String name,
}) async {
  await $(Icons.add).tap();
  await _fillMainInfoAndNext($, name: name);
  await $(_scheduleTypeInterval).tap();
  await $(_newScheduleEvery).enterText('3');
  await $(_newScheduleSave).tap();
  await $(ListTile).containing(name).waitUntilVisible();
}
