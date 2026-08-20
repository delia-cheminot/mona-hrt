import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/intake_slot.dart';
import 'package:mona/data/model/medication_schedule.dart';
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
  const IntakeTile(this.slot, {super.key});

  final IntakeSlot slot;

  MedicationSchedule get schedule => slot.schedule;
  ScheduleStatus get status => slot.status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final medicationIntakeProvider = context.watch<MedicationIntakeProvider>();
    final supplyItemProvider = context.watch<SupplyItemProvider>();
    final now = DateTime.now();

    final viewModel = IntakeTileViewModel(
      schedule: schedule,
      status: status,
      slotTime: slot.time,
      date: slot.date,
      intakeProvider: medicationIntakeProvider,
      supplyProvider: supplyItemProvider,
      now: now,
      languageTag: context.intlLanguageTag,
      context: context,
    );

    return ListTile(
      onTap: () {
        final intake = slot.intake;
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (context) => intake != null
                ? EditIntakePage(intake)
                : TakeMedicationPage(
                    schedule,
                    scheduledTime: slot.time,
                  ),
          ),
        );
      },
      leading: viewModel.tileIcon,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (viewModel.scheduledText != null)
            Text(
              viewModel.scheduledText!,
              style: theme.textTheme.labelMedium,
            ),
          Text(
            schedule.name,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (status != ScheduleStatus.upcoming) Text(viewModel.intakeInfo),
          if (viewModel.warningText != null)
            Text.rich(
              TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.error_outline,
                      size: 16,
                    ),
                  ),
                  const TextSpan(text: " "),
                  TextSpan(text: viewModel.warningText!),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class IntakeTileViewModel {
  IntakeTileViewModel(
      {required this.schedule,
      required this.status,
      required this.slotTime,
      required this.date,
      required this.intakeProvider,
      required this.supplyProvider,
      required this.now,
      required this.languageTag,
      required this.context});

  final MedicationSchedule schedule;
  final ScheduleStatus status;
  final TimeOfDay? slotTime;
  final Date date;
  final MedicationIntakeProvider intakeProvider;
  final SupplyItemProvider supplyProvider;
  final DateTime now;
  final String languageTag;
  final BuildContext context;

  bool get _isDailySlot => slotTime != null;

  Date? get lastTaken =>
      intakeProvider.getLastIntakeLocalDateForSchedule(schedule.id);

  int get dateDifference => date.daysAwayFromToday;

  int? get daysSinceLastTaken => lastTaken?.daysAwayFromToday;

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
      final formatted = date.format(DateFormat.MMMMd(languageTag));
      return "$formatted - ${_inDays(dateDifference)}";
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
        final formatted = date.format(DateFormat.MMMMd(languageTag));
        return "$formatted - ${_daysAgo(dateDifference)}";

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
      case ScheduleStatus.asNeeded:
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

  Widget get tileIcon {
    final theme = Theme.of(context);

    if (status == ScheduleStatus.taken) {
      return CircleAvatar(
        backgroundColor: theme.colorScheme.tertiaryContainer,
        child: Icon(
          Symbols.check,
          color: theme.colorScheme.onTertiaryContainer,
        ),
      );
    }

    if (status == ScheduleStatus.upcoming) {
      return CircleAvatar(
        backgroundColor: theme.colorScheme.secondaryContainer,
        child: Text(
          dateDifference.toString(),
          style: TextStyle(
            color: theme.colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (status == ScheduleStatus.asNeeded) {
      return CircleAvatar(
        backgroundColor: theme.colorScheme.secondaryContainer,
        child: Icon(
          schedule.administrationRoute.icon,
          color: theme.colorScheme.onSecondaryContainer,
        ),
      );
    }

    final icon = status == ScheduleStatus.today ||
            status == ScheduleStatus.todayOverdue ||
            status == ScheduleStatus.todayEarly
        ? schedule.administrationRoute.icon
        : Symbols.schedule;

    final backgroundColor =
        _isDailySlot && slotTime!.isAfter(TimeOfDay.fromDateTime(now))
            ? theme.colorScheme.secondaryContainer
            : theme.colorScheme.primaryContainer;

    final iconColor =
        _isDailySlot && slotTime!.isAfter(TimeOfDay.fromDateTime(now))
            ? theme.colorScheme.onSecondaryContainer
            : theme.colorScheme.onPrimaryContainer;

    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
