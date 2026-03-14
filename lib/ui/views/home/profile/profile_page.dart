import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/views/home/profile/notifications_page.dart';
import 'package:mona/ui/views/home/profile/schedules_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();
    final preferencesService = context.watch<PreferencesService>();

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Schedules'),
            subtitle: Text(medicationScheduleProvider.schedules.isEmpty
                ? 'No schedules'
                : '${medicationScheduleProvider.schedules.length} created'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => SchedulesPage(),
              ));
            },
          ),
          ListTile(
            title: Text('Notifications'),
            subtitle: Text(preferencesService.notificationsEnabled
                ? 'Enabled at ${preferencesService.notificationTime.format(context)}'
                : 'Disabled'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const NotificationsPage(),
              ));
            },
          )
        ],
      ),
    );
  }
}
