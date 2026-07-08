import 'package:mona/data/model/ester.dart';
import 'package:mona/i18n/translations.g.dart';

extension EsterL10n on Ester {
  String get localizedName => _EsterDisplayNames.resolve(this);
}

abstract final class _EsterDisplayNames {
  static final Map<String, String Function()> _labelsByName = {
    Ester.enanthate.name: () => t.enanthate,
    Ester.valerate.name: () => t.valerate,
    Ester.cypionate.name: () => t.cypionate,
    Ester.undecylate.name: () => t.undecylate,
    Ester.benzoate.name: () => t.benzoate,
    Ester.cypionateSuspension.name: () => t.cypionateSuspension,
  };

  static String resolve(Ester ester) {
    final labelBuilder = _labelsByName[ester.name];
    if (labelBuilder != null) {
      return labelBuilder();
    }
    final n = ester.name;
    return n[0].toUpperCase() + n.substring(1);
  }
}
