import 'package:flutter/material.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/helpers/medication_schedule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/home/settings/schedules/edit_schedule/edit_schedule_page.dart';
import 'package:provider/provider.dart';

import 'new_schedule_main_info_page.dart';

class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.schedules),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.schedules),
      ),
      body: SafeArea(
        child: medicationScheduleProvider.schedules.isEmpty
            ? Center(
                child: Text(t.addScheduleToGetStarted),
              )
            : ListView.builder(
                itemCount: medicationScheduleProvider.schedules.length,
                itemBuilder: (context, index) {
                  final schedule = medicationScheduleProvider.schedules[index];
                  return ListTile(
                    title: Text(schedule.name),
                    subtitle: Text(schedule.localizedSummaryWithFrequency),
                    leading: CircleAvatar(
                      child: Icon(
                        schedule.administrationRoute.icon,
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
            builder: (context) => const NewScheduleMainInfoPage(),
          ));
        },
        tooltip: t.addSchedule,
        child: Icon(Icons.add),
      ),
    );
  }
}
