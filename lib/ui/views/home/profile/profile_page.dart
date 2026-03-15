import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/views/home/profile/languages_page.dart';
import 'package:mona/ui/views/home/profile/notifications_page.dart';
import 'package:mona/ui/views/home/profile/schedules_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();
    final preferencesService = context.watch<PreferencesService>();
    final strings = preferencesService.strings;

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(strings.settings)),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(strings.settings)),
      body: ListView(
        children: [
          ListTile(
            title: Text(strings.schedules),
            subtitle: Text(medicationScheduleProvider.schedules.isEmpty
                ? strings.noSchedules
                : strings.schedulesCount(
                    medicationScheduleProvider.schedules.length)),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => SchedulesPage(),
              ));
            },
          ),
          ListTile(
            title: Text(strings.notifications),
            subtitle: Text(preferencesService.notificationsEnabled
                ? strings.notificationsEnabledAt(
                    preferencesService.notificationTime.format(context))
                : strings.notificationsDisabled),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const NotificationsPage(),
              ));
            },
          ),
          ListTile(
            title: Text(strings.languages),
            subtitle: Text(strings.currentLanguageName),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => const LanguagesPage(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
