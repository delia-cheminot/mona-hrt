import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/ui/views/home/settings/schedules/edit_schedule/edit_schedule_page.dart';
import 'package:provider/provider.dart';
import 'new_schedule_page.dart';

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();

    final theme = Theme.of(context);

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Schedules'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules'),
      ),
      body: SafeArea(
        child: medicationScheduleProvider.schedules.isEmpty
            ? Center(
                child: Text('Add a schedule to get started.'),
              )
            : ListView.builder(
                itemCount: medicationScheduleProvider.schedules.length,
                itemBuilder: (context, index) {
                  final schedule = medicationScheduleProvider.schedules[index];
                  return ListTile(
                    title: Text(schedule.name),
                    subtitle: Text("$schedule"),
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.onPrimaryContainer,
                      child: Icon(
                        schedule.administrationRoute.icon,
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              EditSchedulePage(schedule: schedule),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (context) => NewSchedulePage(),
          ));
        },
        tooltip: 'Add a schedule',
        child: Icon(Icons.add),
      ),
    );
  }
}
