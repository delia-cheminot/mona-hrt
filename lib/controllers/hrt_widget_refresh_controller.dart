import 'dart:async';
import 'dart:io';

import 'package:mona/data/model/date.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/services/home_widget_service.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/util/hrt_duration.dart';
import 'package:workmanager/workmanager.dart';

const String hrtWidgetRefreshTaskName = 'hrt_widget_refresh';

typedef LoadPreferences = Future<PreferencesService> Function();
typedef LoadFirstTakenDate = Future<Date?> Function();

class HrtWidgetRefreshController {
  final LoadPreferences _loadPreferences;
  final LoadFirstTakenDate _loadFirstTakenDate;
  final HomeWidgetService _homeWidgetService;

  HrtWidgetRefreshController({
    LoadPreferences? loadPreferences,
    LoadFirstTakenDate? loadFirstTakenDate,
    HomeWidgetService? homeWidgetService,
  })  : _loadPreferences = loadPreferences ?? PreferencesService.init,
        _loadFirstTakenDate = loadFirstTakenDate ?? _loadFirstTakenDateFromDb,
        _homeWidgetService = homeWidgetService ?? HomeWidgetService();

  Future<void> refresh() async {
    final prefs = await _loadPreferences();
    final firstDate = await _loadFirstTakenDate();
    final text = hrtWidgetDurationText(
      firstTakenLocalDate: firstDate,
      intakeCounterEnabled: prefs.intakeCounterEnabled,
    );
    await _homeWidgetService.updateHrtDurationWidget(text);
  }
}

Future<Date?> _loadFirstTakenDateFromDb() async {
  final provider = MedicationIntakeProvider();
  if (provider.isLoading) {
    final loaded = Completer<void>();
    void onChange() {
      if (!provider.isLoading) {
        provider.removeListener(onChange);
        loaded.complete();
      }
    }

    provider.addListener(onChange);
    await loaded.future;
  }
  return provider.firstTakenLocalDate;
}

@pragma('vm:entry-point')
void hrtWidgetRefreshDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    await HrtWidgetRefreshController().refresh();
    return true;
  });
}

Future<void> scheduleHrtWidgetRefresh() async {
  if (!Platform.isAndroid) return;

  await Workmanager().initialize(hrtWidgetRefreshDispatcher);
  await Workmanager().registerPeriodicTask(
    hrtWidgetRefreshTaskName,
    hrtWidgetRefreshTaskName,
    frequency: const Duration(hours: 12),
  );
}
