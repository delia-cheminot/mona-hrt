package com.deliacheminot.mona

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Renders a compact square dashboard -- HRT duration, next dose, and the
 * most urgent supply -- as a home screen widget.
 *
 * Data is written by Flutter's [StatusWidgetService] via the home_widget
 * plugin (see lib/services/status_widget_service.dart) and stored under the
 * keys below. This provider is purely a renderer: picking the next dose and
 * the worst-off supply, and all localization, happens on the Dart side.
 */
class StatusWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val KEY_DURATION = "status_widget_duration"
        private const val KEY_NEXT_DOSE = "status_widget_next_dose"
        private const val KEY_NEXT_DOSE_OVERDUE = "status_widget_next_dose_overdue"
        private const val KEY_SUPPLY = "status_widget_supply"
        private const val KEY_SUPPLY_LOW = "status_widget_supply_low"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.status_widget)

            val duration = widgetData.getString(KEY_DURATION, null)
            val nextDose = widgetData.getString(KEY_NEXT_DOSE, null)
            val nextDoseOverdue = widgetData.getBoolean(KEY_NEXT_DOSE_OVERDUE, false)
            val supply = widgetData.getString(KEY_SUPPLY, null)
            val supplyLow = widgetData.getBoolean(KEY_SUPPLY_LOW, false)

            views.setTextViewText(
                R.id.status_widget_duration_text,
                duration ?: context.getString(R.string.status_widget_default_duration)
            )
            views.setTextViewText(
                R.id.status_widget_next_dose_text,
                nextDose ?: context.getString(R.string.status_widget_default_next_dose)
            )
            views.setTextViewText(
                R.id.status_widget_supply_text,
                supply ?: context.getString(R.string.status_widget_default_supply)
            )

            WidgetColors.applyCard(
                context, widgetData, views,
                cardViewId = R.id.status_widget_card,
                titleViewId = R.id.status_widget_duration_text,
            )
            WidgetColors.applyText(context, widgetData, views, R.id.status_widget_next_dose_text)
            WidgetColors.applyText(context, widgetData, views, R.id.status_widget_supply_text)

            WidgetColors.applyIconTint(
                context, widgetData, views, R.id.status_widget_duration_icon,
            )
            WidgetColors.applyIconTint(
                context, widgetData, views, R.id.status_widget_next_dose_icon,
                warning = nextDoseOverdue,
            )
            WidgetColors.applyIconTint(
                context, widgetData, views, R.id.status_widget_supply_icon,
                warning = supplyLow,
            )

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
