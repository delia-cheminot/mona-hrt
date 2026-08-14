import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:home_widget/home_widget.dart';
import 'package:mona/data/model/date.dart';

typedef SaveWidgetData = Future<void> Function(String id, String? data);
typedef UpdateWidget = Future<void> Function({String? qualifiedAndroidName});

({String? firstDateIso, String localeTag}) widgetPayload(
  Date? firstDate,
  Locale locale,
) {
  final iso = firstDate == null
      ? null
      : '${firstDate.year.toString().padLeft(4, '0')}-'
          '${firstDate.month.toString().padLeft(2, '0')}-'
          '${firstDate.day.toString().padLeft(2, '0')}';
  return (firstDateIso: iso, localeTag: locale.languageCode);
}

class HomeWidgetService {
  static const String firstDateKey = 'hrt_first_date';
  static const String localeKey = 'app_locale';

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

  Future<void> sync({
    required Date? firstDate,
    required Locale locale,
  }) async {
    final supported = isPlatformSupported?.call() ?? Platform.isAndroid;
    if (!supported) return;

    final payload = widgetPayload(firstDate, locale);
    await _saveWidgetData(firstDateKey, payload.firstDateIso);
    await _saveWidgetData(localeKey, payload.localeTag);
    await _updateWidget(qualifiedAndroidName: _qualifiedAndroidName);
  }
}
