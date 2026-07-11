import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/controllers/slots_builder.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/home/intake_tile.dart';
import 'package:mona/ui/views/home/split_by_day.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = context.watch<MedicationScheduleProvider>();
    final intakeProvider = context.watch<MedicationIntakeProvider>();

    final occurrences = splitByDay(
      SlotsBuilder(intakeProvider, scheduleProvider).intakeSlots(),
    );

    return MainPageWrapper(
      isLoading: (scheduleProvider.isLoading || intakeProvider.isLoading),
      isEmpty: scheduleProvider.schedules.isEmpty,
      emptyMessage: t.empty_home,
      child: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(_todayTitle(context)),
              if (occurrences.today.isEmpty)
                _NoIntakesDueCard()
              else
                ...occurrences.today.map(IntakeTile.new),
              if (occurrences.upcoming.isNotEmpty) ...[
                _SectionTitle(t.upcoming),
                ...occurrences.upcoming.map(IntakeTile.new),
              ],
              const SizedBox(height: borderPadding),
            ],
          ),
        ),
      ),
    );
  }

  String _todayTitle(BuildContext context) {
    final formatted =
        Date.today().format(DateFormat.MMMMEEEEd(context.intlLanguageTag));
    return formatted.replaceRange(
        0, 1, formatted.substring(0, 1).toUpperCase());
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}

class _NoIntakesDueCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card.filled(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.tertiary,
          child: Icon(Symbols.check, color: theme.colorScheme.onTertiary),
        ),
        title: Text(t.allDone, style: theme.textTheme.titleMedium),
        subtitle: Text(t.noIntakesDue),
      ),
    );
  }
}
