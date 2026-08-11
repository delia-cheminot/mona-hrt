import 'package:mona/data/model/administration_route.dart';
import 'package:mona/i18n/translations.g.dart';

extension AdministrationRouteL10n on AdministrationRoute {
  String get localizedName => switch (this) {
        AdministrationRoute.injection => t.injection,
        AdministrationRoute.oral => t.oral,
        AdministrationRoute.sublingual => t.sublingual,
        AdministrationRoute.patch => t.patch,
        AdministrationRoute.gel => t.gel,
        AdministrationRoute.implant => t.implant,
        AdministrationRoute.suppository => t.suppository,
        AdministrationRoute.transdermalSpray => t.transdermalSpray,
        AdministrationRoute.transdermalDrops => t.transdermalDrops,
      };

  String localizedUnit(num count) => switch (this) {
        AdministrationRoute.injection =>
          t.administrationRouteUnitMl(count: count),
        AdministrationRoute.oral => t.administrationRouteUnitPill(count: count),
        AdministrationRoute.sublingual =>
          t.administrationRouteUnitPill(count: count),
        AdministrationRoute.patch =>
          t.administrationRouteUnitPatch(count: count),
        AdministrationRoute.gel => t.administrationRouteUnitPump(count: count),
        AdministrationRoute.implant =>
          t.administrationRouteUnitImplant(count: count),
        AdministrationRoute.suppository =>
          t.administrationRouteUnitSuppository(count: count),
        AdministrationRoute.transdermalSpray =>
          t.administrationRouteUnitSpray(count: count),
        AdministrationRoute.transdermalDrops =>
          t.administrationRouteUnitMl(count: count),
      };

  String get localizedConcentrationLabel =>
      this == AdministrationRoute.injection
          ? t.concentration
          : t.concentrationLabelPerUnit(unit: localizedUnit(1));
}
