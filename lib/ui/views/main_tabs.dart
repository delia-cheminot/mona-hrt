// main_tabs.dart
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/chart/blood_test_page.dart';
import 'chart/levels_page.dart';
import 'home/home_page.dart';
import 'home/settings/settings_page.dart';
import 'intakes/choose_schedule_page.dart';
import 'intakes/intakes_page.dart';
import 'main_tab_config.dart';
import 'supplies/new_item_page.dart';
import 'supplies/pharmacy_page.dart';

List<MainTabConfig> getMainTabs(BuildContext context) {
  return [
    MainTabConfig(
      title: t.nav_home,
      page: const HomePage(),
      icon: Symbols.home_rounded,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      buildActions: (context) => [
        IconButton(
          icon: const Icon(Symbols.settings_rounded),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ],
    ),
    MainTabConfig(
      title: t.nav_intakes,
      page: IntakesPage(),
      icon: Symbols.event_rounded,
      navKey: const ValueKey('navTabIntakes'),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      buildFab: (context) => FloatingActionButton(
        tooltip: t.takeAnIntake,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => ChooseSchedulePage(),
            ),
          );
        },
        child: const Icon(Symbols.add_rounded),
      ),
    ),
    MainTabConfig(
      title: t.nav_levels,
      page: const LevelsPage(),
      icon: Symbols.labs_rounded,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      buildActions: (context) => [
        IconButton(
          icon: const Icon(Symbols.lab_profile_rounded),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BloodTestPage()),
            );
          },
        ),
      ],
    ),
    MainTabConfig(
      title: t.nav_supplies,
      page: const PharmacyPage(),
      icon: Symbols.medication_rounded,
      navKey: const ValueKey('navTabSupplies'),
      buildFab: (context) => FloatingActionButton(
        tooltip: t.addAnItem,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              fullscreenDialog: true,
              builder: (context) => NewItemPage(),
            ),
          );
        },
        child: const Icon(Symbols.add_rounded),
      ),
    ),
  ];
}
