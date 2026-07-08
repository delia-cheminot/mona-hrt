import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/i18n/helpers/ester_l10n.dart';
import 'package:mona/i18n/translations.g.dart';

extension MoleculeL10n on Molecule {
  String get localizedName => _KnownMoleculeDisplayNames.resolve(this);

  String localizedNameWithEster(Ester? ester) {
    if (ester == null) {
      return localizedName;
    }
    final compound = _compoundMedicationDisplayName(this, ester);
    return compound ?? '$localizedName ${ester.localizedName}';
  }

  String get localizedUnit {
    switch (unit) {
      case 'mg':
        return t.unitMilligram;
      default:
        return unit;
    }
  }
}

String? _compoundMedicationDisplayName(Molecule molecule, Ester ester) {
  if (molecule == KnownMolecules.estradiol) {
    switch (ester.name) {
      case 'enanthate':
        return t.medicationEstradiolEnanthate;
      case 'valerate':
        return t.medicationEstradiolValerate;
      case 'cypionate':
        return t.medicationEstradiolCypionate;
      case 'undecylate':
        return t.medicationEstradiolUndecylate;
      case 'benzoate':
        return t.medicationEstradiolBenzoate;
      case 'cypionate suspension':
        return t.medicationEstradiolCypionateSuspension;
      default:
        return null;
    }
  }

  if (molecule == KnownMolecules.testosterone) {
    switch (ester.name) {
      case 'enanthate':
        return t.medicationTestosteroneEnanthate;
      case 'valerate':
        return t.medicationTestosteroneValerate;
      case 'cypionate':
        return t.medicationTestosteroneCypionate;
      case 'undecylate':
        return t.medicationTestosteroneUndecylate;
      case 'benzoate':
        return t.medicationTestosteroneBenzoate;
      case 'cypionate suspension':
        return t.medicationTestosteroneCypionateSuspension;
      default:
        return null;
    }
  }

  return null;
}

abstract final class _KnownMoleculeDisplayNames {
  static final Map<String, String Function()> _labelsByNormalizedName = {
    KnownMolecules.estradiol.normalizedName: () => t.estradiol,
    KnownMolecules.progesterone.normalizedName: () => t.progesterone,
    KnownMolecules.testosterone.normalizedName: () => t.testosterone,
    KnownMolecules.nandrolone.normalizedName: () => t.nandrolone,
    KnownMolecules.dihydrotestosterone.normalizedName: () =>
        t.dihydrotestosterone,
    KnownMolecules.spironolactone.normalizedName: () => t.spironolactone,
    KnownMolecules.cyproteroneAcetate.normalizedName: () =>
        t.cyproteroneAcetate,
    KnownMolecules.leuprorelinAcetate.normalizedName: () =>
        t.leuprorelinAcetate,
    KnownMolecules.bicalutamide.normalizedName: () => t.bicalutamide,
    KnownMolecules.decapeptyl.normalizedName: () => t.decapeptyl,
    KnownMolecules.raloxifene.normalizedName: () => t.raloxifene,
    KnownMolecules.tamoxifen.normalizedName: () => t.tamoxifen,
    KnownMolecules.finasteride.normalizedName: () => t.finasteride,
    KnownMolecules.dutasteride.normalizedName: () => t.dutasteride,
    KnownMolecules.minoxidil.normalizedName: () => t.minoxidil,
    KnownMolecules.pioglitazone.normalizedName: () => t.pioglitazone,
  };

  static String resolve(Molecule molecule) {
    final labelBuilder = _labelsByNormalizedName[molecule.normalizedName];
    if (labelBuilder != null) {
      return labelBuilder();
    }
    final n = molecule.name;
    return n[0].toUpperCase() + n.substring(1);
  }
}
