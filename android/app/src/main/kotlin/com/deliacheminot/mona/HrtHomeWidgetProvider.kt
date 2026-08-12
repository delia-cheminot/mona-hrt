package com.deliacheminot.mona

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.content.res.ColorStateList
import android.content.res.Configuration
import android.os.Build
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class HrtHomeWidgetProvider : HomeWidgetProvider() {
  override fun onUpdate(
      context: Context,
      appWidgetManager: AppWidgetManager,
      appWidgetIds: IntArray,
      widgetData: SharedPreferences,
  ) {
    val isNight =
        (context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES

    appWidgetIds.forEach { widgetId ->
      val views =
          RemoteViews(context.packageName, R.layout.hrt_home_widget).apply {
            setTextViewText(
                R.id.hrt_duration_text,
                widgetData.getString("hrt_duration_text", null)
                    ?: context.getString(R.string.hrt_home_widget_placeholder),
            )

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
              pushedColor(widgetData, isNight, "hrt_widget_text_light", "hrt_widget_text_dark")
                  ?.let { setTextColor(R.id.hrt_duration_text, it) }
              pushedColor(widgetData, isNight, "hrt_widget_icon_light", "hrt_widget_icon_dark")
                  ?.let { setInt(R.id.hrt_widget_icon, "setColorFilter", it) }
              setBackgroundTint(
                  this,
                  widgetData,
                  R.id.hrt_widget_container,
                  "hrt_widget_background_light",
                  "hrt_widget_background_dark",
              )
              setBackgroundTint(
                  this,
                  widgetData,
                  R.id.hrt_widget_icon_background,
                  "hrt_widget_icon_background_light",
                  "hrt_widget_icon_background_dark",
              )
            }

            setOnClickPendingIntent(
                R.id.hrt_widget_container,
                HomeWidgetLaunchIntent.getActivity(context, MainActivity::class.java),
            )
          }

      appWidgetManager.updateAppWidget(widgetId, views)
    }
  }

  private fun pushedColor(
      data: SharedPreferences,
      isNight: Boolean,
      lightKey: String,
      darkKey: String,
  ): Int? {
    val key = if (isNight) darkKey else lightKey
    return if (data.contains(key)) data.getLong(key, 0L).toInt() else null
  }

  private fun setBackgroundTint(
      views: RemoteViews,
      data: SharedPreferences,
      viewId: Int,
      lightKey: String,
      darkKey: String,
  ) {
    val light =
        if (data.contains(lightKey)) ColorStateList.valueOf(data.getLong(lightKey, 0L).toInt()) else null
    val dark =
        if (data.contains(darkKey)) ColorStateList.valueOf(data.getLong(darkKey, 0L).toInt()) else null
    if (light != null || dark != null) {
      views.setColorStateList(viewId, "setBackgroundTintList", light, dark)
    }
  }
}
