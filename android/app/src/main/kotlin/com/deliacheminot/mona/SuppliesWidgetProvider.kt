package com.deliacheminot.mona

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Renders the supply items running lowest as a home screen widget.
 *
 * Data is written by Flutter's [SuppliesWidgetService] via the home_widget
 * plugin (see lib/services/supplies_widget_service.dart) and stored under
 * the keys below. This provider is purely a renderer, same split as
 * [RecentIntakesWidgetProvider].
 *
 * The widget shows a fixed number of rows (no native scrolling/ListView),
 * so it only ever displays up to [ROW_COUNT] supplies, hiding unused rows.
 * Rows for a critically low item get a warning-colored icon.
 */
class SuppliesWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val KEY_COUNT = "supplies_widget_count"
        private const val ROW_COUNT = 4

        private val ROW_IDS = intArrayOf(
            R.id.supplies_widget_row_0,
            R.id.supplies_widget_row_1,
            R.id.supplies_widget_row_2,
            R.id.supplies_widget_row_3,
        )
        private val NAME_IDS = intArrayOf(
            R.id.supplies_widget_name_0,
            R.id.supplies_widget_name_1,
            R.id.supplies_widget_name_2,
            R.id.supplies_widget_name_3,
        )
        private val SUMMARY_IDS = intArrayOf(
            R.id.supplies_widget_summary_0,
            R.id.supplies_widget_summary_1,
            R.id.supplies_widget_summary_2,
            R.id.supplies_widget_summary_3,
        )
        private val ICON_IDS = intArrayOf(
            R.id.supplies_widget_icon_0,
            R.id.supplies_widget_icon_1,
            R.id.supplies_widget_icon_2,
            R.id.supplies_widget_icon_3,
        )

        private fun nameKey(index: Int) = "supplies_widget_name_$index"
        private fun summaryKey(index: Int) = "supplies_widget_summary_$index"
        private fun lowKey(index: Int) = "supplies_widget_low_$index"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.supplies_widget)

            val count = widgetData.getInt(KEY_COUNT, 0).coerceIn(0, ROW_COUNT)

            views.setViewVisibility(
                R.id.supplies_widget_empty,
                if (count == 0) View.VISIBLE else View.GONE
            )
            views.setViewVisibility(
                R.id.supplies_widget_rows,
                if (count == 0) View.GONE else View.VISIBLE
            )

            WidgetColors.applyCard(
                context, widgetData, views,
                cardViewId = R.id.supplies_widget_card,
                titleViewId = R.id.supplies_widget_header,
            )
            WidgetColors.applyText(
                context, widgetData, views,
                viewId = R.id.supplies_widget_empty,
                subtle = true,
            )

            for (i in 0 until ROW_COUNT) {
                if (i >= count) {
                    views.setViewVisibility(ROW_IDS[i], View.GONE)
                    continue
                }
                val low = widgetData.getBoolean(lowKey(i), false)

                views.setViewVisibility(ROW_IDS[i], View.VISIBLE)
                views.setTextViewText(NAME_IDS[i], widgetData.getString(nameKey(i), null))
                views.setTextViewText(SUMMARY_IDS[i], widgetData.getString(summaryKey(i), null))
                WidgetColors.applyText(context, widgetData, views, NAME_IDS[i])
                WidgetColors.applyText(context, widgetData, views, SUMMARY_IDS[i], subtle = true)
                WidgetColors.applyIconTint(context, widgetData, views, ICON_IDS[i], warning = low)
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
