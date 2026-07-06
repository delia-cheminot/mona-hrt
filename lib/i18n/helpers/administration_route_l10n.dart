import 'package:mona/data/model/administration_route.dart';
import 'package:mona/i18n/translations.g.dart';

extension AdministrationRouteL10n on AdministrationRoute {
  String get localizedName => _AdministrationRouteDisplayNames.resolve(this);

  String localizedUnit(num count) =>
      _AdministrationRouteUnits.resolve(this, count);
}

abstract final class _AdministrationRouteDisplayNames {
  static final Map<String, String Function()> _labelsByName = {
    AdministrationRoute.injection.name: () => t.injection,
    AdministrationRoute.oral.name: () => t.oral,
    AdministrationRoute.sublingual.name: () => t.sublingual,
    AdministrationRoute.patch.name: () => t.patch,
    AdministrationRoute.gel.name: () => t.gel,
    AdministrationRoute.implant.name: () => t.implant,
    AdministrationRoute.suppository.name: () => t.suppository,
    AdministrationRoute.transdermalSpray.name: () => t.transdermalSpray,
    AdministrationRoute.transdermalDrops.name: () => t.transdermalDrops,
  };

  static String resolve(AdministrationRoute route) {
    final labelBuilder = _labelsByName[route.name];
    if (labelBuilder != null) {
      return labelBuilder();
    }
    final n = route.name;
    return n[0].toUpperCase() + n.substring(1);
  }
}

abstract final class _AdministrationRouteUnits {
  static final Map<String, String Function(num count)> _labelsByName = {
    AdministrationRoute.injection.name: (c) =>
        t.administrationRouteUnitMl(count: c),
    AdministrationRoute.oral.name: (c) =>
        t.administrationRouteUnitPill(count: c),
    AdministrationRoute.sublingual.name: (c) =>
        t.administrationRouteUnitPill(count: c),
    AdministrationRoute.patch.name: (c) =>
        t.administrationRouteUnitPatch(count: c),
    AdministrationRoute.gel.name: (c) =>
        t.administrationRouteUnitPump(count: c),
    AdministrationRoute.implant.name: (c) =>
        t.administrationRouteUnitImplant(count: c),
    AdministrationRoute.suppository.name: (c) =>
        t.administrationRouteUnitSuppository(count: c),
    AdministrationRoute.transdermalSpray.name: (c) =>
        t.administrationRouteUnitSpray(count: c),
    AdministrationRoute.transdermalDrops.name: (c) =>
        t.administrationRouteUnitMl(count: c),
  };

  static String resolve(AdministrationRoute route, num count) {
    final labelBuilder = _labelsByName[route.name];
    if (labelBuilder != null) {
      return labelBuilder(count);
    }
    return route.unit;
  }
}
