package com.deliacheminot.mona

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.view.View
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

/**
 * Renders the most recently logged intakes as a home screen widget.
 *
 * Data is written by Flutter's [RecentIntakesWidgetService] via the
 * home_widget plugin (see lib/services/recent_intakes_widget_service.dart)
 * and stored under the keys below. This provider is purely a renderer: date
 * formatting and the "dose • molecule • route" summary are pre-rendered on
 * the Dart side, same split as [HrtWidgetProvider] and [NextDoseWidgetProvider].
 *
 * The widget shows a fixed number of rows (no native scrolling/ListView),
 * so it only ever displays up to [ROW_COUNT] intakes, hiding unused rows.
 */
class RecentIntakesWidgetProvider : HomeWidgetProvider() {

    companion object {
        private const val KEY_COUNT = "recent_intakes_widget_count"
        private const val ROW_COUNT = 4

        private val ROW_IDS = intArrayOf(
            R.id.recent_intakes_widget_row_0,
            R.id.recent_intakes_widget_row_1,
            R.id.recent_intakes_widget_row_2,
            R.id.recent_intakes_widget_row_3,
        )
        private val DATE_IDS = intArrayOf(
            R.id.recent_intakes_widget_date_0,
            R.id.recent_intakes_widget_date_1,
            R.id.recent_intakes_widget_date_2,
            R.id.recent_intakes_widget_date_3,
        )
        private val SUMMARY_IDS = intArrayOf(
            R.id.recent_intakes_widget_summary_0,
            R.id.recent_intakes_widget_summary_1,
            R.id.recent_intakes_widget_summary_2,
            R.id.recent_intakes_widget_summary_3,
        )
        private val ICON_IDS = intArrayOf(
            R.id.recent_intakes_widget_icon_0,
            R.id.recent_intakes_widget_icon_1,
            R.id.recent_intakes_widget_icon_2,
            R.id.recent_intakes_widget_icon_3,
        )

        private fun dateKey(index: Int) = "recent_intakes_widget_date_$index"
        private fun summaryKey(index: Int) = "recent_intakes_widget_summary_$index"
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.recent_intakes_widget)

            val count = widgetData.getInt(KEY_COUNT, 0).coerceIn(0, ROW_COUNT)

            views.setViewVisibility(
                R.id.recent_intakes_widget_empty,
                if (count == 0) View.VISIBLE else View.GONE
            )
            views.setViewVisibility(
                R.id.recent_intakes_widget_rows,
                if (count == 0) View.GONE else View.VISIBLE
            )

            WidgetColors.applyCard(
                context, widgetData, views,
                cardViewId = R.id.recent_intakes_widget_card,
                titleViewId = R.id.recent_intakes_widget_header,
            )
            WidgetColors.applyText(
                context, widgetData, views,
                viewId = R.id.recent_intakes_widget_empty,
                subtle = true,
            )

            // Row check marks use the same muted color as subtitle text.
            val subtleColor = WidgetColors.textColor(context, widgetData, subtle = true)

            for (i in 0 until ROW_COUNT) {
                if (i >= count) {
                    views.setViewVisibility(ROW_IDS[i], View.GONE)
                    continue
                }
                views.setViewVisibility(ROW_IDS[i], View.VISIBLE)
                views.setTextViewText(DATE_IDS[i], widgetData.getString(dateKey(i), null))
                views.setTextViewText(SUMMARY_IDS[i], widgetData.getString(summaryKey(i), null))
                WidgetColors.applyText(context, widgetData, views, DATE_IDS[i])
                WidgetColors.applyText(context, widgetData, views, SUMMARY_IDS[i], subtle = true)
                views.setInt(ICON_IDS[i], "setColorFilter", subtleColor)
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
