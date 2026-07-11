import 'package:flutter/material.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/home/take_medication_page.dart';
import 'package:provider/provider.dart';

class ChooseSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MedicationScheduleProvider medicationScheduleProvider =
        context.read<MedicationScheduleProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(t.chooseSchedule),
      ),
      body: SafeArea(
        child: medicationScheduleProvider.schedules.isEmpty
            ? Center(
                child: Text(t.addSchedulesFirst),
              )
            : ListView.builder(
                padding: pagePadding,
                itemCount: medicationScheduleProvider.schedules.length,
                itemBuilder: (context, index) {
                  return ChooseScheduleTile(
                      schedule: medicationScheduleProvider.schedules[index]);
                },
              ),
      ),
    );
  }
}

class ChooseScheduleTile extends StatelessWidget {
  const ChooseScheduleTile({super.key, required this.schedule});

  final MedicationSchedule schedule;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String subtitle =
        "${schedule.dose} ${schedule.molecule.localizedUnit} • "
        "${schedule.molecule.localizedNameWithEster(schedule.ester)} • "
        "${schedule.administrationRoute.localizedName}";

    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              fullscreenDialog: true,
              builder: (context) => TakeMedicationPage(schedule),
            ),
          );
        },
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: borderPadding, vertical: 8.0),
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.primary,
            child: Icon(
              schedule.administrationRoute.icon,
              color: theme.colorScheme.primaryContainer,
            ),
          ),
          title: Text(
            schedule.name,
            style: theme.textTheme.titleMedium,
          ),
          subtitle: Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
