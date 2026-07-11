// Patrol E2E tests for the Intakes feature.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:patrol/patrol.dart';

import 'support/helpers.dart';

// Keys for interaction targets, mirroring the ValueKeys set on the production
// widgets under lib/ui/.
const _takeIntakeSubmit = ValueKey('takeIntakeSubmit');
const _editIntakeSave = ValueKey('editIntakeSave');
const _editIntakeDelete = ValueKey('editIntakeDelete');
const _editIntakeNotes = ValueKey('editIntakeNotes');

const _emptyIntakes = 'Taken intakes will appear here';
const _addSchedulesFirst = 'Add schedules first.';
const _editIntake = 'Edit intake';

const _schedulesTile = 'Schedules';
const _nameLabel = 'Name';
const _amountLabel = 'Amount';
const _moleculeEstradiol = 'Estradiol';
const _routeOral = 'Oral';
const _next = 'Next';
const _save = 'Save';
const _intervalToggle = 'Interval';
const _everyLabel = 'Every';

void main() {
  patrolTest('shows empty state when there are no intakes', ($) async {
    await $.launchApp();
    await $.openIntakes();

    await $(_emptyIntakes).waitUntilVisible();
    expect($(_emptyIntakes), findsOneWidget);
  });

  patrolTest('prompts to add a schedule when none exist', ($) async {
    // With no schedules, the record-intake entry view (ChooseSchedulePage)
    // shows a prompt instead of a selectable schedule list.
    await $.launchApp();
    await $.openIntakes();

    await $(Icons.add).tap(); // FAB: "Take an intake" -> ChooseSchedulePage
    await $(_addSchedulesFirst).waitUntilVisible();
    expect($(_addSchedulesFirst), findsOneWidget);
  });

  patrolTest('records an intake from the intakes tab', ($) async {
    await $.launchApp();
    await _seedSchedule($, name: 'Estradiol');
    await $.openIntakes();

    await _recordIntake($, scheduleName: 'Estradiol');

    // takeMedication() is fire-and-forget; wait for the list to rebuild. The
    // recorded intake replaces the empty state with a ListTile.
    await $(ListTile).waitUntilVisible();
    expect($(_emptyIntakes), findsNothing);
    expect($(ListTile), findsWidgets);
  });

  patrolTest('edits an intake and persists notes', ($) async {
    await $.launchApp();
    await _seedSchedule($, name: 'Estradiol');
    await $.openIntakes();
    await _recordIntake($, scheduleName: 'Estradiol');
    await $(ListTile).waitUntilVisible();

    await $(ListTile).tap(); // -> EditIntakePage
    await $(_editIntake).waitUntilVisible();
    await $(_editIntakeNotes).enterText('Felt fine');
    await $(_editIntakeSave).tap(); // pops back to the intakes list

    await $(ListTile).waitUntilVisible();
    await $(ListTile).tap();
    await $('Felt fine').waitUntilVisible();
    expect($('Felt fine'), findsOneWidget);
  });

  patrolTest('deletes an intake with confirmation', ($) async {
    await $.launchApp();
    await _seedSchedule($, name: 'Estradiol');
    await $.openIntakes();
    await _recordIntake($, scheduleName: 'Estradiol');
    await $(ListTile).waitUntilVisible();

    await $(ListTile).tap(); // -> EditIntakePage
    await $(_editIntake).waitUntilVisible();

    await $(_editIntakeDelete)
        .tap(); // form's Delete button -> confirmation dialog
    await $(confirmDeleteButton).tap(); // confirm in the dialog

    await $(_emptyIntakes).waitUntilVisible();
    expect($(_emptyIntakes), findsOneWidget);
    expect($(ListTile), findsNothing);
  });
}

/// Seeds a minimal interval schedule (Estradiol + Oral) so an intake can be
/// recorded against it, then returns to the Home tab. Mirrors the create flow
/// covered by schedules_test.dart.
Future<void> _seedSchedule(
  PatrolIntegrationTester $, {
  required String name,
}) async {
  await $(Icons.settings).tap(); // Home -> Settings
  await $(_schedulesTile).scrollTo().tap(); // -> Schedules

  await $(Icons.add).tap(); // FAB: "Add a schedule"
  await $(TextField).containing(_nameLabel).enterText(name);
  await $(DropdownButtonFormField<Molecule>).tap();
  await $(_moleculeEstradiol).tap();
  await $(DropdownButtonFormField<AdministrationRoute>).tap();
  await $(_routeOral).tap();
  await $(TextField)
      .containing(_amountLabel)
      .enterText('2'); // sets schedule dose
  await $(_next).tap();

  await $(_intervalToggle).tap();
  await $(TextField).containing(_everyLabel).enterText('3');
  await $(_save).tap();
  await $(ListTile).containing(name).waitUntilVisible();

  // Pop Schedules -> Settings -> Home so the bottom nav (and Intakes tab) is
  // reachable again.
  await $.tester.pageBack();
  await $.pumpAndSettle();
  await $.tester.pageBack();
  await $.pumpAndSettle();
}

/// From the Intakes tab: FAB -> choose the schedule -> submit the intake form
/// with its prefilled values (date = now, dose = schedule dose).
Future<void> _recordIntake(
  PatrolIntegrationTester $, {
  required String scheduleName,
}) async {
  await $(Icons.add).tap(); // FAB: "Take an intake" -> ChooseSchedulePage
  await $(scheduleName).tap(); // pick the schedule (data, not localized)
  await $(_takeIntakeSubmit).tap(); // submit, pops back to the intakes list
}
