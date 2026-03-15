import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';
import 'main_tabs.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _selectIndex(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    final tabs = buildMainTabs(strings);
    final currentTab = tabs[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTab.title),
        centerTitle: true,
        actions: currentTab.buildActions?.call(context),
      ),
      body: SafeArea(
        child: currentTab.page,
      ),
      //     |----------------------------------------------------|      
      //     |  TODO implement indexed stack + correct scroll bug |
      //     |----------------------------------------------------|      
      //        ||
      // (\__/) ||
      // (•ㅅ•) ||
      // / 　 づ
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _selectIndex,
        destinations: [
          for (final tab in tabs)
            NavigationDestination(
              label: tab.title,
              icon: Icon(tab.icon),
              selectedIcon: Icon(tab.selectedIcon),
            ),
        ],
      ),
      floatingActionButton: currentTab.buildFab?.call(context),
    );
  }
}
