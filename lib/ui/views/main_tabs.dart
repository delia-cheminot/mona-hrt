// main_tabs.dart
import 'package:flutter/material.dart';
import 'package:mona/l10n/app_strings.dart';
import 'chart/chart_page.dart';
import 'home/home_page.dart';
import 'home/profile/profile_page.dart';
import 'intakes/intakes_page.dart';
import 'main_tab_config.dart';
import 'supplies/new_item_page.dart';
import 'supplies/pharmacy_page.dart';

List<MainTabConfig> buildMainTabs(AppStrings strings) => [
  MainTabConfig(
    title: 'Mona',
    page: HomePage(),
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    buildActions: (context) => [
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        },
      ),
    ],
  ),
  MainTabConfig(
    title: strings.tabIntakes,
    page: IntakesPage(),
    icon: Icons.event_outlined,
    selectedIcon: Icons.event_rounded,
  ),
  MainTabConfig(
    title: strings.tabLevels,
    page: ChartPage(),
    icon: Icons.trending_up_outlined,
    selectedIcon: Icons.trending_up_rounded,
  ),
  MainTabConfig(
    title: strings.tabSupplies,
    page: PharmacyPage(),
    icon: Icons.medication_outlined,
    selectedIcon: Icons.medication,
    buildFab: (context) => FloatingActionButton(
      tooltip: strings.addAnItem,
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
