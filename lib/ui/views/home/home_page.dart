import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/controllers/schedule_manager.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/l10n/app_strings.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/home/intake_tile.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();
    final medicationIntakeProvider = context.watch<MedicationIntakeProvider>();
    final strings = context.watch<PreferencesService>().strings;

    return MainPageWrapper(
      isLoading: (medicationScheduleProvider.isLoading ||
          medicationIntakeProvider.isLoading),
      isEmpty: medicationScheduleProvider.schedules.isEmpty,
      emptyMessage: strings.startByAddingSchedule,
      child: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildTodaySection(context, strings),
              ..._buildUpcomingSection(context, strings),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScheduleSection(
    BuildContext context, {
    required String title,
    required List<ScheduleStatus> statuses,
    required AppStrings strings,
    bool showAllDoneMessage = false,
  }) {
    final theme = Theme.of(context);
    final scheduleManager = ScheduleManager(
      context.watch<MedicationScheduleProvider>(),
      context.watch<MedicationIntakeProvider>(),
    );

    final schedules = statuses
        .expand((status) => scheduleManager.getSchedulesByStatus(status))
        .toList();

    if (schedules.isEmpty && !showAllDoneMessage) return [];

    final widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(title, style: theme.textTheme.headlineMedium),
      ),
    ];

    if (schedules.isEmpty && showAllDoneMessage) {
      widgets.add(
        Card.filled(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.tertiary,
              child: Icon(
                Symbols.check,
                color: theme.colorScheme.onTertiary,
              ),
            ),
            title: Text(strings.allDone, style: theme.textTheme.titleMedium),
            subtitle: Text(strings.noIntakesToday),
          ),
        ),
      );
      return widgets;
    }

    widgets.addAll(schedules.map((schedule) {
      final status = statuses.firstWhere(
        (s) => scheduleManager.getSchedulesByStatus(s).contains(schedule),
      );
      return IntakeTile(schedule: schedule, status: status, strings: strings);
    }));

    return widgets;
  }

  List<Widget> _buildTodaySection(BuildContext context, AppStrings strings) =>
      _buildScheduleSection(
        context,
        title: "${strings.today} - ${DateFormat.MMMMd().format(DateTime.now())}",
        statuses: [
          ScheduleStatus.overdue,
          ScheduleStatus.todayOverdue,
          ScheduleStatus.today
        ],
        strings: strings,
        showAllDoneMessage: true,
      );

  List<Widget> _buildUpcomingSection(BuildContext context, AppStrings strings) =>
      _buildScheduleSection(
        context,
        title: strings.upcoming,
        statuses: [ScheduleStatus.upcoming],
        strings: strings,
      );
}
