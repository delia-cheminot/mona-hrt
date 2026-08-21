import 'package:flutter/material.dart';
import 'package:mona/distribution.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/services/update_service.dart';
import 'package:mona/ui/views/main_tab_config.dart';
import 'package:mona/ui/widgets/liquid_glass_bottom_clamp.dart';
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
    return LiquidGlassBottomClamp(
      // woo back baby
      child: PopScope(
        canPop: _selectedIndex == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          if (_selectedIndex != 0) {
            _selectIndex(0);
          }
        },
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              for (final tab in tabs)
                Scaffold(
                  backgroundColor: tab.backgroundColor,
                  appBar: AppBar(
                    title: Text(tab.title),
                    centerTitle: true,
                    actions: tab.buildActions?.call(context),
                    backgroundColor: tab.backgroundColor,
                  ),
                  body: SafeArea(child: tab.page),
                ),
            ],
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
              ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: isIosLiquidGlass ? 8 : 0,
                  ),
                  child: NavigationBar(
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
                ),
              ),
            ],
          ),
          floatingActionButton: currentTab.buildFab?.call(context),
        ),
      ),
    );
  }
}
