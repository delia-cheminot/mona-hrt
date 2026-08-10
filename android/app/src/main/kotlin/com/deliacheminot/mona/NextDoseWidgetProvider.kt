package com.deliacheminot.mona

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Renders the "next dose due" card as a home screen widget.
 *
 * Data is written by Flutter's [NextDoseWidgetService] via the home_widget
 * plugin (see lib/services/next_dose_widget_service.dart) and stored under
 * the keys below. This provider is purely a renderer: picking the most
 * urgent schedule and all its localization happens on the Dart side.
 */
class NextDoseWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val KEY_TITLE = "next_dose_widget_title"
        private const val KEY_SUBTITLE = "next_dose_widget_subtitle"
        private const val KEY_OVERDUE = "next_dose_widget_overdue"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.next_dose_widget)

            val title = widgetData.getString(KEY_TITLE, null)
            val subtitle = widgetData.getString(KEY_SUBTITLE, null)
            val overdue = widgetData.getBoolean(KEY_OVERDUE, false)

            views.setTextViewText(
                R.id.next_dose_widget_title,
                title ?: context.getString(R.string.next_dose_widget_default_title)
            )
            views.setTextViewText(
                R.id.next_dose_widget_subtitle,
                subtitle ?: context.getString(R.string.next_dose_widget_default_subtitle)
            )

            // Base drawable resource swap: the only way to distinguish overdue
            // pre-API 31, where WidgetColors can't retint a shape at runtime.
            val circleDrawable =
                if (overdue) R.drawable.widget_icon_circle_overdue
                else R.drawable.hrt_widget_icon_circle
            views.setInt(R.id.next_dose_widget_icon_circle, "setBackgroundResource", circleDrawable)

            WidgetColors.applyCard(
                context, widgetData, views,
                cardViewId = R.id.next_dose_widget_card,
                titleViewId = R.id.next_dose_widget_title,
                subtitleViewId = R.id.next_dose_widget_subtitle,
            )
            WidgetColors.applyIcon(
                context, widgetData, views,
                circleViewId = R.id.next_dose_widget_icon_circle,
                glyphViewId = R.id.next_dose_widget_icon,
                overdue = overdue,
            )

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
