import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/distribution.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/backup_service.dart';
import 'package:mona/services/notification_service.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/services/update_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/home/settings/injection_sites_page.dart';
import 'package:mona/ui/views/home/settings/language_page.dart';
import 'package:mona/ui/views/home/settings/schedules/schedules_page.dart';
import 'package:mona/ui/views/home/settings/theme_page.dart';
import 'package:mona/ui/views/home/settings/units_page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  late bool _notificationsEnabled;
  late bool _autoCheckUpdatesEnabled;
  bool _permissionGranted = true;
  bool _exactAlarmsGranted = true;
  late PreferencesService _preferencesService;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _notificationsEnabled = _preferencesService.notificationsEnabled;
    _autoCheckUpdatesEnabled = _preferencesService.autoCheckUpdatesEnabled;
    _checkPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkPermission();
    }
  }

  Future<void> _checkPermission() async {
    final granted = await NotificationService().hasPermission();
    final exactAlarmsGranted =
        await NotificationService().canScheduleExactAlarms();
    setState(() {
      _permissionGranted = granted;
      _exactAlarmsGranted = exactAlarmsGranted;
    });
  }

  Future<void> _toggleNotifications(bool value) async {
    if (value == true) {
      await NotificationService().requestNotificationPermission();
    }

    await _preferencesService.setNotificationsEnabled(value);
    await _checkPermission();

    setState(() {
      _notificationsEnabled = value;
    });
  }

  Future<void> _toggleAutoCheckUpdates(bool value) async {
    await _preferencesService.setAutoCheckUpdatesEnabled(value);

    setState(() {
      _autoCheckUpdatesEnabled = value;
    });
  }

  Future<void> _exportData() async {
    try {
      final savedPath = await BackupService().exportData();

      if (savedPath != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.backupSavedTo(path: savedPath)),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.exportFailed(error: e))),
        );
      }
    }
  }

  Future<void> _importData() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.importDataTitle),
        content: Text(t.importDataOverwriteWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error),
            child: Text(t.importConfirm),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        final success = await BackupService().importData();
        if (success && mounted) {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text(t.importSuccessfulTitle),
              content: Text(t.importRestartRequired),
              actions: [
                TextButton(
                  onPressed: () => exit(0),
                  child: Text(t.closeApp),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.importFailed(error: e))),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();
    final preferencesService = context.watch<PreferencesService>();

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(t.settingsTitle)),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.settingsTitle)),
      body: ListView(
        children: [
          //
          // ==== Schedules and notifications ====
          //
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: borderPadding, vertical: 8.0),
            child: Text(
              t.schedulesAndNotifications,
            ),
          ),
          ListTile(
            key: const ValueKey('settingsSchedulesTile'),
            title: Text(t.schedules),
            subtitle: Text(medicationScheduleProvider.schedules.isEmpty
                ? t.noSchedules
                : t.schedulesCreated(
                    count: medicationScheduleProvider.schedules.length)),
            trailing: Icon(Symbols.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => SchedulesPage(),
              ));
            },
          ),
          SwitchListTile(
            title: Text(t.enableNotifications),
            subtitle: Text(t.enableNotificationsDescription),
            value: _notificationsEnabled,
            onChanged: _toggleNotifications,
          ),
          if (_notificationsEnabled && !_permissionGranted)
            ListTile(
              leading: const Icon(Symbols.info_rounded),
              title: Text(t.notificationsDisabledTitle),
              subtitle: Text(t.clickToOpenSettings),
              trailing: const Icon(Symbols.chevron_right_rounded),
              onTap: () async {
                await openAppSettings();
              },
            ),
          if (_notificationsEnabled &&
              _permissionGranted &&
              !_exactAlarmsGranted)
            ListTile(
              leading: const Icon(Symbols.info_rounded),
              title: Text(t.exactRemindersDisabled),
              subtitle: Text(t.remindersDelayed),
              trailing: const Icon(Symbols.chevron_right_rounded),
              onTap: () async {
                await openAppSettings();
              },
            ),
          const Divider(),
          //
          // ==== Medical settings ====
          //
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: borderPadding, vertical: 8.0),
            child: Text(t.medicalSettings),
          ),
          ListTile(
            key: const ValueKey('settingsInjectionSitesTile'),
            title: Text(t.injectionSites),
            subtitle: Text(t.injectionSitesDescription),
            trailing: Icon(Symbols.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => const InjectionSitesPage()));
            },
          ),
          ListTile(
            title: Text(t.units),
            subtitle: Text(preferencesService.units.localizedName),
            trailing: Icon(Symbols.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute<void>(builder: (context) => UnitsPage()));
            },
          ),
          ListTile(
            key: const ValueKey('settingsStartOfDayTile'),
            title: Text(t.startOfDay),
            subtitle: Text(
              t.startOfDayDescription(
                time: preferencesService.logicalDayStart.format(context),
              ),
            ),
            trailing: const Icon(Symbols.access_time_rounded),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: preferencesService.logicalDayStart,
              );
              if (picked != null) {
                await preferencesService.setLogicalDayStart(picked);
              }
            },
          ),
          const Divider(),
          //
          // ==== General ====
          //
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: borderPadding, vertical: 8.0),
            child: Text(
              t.general,
            ),
          ),
          ListTile(
            title: Text(t.language),
            subtitle: Text(
              preferencesService.savedLanguageTag == null
                  ? t.languageFollowDevice
                  : (LanguagePage.nativeNameOf(
                          preferencesService.savedLanguageTag!) ??
                      preferencesService.savedLanguageTag!),
            ),
            trailing: Icon(Symbols.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (context) => LanguagePage()),
              );
            },
          ),
          ListTile(
            title: Text(t.theme),
            subtitle: Text(t.themeCustomizeColors),
            trailing: const Icon(Symbols.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (context) => const ThemePage()),
              );
            },
          ),
          SwitchListTile(
            title: Text(t.HrtCounter),
            subtitle: Text(t.HrtCounterDescription),
            value: preferencesService.hrtCounterEnabled,
            onChanged: (value) =>
                preferencesService.setHrtCounterEnabled(value),
          ),
          if (Platform.isAndroid && !isStoreDistribution) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: borderPadding, vertical: 8.0),
              child: Text(
                t.updates,
              ),
            ),
            SwitchListTile(
              title: Text(t.autoUpdate),
              subtitle: Text(t.autoUpdateDescription),
              value: _autoCheckUpdatesEnabled,
              onChanged: _toggleAutoCheckUpdates,
            ),
            ListTile(
              title: Text(t.checkForUpdates),
              subtitle: Text(t.checkForUpdatesDescription),
              trailing: const Icon(Symbols.update_rounded),
              onTap: () => UpdateService().checkForUpdates(context),
            ),
          ],
          const Divider(),
          //
          // ==== Data management ====
          //
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: borderPadding, vertical: 8.0),
            child: Text(
              t.dataManagement,
            ),
          ),
          ListTile(
            title: Text(t.exportDataTitle),
            subtitle: Text(t.exportDataSubtitle),
            trailing: const Icon(Symbols.upload_rounded),
            onTap: _exportData,
          ),
          ListTile(
            title: Text(t.importDataTitle),
            subtitle: Text(t.importDataSubtitle),
            trailing: const Icon(Symbols.download_rounded),
            onTap: _importData,
          ),
          const SizedBox(height: 32),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              final info = snapshot.data!;
              return Center(
                child: Text(
                  t.appVersion(version: info.version),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
