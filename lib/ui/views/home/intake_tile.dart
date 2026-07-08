import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduled_occurrence.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/home/take_medication_page.dart';
import 'package:mona/ui/views/intakes/edit_intake_page.dart';
import 'package:provider/provider.dart';

class IntakeTile extends StatelessWidget {
  const IntakeTile(this.occurrence, {super.key});

  final IntakeSlot occurrence;

  MedicationSchedule get schedule => occurrence.schedule;
  ScheduleStatus get status => occurrence.status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final medicationIntakeProvider = context.watch<MedicationIntakeProvider>();
    final supplyItemProvider = context.watch<SupplyItemProvider>();
    final now = DateTime.now();

    final viewModel = IntakeTileViewModel(
      schedule: schedule,
      status: status,
      slotTime: occurrence.time,
      intakeProvider: medicationIntakeProvider,
      supplyProvider: supplyItemProvider,
      now: now,
      languageTag: context.intlLanguageTag,
      context: context,
    );

    final textColor =
        viewModel.isActive ? theme.colorScheme.onPrimaryContainer : null;

    return Card.filled(
      color: viewModel.isActive ? theme.colorScheme.primaryContainer : null,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          final intake = occurrence.intake;
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              fullscreenDialog: true,
              builder: (context) => intake != null
                  ? EditIntakePage(intake)
                  : TakeMedicationPage(
                      schedule,
                      scheduledTime: occurrence.time,
                    ),
            ),
          );
        },
        child: ListTile(
          leading: viewModel.tileIcon,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (viewModel.scheduledText != null)
                Text(
                  viewModel.scheduledText!,
                  style:
                      theme.textTheme.labelMedium?.copyWith(color: textColor),
                ),
              Text(
                schedule.name,
                style: theme.textTheme.titleMedium?.copyWith(color: textColor),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (status != ScheduleStatus.upcoming)
                Text(
                  viewModel.intakeInfo,
                  style: TextStyle(color: textColor),
                ),
              if (viewModel.warningText != null)
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.error_outline,
                          size: 16,
                          color: textColor,
                        ),
                      ),
                      const TextSpan(text: " "),
                      TextSpan(
                        text: viewModel.warningText!,
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class IntakeTileViewModel {
  IntakeTileViewModel(
      {required this.schedule,
      required this.status,
      required this.slotTime,
      required this.intakeProvider,
      required this.supplyProvider,
      required this.now,
      required this.languageTag,
      required this.context});

  final MedicationSchedule schedule;
  final ScheduleStatus status;
  final TimeOfDay? slotTime;
  final MedicationIntakeProvider intakeProvider;
  final SupplyItemProvider supplyProvider;
  final DateTime now;
  final String languageTag;
  final BuildContext context;

  bool get _isDailySlot => slotTime != null;

  Date get nextScheduled => schedule.scheduling.nextDate(schedule.startDate);

  Date? get lastScheduled =>
      schedule.scheduling.previousDate(schedule.startDate);

  Date? get lastTaken =>
      intakeProvider.getLastIntakeLocalDateForSchedule(schedule.id);

  int get daysUntilIntake => nextScheduled.daysAwayFromToday;

  int? get daysSinceLastTaken => lastTaken?.daysAwayFromToday;

  int? get daysSinceLastScheduled => lastScheduled?.daysAwayFromToday;

  String get intakeInfo {
    if (status == ScheduleStatus.taken) {
      return t.taken;
    }

    return "${schedule.dose} ${schedule.molecule.localizedUnit} • "
        "${schedule.molecule.localizedNameWithEster(schedule.ester)}";
  }

  String _inDays(int count) =>
      count == 1 ? t.tomorrow : t.inDaysCount(count: count);

  String _daysAgo(int count) =>
      count == 1 ? t.yesterday : t.daysAgoCount(count: count);

  String? get scheduledText {
    if (status == ScheduleStatus.upcoming) {
      final formatted = nextScheduled.format(DateFormat.MMMMd(languageTag));
      return "$formatted - ${_inDays(daysUntilIntake)}";
    }

    if (_isDailySlot) {
      return slotTime?.format(context);
    }

    switch (status) {
      case ScheduleStatus.today:
      case ScheduleStatus.todayOverdue:
      case ScheduleStatus.todayEarly:
      case ScheduleStatus.taken:
        return null;

      case ScheduleStatus.overdue:
        final formatted = lastScheduled!.format(DateFormat.MMMMd(languageTag));
        return "$formatted - ${_daysAgo(daysSinceLastScheduled!)}";

      case _:
        return null;
    }
  }

  String? get warningText {
    switch (status) {
      case ScheduleStatus.today:
      case ScheduleStatus.upcoming:
      case ScheduleStatus.taken:
      case ScheduleStatus.overdue:
        return null;

      case ScheduleStatus.todayEarly:
      case ScheduleStatus.todayOverdue:
        if (lastTaken == null) {
          return t.neverTakenYet;
        }

        final formatted = lastTaken!.format(DateFormat.MMMd(languageTag));
        return "${t.lastTaken} ${_daysAgo(daysSinceLastTaken!)} ($formatted)";
    }
  }

  bool get isActive =>
      (status == ScheduleStatus.today && slotTime == null) ||
      (status == ScheduleStatus.today &&
          slotTime != null &&
          !(slotTime!.isAfter(TimeOfDay.now()))) ||
      status == ScheduleStatus.overdue ||
      status == ScheduleStatus.todayOverdue ||
      status == ScheduleStatus.todayEarly;

  Widget get tileIcon {
    final theme = Theme.of(context);

    if (status == ScheduleStatus.taken) {
      return CircleAvatar(
        backgroundColor: theme.colorScheme.tertiary,
        child: Icon(
          Symbols.check,
          color: theme.colorScheme.onTertiary,
        ),
      );
    }

    if (status == ScheduleStatus.upcoming) {
      return CircleAvatar(
        backgroundColor: theme.colorScheme.secondary,
        child: Text(
          daysUntilIntake.toString(),
          style: TextStyle(
            color: theme.colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    final icon = status == ScheduleStatus.today ||
            status == ScheduleStatus.todayOverdue ||
            status == ScheduleStatus.todayEarly
        ? schedule.administrationRoute.icon
        : Symbols.schedule;

    return CircleAvatar(
      backgroundColor: theme.colorScheme.primary,
      child: Icon(
        icon,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }
}
