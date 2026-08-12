import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

typedef SaveWidgetData = Future<void> Function(String id, String? data);
typedef SaveIntWidgetData = Future<void> Function(String id, int? data);
typedef UpdateWidget = Future<void> Function({String? qualifiedAndroidName});

class HomeWidgetService {
  static const String hrtDurationDataKey = 'hrt_duration_text';

  static const String hrtBackgroundLightColorKey =
      'hrt_widget_background_light';
  static const String hrtBackgroundDarkColorKey = 'hrt_widget_background_dark';
  static const String hrtIconBackgroundLightColorKey =
      'hrt_widget_icon_background_light';
  static const String hrtIconBackgroundDarkColorKey =
      'hrt_widget_icon_background_dark';
  static const String hrtIconLightColorKey = 'hrt_widget_icon_light';
  static const String hrtIconDarkColorKey = 'hrt_widget_icon_dark';
  static const String hrtTextLightColorKey = 'hrt_widget_text_light';
  static const String hrtTextDarkColorKey = 'hrt_widget_text_dark';

  static const String _qualifiedAndroidName =
      'com.deliacheminot.mona.HrtHomeWidgetProvider';

  static bool Function()? isPlatformSupported = () => Platform.isAndroid;

  final SaveWidgetData _saveWidgetData;
  final SaveIntWidgetData _saveIntWidgetData;
  final UpdateWidget _updateWidget;

  HomeWidgetService({
    SaveWidgetData? saveWidgetData,
    SaveIntWidgetData? saveIntWidgetData,
    UpdateWidget? updateWidget,
  })  : _saveWidgetData = saveWidgetData ??
            ((id, data) => HomeWidget.saveWidgetData<String>(id, data)),
        _saveIntWidgetData = saveIntWidgetData ??
            ((id, data) => HomeWidget.saveWidgetData<int>(id, data)),
        _updateWidget = updateWidget ??
            (({qualifiedAndroidName}) => HomeWidget.updateWidget(
                qualifiedAndroidName: qualifiedAndroidName));

  Future<void> updateHrtDurationWidget(String? text) async {
    final supported = isPlatformSupported?.call() ?? Platform.isAndroid;
    if (!supported) return;

    await _saveWidgetData(hrtDurationDataKey, text);
    await _updateWidget(qualifiedAndroidName: _qualifiedAndroidName);
  }

  Future<void> updateHrtWidgetColors({
    required ColorScheme light,
    required ColorScheme dark,
  }) async {
    final supported = isPlatformSupported?.call() ?? Platform.isAndroid;
    if (!supported) return;

    Future<void> push(
      String key,
      Color Function(ColorScheme) role,
      ColorScheme scheme,
    ) =>
        _saveIntWidgetData(key, role(scheme).toARGB32());

    await push(
        hrtBackgroundLightColorKey, (s) => s.surfaceContainerHighest, light);
    await push(
        hrtBackgroundDarkColorKey, (s) => s.surfaceContainerHighest, dark);
    await push(
        hrtIconBackgroundLightColorKey, (s) => s.tertiaryContainer, light);
    await push(hrtIconBackgroundDarkColorKey, (s) => s.tertiaryContainer, dark);
    await push(hrtIconLightColorKey, (s) => s.onTertiaryContainer, light);
    await push(hrtIconDarkColorKey, (s) => s.onTertiaryContainer, dark);
    await push(hrtTextLightColorKey, (s) => s.onSurface, light);
    await push(hrtTextDarkColorKey, (s) => s.onSurface, dark);

    await _updateWidget(qualifiedAndroidName: _qualifiedAndroidName);
  }
}
