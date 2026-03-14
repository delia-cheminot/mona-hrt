import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/ui/views/home/settings/schedules/edit_schedule/edit_schedule_main_info.dart';
import 'package:mona/ui/views/home/settings/schedules/edit_schedule/edit_schedule_notifications_page.dart';
import 'package:provider/provider.dart';

class EditSchedulePage extends StatelessWidget {
  final MedicationSchedule schedule;

  EditSchedulePage({required this.schedule});

  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();
    final currentSchedule = medicationScheduleProvider.schedules
        .firstWhereOrNull((s) => s.id == schedule.id);

    if (currentSchedule == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.canPop(context)) Navigator.pop(context);
      });
      return SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentSchedule.name),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Edit schedule info'),
            subtitle: Text(currentSchedule.toString()),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => EditScheduleMainInfoPage(
                  schedule: currentSchedule,
                ),
              ));
            },
          ),
          ListTile(
            title: Text('Notifications'),
            subtitle: currentSchedule.notificationTimes.isEmpty
                ? Text('No notifications')
                : Text(
                    currentSchedule.notificationTimes
                        .map((time) => time.format(context))
                        .join(', '),
                  ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (context) => EditScheduleNotificationsPage(
                  schedule: currentSchedule,
                ),
              ));
            },
          ),
        ],
      ),
    );
  }
}
