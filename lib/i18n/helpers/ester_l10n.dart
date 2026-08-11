import 'package:mona/data/model/ester.dart';
import 'package:mona/i18n/translations.g.dart';

extension EsterL10n on Ester {
  String get localizedName => switch (this) {
        Ester.enanthate => t.enanthate,
        Ester.valerate => t.valerate,
        Ester.cypionate => t.cypionate,
        Ester.undecylate => t.undecylate,
        Ester.benzoate => t.benzoate,
        Ester.cypionateSuspension => t.cypionateSuspension,
      };
}
