import 'package:mona/data/model/units.dart';
import 'package:mona/i18n/translations.g.dart';

extension EstradiolUnitL10n on EstradiolUnit {
  String get localizedName {
    switch (this) {
      case EstradiolUnit.pg_mL:
        return t.unitPgPerMl;
      case EstradiolUnit.pmol_L:
        return t.unitPmolPerL;
    }
  }
}

extension TestosteroneUnitL10n on TestosteroneUnit {
  String get localizedName {
    switch (this) {
      case TestosteroneUnit.ng_dL:
        return t.unitNgPerDl;
      case TestosteroneUnit.nmol_L:
        return t.unitNmolPerL;
    }
  }
}

extension UnitsL10n on Units {
  String get localizedName =>
      '${estradiol.localizedName} & ${testosterone.localizedName}';
}
