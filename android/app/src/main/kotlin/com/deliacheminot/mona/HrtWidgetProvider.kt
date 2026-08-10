package com.deliacheminot.mona

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Renders the "On HRT for X" progress card as a home screen widget.
 *
 * Data is written by Flutter's [HrtWidgetService] via the home_widget plugin
 * (see lib/services/hrt_widget_service.dart) and stored under the keys
 * below. This provider is purely a renderer: all duration math and
 * localization happens on the Dart side so strings only ever need to be
 * updated in one place.
 */
class HrtWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val KEY_TITLE = "hrt_widget_title"
        private const val KEY_SUBTITLE = "hrt_widget_subtitle"
        private const val KEY_ENABLED = "hrt_widget_enabled"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.hrt_widget)

            val enabled = widgetData.getBoolean(KEY_ENABLED, true)
            val title = widgetData.getString(KEY_TITLE, null)
            val subtitle = widgetData.getString(KEY_SUBTITLE, null)

            views.setTextViewText(
                R.id.hrt_widget_title,
                if (enabled && title != null) title
                else context.getString(R.string.hrt_widget_default_title)
            )
            views.setTextViewText(
                R.id.hrt_widget_subtitle,
                if (enabled && subtitle != null) subtitle
                else context.getString(R.string.hrt_widget_default_subtitle)
            )

            WidgetColors.applyCard(
                context, widgetData, views,
                cardViewId = R.id.hrt_widget_card,
                titleViewId = R.id.hrt_widget_title,
                subtitleViewId = R.id.hrt_widget_subtitle,
            )
            WidgetColors.applyIcon(
                context, widgetData, views,
                circleViewId = R.id.hrt_widget_icon_circle,
                glyphViewId = R.id.hrt_widget_icon,
            )

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
