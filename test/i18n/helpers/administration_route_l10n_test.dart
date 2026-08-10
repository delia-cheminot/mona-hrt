import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';

void main() {
  group('AdministrationRouteL10n', () {
    group('localizedConcentrationLabel', () {
      for (final route in [
        AdministrationRoute.patch,
        AdministrationRoute.gel,
        AdministrationRoute.implant,
        AdministrationRoute.suppository,
        AdministrationRoute.transdermalSpray,
      ]) {
        test('is a route-specific "dose per unit" label for ${route.name}', () {
          // Act
          final label = route.localizedConcentrationLabel;

          // Assert
          expect(label, 'Dose per ${route.localizedUnit(1)}');
        });
      }

      for (final route in [
        AdministrationRoute.injection,
        AdministrationRoute.transdermalDrops,
        AdministrationRoute.oral,
        AdministrationRoute.sublingual,
      ]) {
        test('is the generic "Concentration" label for ${route.name}', () {
          // Act
          final label = route.localizedConcentrationLabel;

          // Assert
          expect(label, 'Concentration');
        });
      }
    });
  });
}
