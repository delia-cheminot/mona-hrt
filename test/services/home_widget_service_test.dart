import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/services/home_widget_service.dart';

void main() {
  late List<Map<String, String?>> saved;
  late List<Map<String, dynamic>> savedInts;
  late List<String?> updated;
  late HomeWidgetService service;

  setUp(() {
    saved = [];
    savedInts = [];
    updated = [];
    HomeWidgetService.isPlatformSupported = () => true;
    service = HomeWidgetService(
      saveWidgetData: (id, data) async => saved.add({'id': id, 'data': data}),
      saveIntWidgetData: (id, data) async =>
          savedInts.add({'id': id, 'data': data}),
      updateWidget: ({qualifiedAndroidName}) async =>
          updated.add(qualifiedAndroidName),
    );
  });

  tearDown(() {
    HomeWidgetService.isPlatformSupported = null;
  });

  group('HomeWidgetService', () {
    test('saves the text under the shared data key and updates the widget',
        () async {
      await service.updateHrtDurationWidget('On HRT for 3 weeks');

      expect(saved, [
        {
          'id': HomeWidgetService.hrtDurationDataKey,
          'data': 'On HRT for 3 weeks',
        },
      ]);
      expect(updated, ['com.deliacheminot.mona.HrtHomeWidgetProvider']);
    });

    test('still pushes a null value to clear the widget', () async {
      await service.updateHrtDurationWidget(null);

      expect(saved, [
        {'id': HomeWidgetService.hrtDurationDataKey, 'data': null},
      ]);
      expect(updated, ['com.deliacheminot.mona.HrtHomeWidgetProvider']);
    });

    test('does nothing when the platform is unsupported', () async {
      HomeWidgetService.isPlatformSupported = () => false;

      await service.updateHrtDurationWidget('On HRT for 3 weeks');

      expect(saved, isEmpty);
      expect(updated, isEmpty);
    });
  });

  group('updateHrtWidgetColors', () {
    final light = ColorScheme.fromSeed(seedColor: Colors.teal);
    final dark = ColorScheme.fromSeed(
        seedColor: Colors.teal, brightness: Brightness.dark);

    test('pushes each role\'s light and dark color', () async {
      await service.updateHrtWidgetColors(light: light, dark: dark);

      expect(savedInts, [
        {
          'id': HomeWidgetService.hrtBackgroundLightColorKey,
          'data': light.surfaceContainerHighest.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtBackgroundDarkColorKey,
          'data': dark.surfaceContainerHighest.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtIconBackgroundLightColorKey,
          'data': light.tertiaryContainer.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtIconBackgroundDarkColorKey,
          'data': dark.tertiaryContainer.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtIconLightColorKey,
          'data': light.onTertiaryContainer.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtIconDarkColorKey,
          'data': dark.onTertiaryContainer.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtTextLightColorKey,
          'data': light.onSurface.toARGB32(),
        },
        {
          'id': HomeWidgetService.hrtTextDarkColorKey,
          'data': dark.onSurface.toARGB32(),
        },
      ]);
      expect(updated, ['com.deliacheminot.mona.HrtHomeWidgetProvider']);
    });

    test('does nothing when the platform is unsupported', () async {
      HomeWidgetService.isPlatformSupported = () => false;

      await service.updateHrtWidgetColors(light: light, dark: dark);

      expect(savedInts, isEmpty);
      expect(updated, isEmpty);
    });
  });
}
