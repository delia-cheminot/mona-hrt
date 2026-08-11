import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';

void main() {
  group('AdministrationRouteL10n', () {
    group('localizedConcentrationLabel', () {
      test('is the generic "Concentration" label for injection', () {
        // Act
        final label = AdministrationRoute.injection.localizedConcentrationLabel;

        // Assert
        expect(label, 'Concentration');
      });

      for (final route in [
        AdministrationRoute.transdermalDrops,
        AdministrationRoute.oral,
        AdministrationRoute.sublingual,
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
    });
  });
}
