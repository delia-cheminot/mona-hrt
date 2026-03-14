import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('PreferencesService', () {
    group('notificationsEnabled', () {
      test('should return default notifications enabled state when not set',
          () async {
        // Arrange
        final service = await PreferencesService.init();

        // Act
        final enabled = service.notificationsEnabled;

        // Assert
        expect(enabled, PreferencesService.defaultNotificationsEnabled);
      });

      test('should return saved notifications enabled state', () async {
        // Arrange
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('notifications_enabled', false);
        final service = await PreferencesService.init();

        // Act
        final enabled = service.notificationsEnabled;

        // Assert
        expect(enabled, isFalse);
      });
    });

    group('setNotificationsEnabled', () {
      test('should set notifications enabled and notify listeners', () async {
        // Arrange
        final service = await PreferencesService.init();
        var listenerNotified = false;
        service.addListener(() {
          listenerNotified = true;
        });

        // Act
        await service.setNotificationsEnabled(false);

        // Assert
        expect(service.notificationsEnabled, isFalse);
        expect(listenerNotified, isTrue);
      });
    });

    group('molecules', () {
      test('should return empty list when nothing saved', () async {
        // Arrange
        final service = await PreferencesService.init();

        // Act
        final molecules = service.customMolecules;

        // Assert
        expect(molecules, isEmpty);
      });

      test('should return saved custom molecules', () async {
        // Arrange
        final prefs = await SharedPreferences.getInstance();

        final jsonString = jsonEncode([
          {
            'name': 'nulcac2',
            'unit': 'mg',
          }
        ]);
        await prefs.setString('custom_molecules', jsonString);

        final service = await PreferencesService.init();

        // Act
        final molecules = service.customMolecules;

        // Assert
        expect(molecules, contains(Molecule(name: 'nulcac2', unit: 'mg')));
      });

      test('should add new custom molecule', () async {
        // Arrange
        final service = await PreferencesService.init();

        // Act
        await service.addCustomMolecule(Molecule(name: 'nulcac2', unit: 'mg'));

        expect(service.customMolecules,
            contains(Molecule(name: 'nulcac2', unit: 'mg')));
      });

      test('should not add duplicate molecule', () async {
        // Arrange
        final service = await PreferencesService.init();
        await service.addCustomMolecule(Molecule(name: 'nulcac2', unit: 'mg'));

        // Act
        await service.addCustomMolecule(Molecule(name: 'Nulcac2', unit: 'mg'));

        // Assert
        expect(
            service.customMolecules
                .map((m) => m.name)
                .toList()
                .where((n) => n == 'nulcac2')
                .length,
            1);
      });

      test('should remove molecule by normalized name', () async {
        // Arrange
        final service = await PreferencesService.init();
        final molecule = Molecule(name: 'DeleteMe', unit: 'mg');
        await service.addCustomMolecule(molecule);

        // Act
        await service.removeCustomMolecule('deleteme');

        // Assert
        expect(service.customMolecules, isEmpty);
      });

      test('should merge built-in and custom without duplicates', () async {
        // Arrange
        final service = await PreferencesService.init();

        final custom = Molecule(name: 'bicanul', unit: 'mg');
        final customDuplicate = Molecule(name: 'Estradiol', unit: 'mg');
        // built-in is named 'estradiol'

        await service.addCustomMolecule(custom);
        await service.addCustomMolecule(customDuplicate);

        // Act
        final all = service.allMolecules;

        // Assert
        expect(
            all,
            unorderedEquals([
              ...KnownMolecules.all,
              custom,
            ]));
      });
    });
  });
}
