import 'package:flutter_test/flutter_test.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/data/model/administration_route.dart';

void main() {
  group('AdministrationRoute', () {
    group('fromName', () {
      test('returns correct route', () {
        // Act
        final route = AdministrationRoute.fromName('patch');

        // Assert
        expect(route, AdministrationRoute.patch);
      });
    });

    group('equality', () {
      test('two routes with same name are equal', () {
        // Arrange
        const r1 = AdministrationRoute.injection;
        const r2 = AdministrationRoute(
          name: 'injection',
          unit: 'ml',
          icon: Symbols.syringe,
        );

        // Act
        final equals = r1 == r2;

        // Assert
        expect(equals, true);
      });

      test('two routes with different names are not equal', () {
        // Arrange
        const r1 = AdministrationRoute.injection;
        const r2 = AdministrationRoute.patch;

        // Act
        final equals = r1 == r2;

        // Assert
        expect(equals, false);
      });
    });

    group('hashCode', () {
      test('hashCode is equal for identical routes', () {
        // Arrange
        const r1 = AdministrationRoute.injection;
        const r2 = AdministrationRoute(
          name: 'injection',
          unit: 'ml',
          icon: Symbols.syringe,
        );

        // Act
        final hash1 = r1.hashCode;
        final hash2 = r2.hashCode;

        // Assert
        expect(hash1, hash2);
      });

      test('hashCode is different for different routes', () {
        // Arrange
        const r1 = AdministrationRoute.injection;
        const r2 = AdministrationRoute.patch;

        // Act
        final hashEquals = r1.hashCode == r2.hashCode;

        // Assert
        expect(hashEquals, false);
      });
    });
  });
}
