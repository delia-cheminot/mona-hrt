import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/services/home_widget_service.dart';

void main() {
  group('widgetPayload', () {
    test('maps a date to ISO yyyy-MM-dd', () {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      const locale = Locale('fr');
      // Act
      final payload = widgetPayload(firstDate, locale, 0);
      // Assert
      expect(payload.firstDateIso, '2026-01-05');
    });

    test('maps the locale to its language code', () {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      const locale = Locale('fr');
      // Act
      final payload = widgetPayload(firstDate, locale, 0);
      // Assert
      expect(payload.localeTag, 'fr');
    });

    test('null date maps to null firstDateIso', () {
      // Arrange
      const locale = Locale('en');
      // Act
      final payload = widgetPayload(null, locale, 0);
      // Assert
      expect(payload.firstDateIso, isNull);
    });

    test('carries the intake count through', () {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      const locale = Locale('en');
      // Act
      final payload = widgetPayload(firstDate, locale, 42);
      // Assert
      expect(payload.intakeCount, 42);
    });
  });

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
      await service.sync(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 0);
      // Assert
      expect(saved,
          contains(equals({'id': 'hrt_first_date', 'data': '2026-01-05'})));
    });

    test('saves the locale under the shared key', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.sync(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 0);
      // Assert
      expect(saved, contains(equals({'id': 'app_locale', 'data': 'fr'})));
    });

    test('saves the intake count under the shared key', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.sync(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 42);
      // Assert
      expect(saved, contains(equals({'id': 'hrt_intake_count', 'data': '42'})));
    });

    test('updates the Glance receiver', () async {
      // Arrange
      final firstDate = Date(year: 2026, month: 1, day: 5);
      // Act
      await service.sync(
          firstDate: firstDate, locale: const Locale('fr'), intakeCount: 0);
      // Assert
      expect(updated, ['com.deliacheminot.mona.HrtGlanceReceiver']);
    });

    test('pushes a null first date to clear the widget', () async {
      // Act
      await service.sync(
          firstDate: null, locale: const Locale('en'), intakeCount: 0);
      // Assert
      expect(saved, contains(equals({'id': 'hrt_first_date', 'data': null})));
    });

    test('does nothing when the platform is unsupported', () async {
      // Arrange
      HomeWidgetService.isPlatformSupported = () => false;
      // Act
      await service.sync(
          firstDate: null, locale: const Locale('en'), intakeCount: 0);
      // Assert
      expect(saved, isEmpty);
    });
  });
}
