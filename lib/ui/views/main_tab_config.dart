import 'package:flutter/material.dart';

class MainTabConfig {
  final String title;
  final Widget page;
  final IconData icon;
  final IconData selectedIcon;
  final List<Widget> Function(BuildContext context)? buildActions;
  final FloatingActionButton? Function(BuildContext context)? buildFab;

  /// Key applied to the [BottomNavigationBarItem] corresponding to this tab
  /// so e2e tests can target it without depending on its (localized) label.
  final Key? navKey;

  const MainTabConfig({
    required this.title,
    required this.page,
    required this.icon,
    required this.selectedIcon,
    this.buildActions,
    this.buildFab,
    this.navKey,
  });
}
