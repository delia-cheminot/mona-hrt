import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/i18n/translations.g.dart';

extension InjectionSideL10n on InjectionSide {
  String get localizedName => _InjectionSideDisplayNames.resolve(this);

  String get localizedSummary => _InjectionSideSummary.resolve(this);
}

abstract final class _InjectionSideDisplayNames {
  static final Map<String, String Function()> _labelsByName = {
    InjectionSide.left.name: () => t.injectionSideLeft,
    InjectionSide.right.name: () => t.injectionSideRight,
  };

  static String resolve(InjectionSide side) {
    final labelBuilder = _labelsByName[side.name];
    if (labelBuilder != null) {
      return labelBuilder();
    }
    final n = side.name;
    return n[0].toUpperCase() + n.substring(1);
  }
}

abstract final class _InjectionSideSummary {
  static final Map<String, String Function()> _labelsByName = {
    InjectionSide.left.name: () => t.intakeSummaryInjectionSideLeft,
    InjectionSide.right.name: () => t.intakeSummaryInjectionSideRight,
  };

  static String resolve(InjectionSide side) {
    final labelBuilder = _labelsByName[side.name];
    if (labelBuilder != null) {
      return labelBuilder();
    }
    final n = side.name;
    return n[0].toUpperCase() + n.substring(1);
  }
}
