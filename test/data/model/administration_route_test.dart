import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/administration_route.dart';

void main() {
  group('AdministrationRoute', () {
    group('values.byName', () {
      test('resolves a stored name back to its route', () {
        // Act
        final route = AdministrationRoute.values.byName('patch');

        // Assert
        expect(route, AdministrationRoute.patch);
      });
    });

    group('name', () {
      test('serializes transdermal routes without a space', () {
        // Act
        final names = [
          AdministrationRoute.transdermalSpray.name,
          AdministrationRoute.transdermalDrops.name,
        ];

        // Assert
        expect(names, ['transdermalSpray', 'transdermalDrops']);
      });
    });
  });
}
