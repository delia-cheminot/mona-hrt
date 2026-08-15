import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/services/home_widget_service.dart';

import '../fixtures.dart';
import '../mocks/mocks.mocks.dart';

void main() {
  group('HomeWidgetService.sync', () {
    late List<Map<String, String?>> saved;
    late List<String?> updated;
    late MockMedicationIntakeProvider intakeProvider;
    late MockLocaleProvider localeProvider;

    setUp(() {
      saved = [];
      updated = [];
      HomeWidgetService.isPlatformSupported = () => true;
      intakeProvider = MockMedicationIntakeProvider();
      localeProvider = MockLocaleProvider();
      when(intakeProvider.isLoading).thenReturn(false);
      when(intakeProvider.firstTakenLocalDate)
          .thenReturn(Date(year: 2026, month: 1, day: 5));
      when(intakeProvider.takenIntakes)
          .thenReturn(List.filled(3, aMedicationIntake()));
      when(localeProvider.locale).thenReturn(const Locale('fr'));
    });

    tearDown(() {
      HomeWidgetService.isPlatformSupported = null;
    });

    final keyCases = [
      (name: 'first date', id: 'hrt_first_date', data: '2026-01-05'),
      (name: 'locale', id: 'app_locale', data: 'fr'),
      (name: 'intake count', id: 'hrt_intake_count', data: '3'),
    ];
    for (final c in keyCases) {
      test('saves the ${c.name} under its shared key', () async {
        // Arrange
        final service = HomeWidgetService(
          saveWidgetData: (id, data) async =>
              saved.add({'id': id, 'data': data}),
          updateWidget: ({qualifiedAndroidName}) async =>
              updated.add(qualifiedAndroidName),
        );
        // Act
        await service.sync(intakeProvider, localeProvider);
        // Assert
        expect(saved, contains(equals({'id': c.id, 'data': c.data})));
      });
    }

    test('updates the Glance receiver', () async {
      // Arrange
      final service = HomeWidgetService(
        saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
        updateWidget: ({qualifiedAndroidName}) async =>
            updated.add(qualifiedAndroidName),
      );
      // Act
      await service.sync(intakeProvider, localeProvider);
      // Assert
      expect(updated, ['com.deliacheminot.mona.HrtGlanceReceiver']);
    });

    test('pushes a null first date to clear the widget', () async {
      // Arrange
      final service = HomeWidgetService(
        saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
        updateWidget: ({qualifiedAndroidName}) async =>
            updated.add(qualifiedAndroidName),
      );
      when(intakeProvider.firstTakenLocalDate).thenReturn(null);
      // Act
      await service.sync(intakeProvider, localeProvider);
      // Assert
      expect(saved, contains(equals({'id': 'hrt_first_date', 'data': null})));
    });

    test('does nothing when the platform is unsupported', () async {
      // Arrange
      final service = HomeWidgetService(
        saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
        updateWidget: ({qualifiedAndroidName}) async =>
            updated.add(qualifiedAndroidName),
      );
      HomeWidgetService.isPlatformSupported = () => false;
      // Act
      await service.sync(intakeProvider, localeProvider);
      // Assert
      expect(saved, isEmpty);
    });

    test('does nothing while the intake provider is loading', () async {
      // Arrange
      final service = HomeWidgetService(
        saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
        updateWidget: ({qualifiedAndroidName}) async =>
            updated.add(qualifiedAndroidName),
      );
      when(intakeProvider.isLoading).thenReturn(true);
      // Act
      await service.sync(intakeProvider, localeProvider);
      // Assert
      expect(saved, isEmpty);
    });
  });
}
