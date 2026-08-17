import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:home_widget/home_widget.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/locale_provider.dart';

typedef SaveWidgetData = Future<void> Function(String id, String? data);
typedef UpdateWidget = Future<void> Function({String? qualifiedAndroidName});

class HomeWidgetService {
  static const String _qualifiedAndroidName =
      'com.deliacheminot.mona.HrtGlanceReceiver';

  static bool Function()? isPlatformSupported = () => Platform.isAndroid;

  final SaveWidgetData _saveWidgetData;
  final UpdateWidget _updateWidget;

  HomeWidgetService({
    SaveWidgetData? saveWidgetData,
    UpdateWidget? updateWidget,
  })  : _saveWidgetData = saveWidgetData ??
            ((id, data) => HomeWidget.saveWidgetData<String>(id, data)),
        _updateWidget = updateWidget ??
            (({qualifiedAndroidName}) => HomeWidget.updateWidget(
                qualifiedAndroidName: qualifiedAndroidName));

  Future<void> sync(
    MedicationIntakeProvider medicationIntakeProvider,
    LocaleProvider localeProvider,
  ) async {
    if (medicationIntakeProvider.isLoading) return;
    await syncHrtTimeWidget(
      firstDate: medicationIntakeProvider.firstTakenLocalDate,
      locale: localeProvider.locale,
      intakeCount: medicationIntakeProvider.takenIntakes.length,
    );
  }

  Future<void> syncHrtTimeWidget({
    required Date? firstDate,
    required Locale locale,
    required int intakeCount,
  }) async {
    final supported = isPlatformSupported?.call() ?? Platform.isAndroid;
    if (!supported) return;

    final firstDateIso = firstDate == null
        ? null
        : '${firstDate.year.toString().padLeft(4, '0')}-'
            '${firstDate.month.toString().padLeft(2, '0')}-'
            '${firstDate.day.toString().padLeft(2, '0')}';
    await _saveWidgetData('hrt_first_date', firstDateIso);
    await _saveWidgetData('app_locale', locale.languageCode);
    await _saveWidgetData('hrt_intake_count', intakeCount.toString());
    await _updateWidget(qualifiedAndroidName: _qualifiedAndroidName);
  }
}
