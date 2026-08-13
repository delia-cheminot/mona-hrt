import 'package:flutter_test/flutter_test.dart';
import 'package:mona/controllers/hrt_widget_refresh_controller.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/home_widget_service.dart';

import '../util/test_clock.dart';

void main() {
  late List<String?> saved;
  late List<String?> updated;
  late HomeWidgetService homeWidgetService;

  setUp(() {
    saved = [];
    updated = [];
    HomeWidgetService.isPlatformSupported = () => true;
    homeWidgetService = HomeWidgetService(
      saveWidgetData: (id, data) async => saved.add(data),
      updateWidget: ({qualifiedAndroidName}) async =>
          updated.add(qualifiedAndroidName),
    );
  });

  tearDown(() {
    HomeWidgetService.isPlatformSupported = null;
  });

  test('pushes the formatted duration since the first taken date', () async {
    final controller = HrtWidgetRefreshController(
      loadFirstTakenDate: () async => Date(year: 2026, month: 6, day: 1),
      homeWidgetService: homeWidgetService,
    );

    await withFixedClockAsync(
      () => controller.refresh(),
      at: DateTime(2026, 6, 3, 12, 0),
    );

    expect(saved, [t.onHrtForDays(count: 2)]);
    expect(updated, ['com.deliacheminot.mona.HrtHomeWidgetProvider']);
  });

  test('pushes null when there is no first taken date', () async {
    final controller = HrtWidgetRefreshController(
      loadFirstTakenDate: () async => null,
      homeWidgetService: homeWidgetService,
    );

    await controller.refresh();

    expect(saved, [null]);
  });
}
