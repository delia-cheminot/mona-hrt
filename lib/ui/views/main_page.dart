import 'package:flutter/material.dart';
import 'package:mona/distribution.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/services/update_service.dart';
import 'package:mona/ui/views/main_tab_config.dart';
import 'package:mona/ui/widgets/update_banner.dart';
import 'package:provider/provider.dart';
import 'main_tabs.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  bool _isUpdateAvailable = false;
  bool _hideUpdateBanner = false;

  List<MainTabConfig> get tabs => getMainTabs(context);
  MainTabConfig get currentTab => tabs[_selectedIndex];

  void _selectIndex(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runAutomaticUpdateCheck();
    });
  }

  Future<void> _runAutomaticUpdateCheck() async {
    if (isStoreDistribution) return;
    final prefs = context.read<PreferencesService>();
    if (!prefs.autoCheckUpdatesEnabled) return;

    final isAvailable = await UpdateService().isUpdateAvailable();

    if (isAvailable && mounted) {
      setState(() {
        _isUpdateAvailable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // woo back baby
    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_selectedIndex != 0) {
          _selectIndex(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(currentTab.title),
          centerTitle: true,
          actions: currentTab.buildActions?.call(context),
        ),
        body: SafeArea(
          child: currentTab.page,
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isUpdateAvailable && !_hideUpdateBanner)
              UpdateBanner(
                onClose: () {
                  setState(() {
                    _hideUpdateBanner = true;
                  });
                },
              ),
            NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _selectIndex,
              destinations: [
                for (final tab in tabs)
                  NavigationDestination(
                    key: tab.navKey,
                    label: tab.title,
                    icon: Icon(tab.icon),
                    selectedIcon: Icon(tab.selectedIcon),
                  ),
              ],
            ),
          ],
        ),
        floatingActionButton: currentTab.buildFab?.call(context),
      ),
    );
  }
}
