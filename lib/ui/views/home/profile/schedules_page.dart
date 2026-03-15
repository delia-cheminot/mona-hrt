import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/views/home/profile/edit_schedule_page.dart';
import 'package:provider/provider.dart';
import 'new_schedule_page.dart';

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();
    final strings = context.watch<PreferencesService>().strings;

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(strings.schedules),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.schedules),
      ),
      body: SafeArea(
        child: medicationScheduleProvider.schedules.isEmpty
            ? Center(
                child: Text(strings.addScheduleToGetStarted),
              )
            : ListView.builder(
                itemCount: medicationScheduleProvider.schedules.length,
                itemBuilder: (context, index) {
                  final schedule = medicationScheduleProvider.schedules[index];
                  return ListTile(
                    title: Text(schedule.name),
                    subtitle: Text("$schedule"),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          fullscreenDialog: true,
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
        tooltip: strings.addASchedule,
        child: Icon(Icons.add),
      ),
    );
  }
}
