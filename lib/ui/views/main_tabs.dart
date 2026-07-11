// main_tabs.dart
import 'package:flutter/material.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/chart/blood_test_page.dart';
import 'chart/chart_page.dart';
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
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      buildActions: (context) => [
        IconButton(
          icon: const Icon(Icons.settings),
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
      icon: Icons.event_outlined,
      selectedIcon: Icons.event_rounded,
      navKey: const ValueKey('navTabIntakes'),
      buildFab: (context) => FloatingActionButton(
        tooltip: t.takeAnIntake,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => ChooseSchedulePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    ),
    MainTabConfig(
      title: t.nav_levels,
      page: ChartPage(),
      icon: Icons.trending_up_outlined,
      selectedIcon: Icons.trending_up_rounded,
      buildActions: (context) => [
        IconButton(
          icon: const Icon(Icons.bloodtype_outlined),
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
      icon: Icons.medication_outlined,
      selectedIcon: Icons.medication,
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
        child: const Icon(Icons.add),
      ),
    ),
  ];
}
