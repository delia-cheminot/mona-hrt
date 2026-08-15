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
    late HomeWidgetService service;

    setUp(() {
      saved = [];
      updated = [];
      HomeWidgetService.isPlatformSupported = () => true;
      service = HomeWidgetService(
        saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
        updateWidget: ({qualifiedAndroidName}) async =>
            updated.add(qualifiedAndroidName),
      );
    });

    tearDown(() {
      HomeWidgetService.isPlatformSupported = null;
    });

    test('saves the first date under the shared key', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.syncHrtTimeWidget(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 0);
      // Assert
      expect(saved,
          contains(equals({'id': 'hrt_first_date', 'data': '2026-01-05'})));
    });

    test('saves the locale under the shared key', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.syncHrtTimeWidget(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 0);
      // Assert
      expect(saved, contains(equals({'id': 'app_locale', 'data': 'fr'})));
    });

    test('saves the intake count under the shared key', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.syncHrtTimeWidget(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 42);
      // Assert
      expect(saved, contains(equals({'id': 'hrt_intake_count', 'data': '42'})));
    });

    test('updates the Glance receiver', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.syncHrtTimeWidget(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 0);
      // Assert
      expect(updated, ['com.deliacheminot.mona.HrtGlanceReceiver']);
    });

    test('pushes a null first date to clear the widget', () async {
      // Act
      await service.syncHrtTimeWidget(
          firstDate: null, locale: const Locale('en'), intakeCount: 0);
      // Assert
      expect(saved, contains(equals({'id': 'hrt_first_date', 'data': null})));
    });

    test('does nothing when the platform is unsupported', () async {
      // Arrange
      HomeWidgetService.isPlatformSupported = () => false;
      // Act
      await service.syncHrtTimeWidget(
          firstDate: null, locale: const Locale('en'), intakeCount: 0);
      // Assert
      expect(saved, isEmpty);
    });
  });

  group('HomeWidgetService.syncFromProviders', () {
    late List<Map<String, String?>> saved;
    late HomeWidgetService service;
    late MockMedicationIntakeProvider intake;
    late MockLocaleProvider localeProvider;

    setUp(() {
      saved = [];
      HomeWidgetService.isPlatformSupported = () => true;
      service = HomeWidgetService(
        saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
        updateWidget: ({qualifiedAndroidName}) async {},
      );
      intake = MockMedicationIntakeProvider();
      localeProvider = MockLocaleProvider();
      when(intake.isLoading).thenReturn(false);
      when(intake.firstTakenLocalDate)
          .thenReturn(Date(year: 2026, month: 1, day: 5));
      when(intake.takenIntakes).thenReturn(const []);
      when(localeProvider.locale).thenReturn(const Locale('fr'));
    });

    tearDown(() {
      HomeWidgetService.isPlatformSupported = null;
    });

    test('reads the first date getter into the saved data', () async {
      // Act
      await service.sync(intake, localeProvider);
      // Assert
      expect(saved,
          contains(equals({'id': 'hrt_first_date', 'data': '2026-01-05'})));
    });

    test('reads the locale getter into the saved data', () async {
      // Act
      await service.sync(intake, localeProvider);
      // Assert
      expect(saved, contains(equals({'id': 'app_locale', 'data': 'fr'})));
    });

    test('reads the taken intake count into the saved data', () async {
      // Arrange
      when(intake.takenIntakes).thenReturn(List.filled(3, aMedicationIntake()));
      // Act
      await service.sync(intake, localeProvider);
      // Assert
      expect(saved, contains(equals({'id': 'hrt_intake_count', 'data': '3'})));
    });

    test('does nothing while the intake provider is loading', () async {
      // Arrange
      when(intake.isLoading).thenReturn(true);
      // Act
      await service.sync(intake, localeProvider);
      // Assert
      expect(saved, isEmpty);
    });
  });
}
