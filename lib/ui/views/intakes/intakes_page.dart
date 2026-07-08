import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/medication_intake_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/intakes/edit_intake_page.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class IntakesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicationIntakeProvider>(
      builder: (context, medicationIntakeProvider, child) {
        return MainPageWrapper(
          isLoading: medicationIntakeProvider.isLoading,
          isEmpty: medicationIntakeProvider.takenIntakes.isEmpty,
          emptyMessage: t.empty_intakes,
          child: ListView.builder(
            itemCount: medicationIntakeProvider.takenIntakes.length,
            itemBuilder: (context, index) {
              MedicationIntake intake =
                  medicationIntakeProvider.takenIntakesSortedDesc[index];
              return _buildIntakeTile(
                  context, intake, medicationIntakeProvider);
            },
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
      leading: CircleAvatar(
        child: Icon(
          intake.administrationRoute.icon,
        ),
      ),
      trailing: intake.notes != null ? Icon(Symbols.notes) : null,
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
