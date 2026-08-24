import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/medication_intake_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/intakes/edit_intake_page.dart';
import 'package:mona/ui/views/intakes/hrt_counter_card.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:mona/util/hrt_duration.dart';
import 'package:provider/provider.dart';

class IntakesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferencesService = context.watch<PreferencesService>();

    return Consumer<MedicationIntakeProvider>(
      builder: (context, medicationIntakeProvider, child) {
        final firstDate = medicationIntakeProvider.firstTakenLocalDate;
        final intakes = medicationIntakeProvider.takenIntakesSortedDesc;

        return MainPageWrapper(
          isLoading: medicationIntakeProvider.isLoading,
          isEmpty: medicationIntakeProvider.takenIntakes.isEmpty,
          emptyMessage: t.empty_intakes,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: pagePadding,
                  child: HrtCounterCard(
                    enabled: preferencesService.hrtCounterEnabled,
                    duration:
                        firstDate == null ? null : hrtDurationSince(firstDate),
                    intakeCount: medicationIntakeProvider.takenIntakes.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 8),
              ),
              SliverM3ECardList(
                key: const ValueKey('intakesList'),
                margin: pagePadding,
                padding: EdgeInsets.zero,
                color: Theme.of(context).colorScheme.surface,
                itemCount: intakes.length,
                itemBuilder: (context, index) {
                  return _buildIntakeTile(
                      context, intakes[index], medicationIntakeProvider);
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: borderPadding),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIntakeTile(BuildContext context, MedicationIntake intake,
      MedicationIntakeProvider medicationIntakeProvider) {
    final locale = context.intlLanguageTag;
    final dateText =
        DateFormat.yMMMd(locale).format(intake.takenLocalDateTime!);

    return ListTile(
      title: Text(dateText),
      subtitle: Text(intake.localizedSummary),
      leading: Icon(
        intake.administrationRoute.icon,
      ),
      trailing: intake.notes != null ? Icon(Symbols.notes_rounded) : null,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => EditIntakePage(intake),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
