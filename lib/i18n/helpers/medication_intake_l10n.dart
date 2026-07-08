import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/injection_side_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';

extension MedicationIntakeL10n on MedicationIntake {
  String get localizedSummary {
    final firstLine = '$takenDose ${molecule.localizedUnit} • '
        '${molecule.localizedNameWithEster(ester)} • '
        '${administrationRoute.localizedName}';
    if (side == null) return firstLine;
    return '$firstLine • ${side!.localizedSummary}';
  }
}
