import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/services/update_service.dart';
import 'package:mona/ui/views/home/profile/notifications_page.dart';
import 'package:mona/ui/views/home/profile/schedules_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider = context.watch<MedicationScheduleProvider>();
    final preferencesService = context.watch<PreferencesService>();

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Schedules'),
            subtitle: Text(medicationScheduleProvider.schedules.isEmpty
                ? 'No schedules'
                : '${medicationScheduleProvider.schedules.length} created'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => SchedulesPage(),
              ));
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            subtitle: Text(preferencesService.notificationsEnabled
                ? 'Enabled at ${preferencesService.notificationTime.format(context)}'
                : 'Disabled'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const NotificationsPage(),
              ));
            },
          ),
          if (Platform.isAndroid) ...[
            const Divider(),
            SwitchListTile(
              title: const Text('Auto-Update'),
              subtitle: const Text('Automatically check new updates when app is launched'),
              value: preferencesService.autoCheckUpdatesEnabled,
              onChanged: (bool value) {
                preferencesService.setAutoCheckUpdatesEnabled(value);
              },
            ),
            ListTile(
              title: const Text('Check for Updates'),
              subtitle: const Text('Check for the latest version manually\nThis will connect you to Internet\nNo data will be sent)'),
              trailing: const Icon(Icons.system_update),
              onTap: () => UpdateService().checkForUpdates(context),
            ),
          ],
        ],
      ),
    );
  }
}
