import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:mona/services/widget_provider_names.dart';

/// Keeps the Android home screen widgets' colors in sync with the app's
/// *actual* current [ColorScheme] -- Material You dynamic color, a custom
/// theme, or the default palette, whichever is active -- instead of a fixed
/// color baked into the widgets.
///
/// Pushes both the light and dark variant of each role home_widget stores;
/// the native side (see WidgetColors.kt) picks whichever matches the
/// device's current night mode when it renders. Called from [MonaApp]'s
/// build method, right where the app resolves its own theme, so this is
/// always in step with what's on screen.
class WidgetThemeService {
  Future<void> sync({
    required ColorScheme light,
    required ColorScheme dark,
  }) async {
    await _pushScheme('light', light);
    await _pushScheme('dark', dark);
    for (final name in WidgetProviderNames.all) {
      await HomeWidget.updateWidget(qualifiedAndroidName: name);
    }
  }

  Future<void> _pushScheme(String suffix, ColorScheme scheme) async {
    await _save('widget_card_background_$suffix', scheme.surfaceContainer);
    await _save('widget_icon_background_$suffix', scheme.tertiaryContainer);
    await _save('widget_icon_foreground_$suffix', scheme.onTertiaryContainer);
    await _save('widget_title_text_$suffix', scheme.onSurface);
    await _save('widget_subtitle_text_$suffix', scheme.onSurfaceVariant);
    await _save(
        'widget_overdue_icon_background_$suffix', scheme.errorContainer);
    await _save(
        'widget_overdue_icon_foreground_$suffix', scheme.onErrorContainer);
  }

  Future<void> _save(String key, Color color) =>
      HomeWidget.saveWidgetData<int>(key, color.toARGB32());
}
