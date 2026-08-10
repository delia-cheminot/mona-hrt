package com.deliacheminot.mona

import android.content.Context
import android.content.SharedPreferences
import android.content.res.ColorStateList
import android.content.res.Configuration
import android.os.Build
import android.widget.RemoteViews
import androidx.core.content.ContextCompat

/**
 * Applies Mona's *actual current* Material color scheme to a widget's card
 * background, icon, and text views, instead of a color baked into the APK.
 *
 * [WidgetThemeService] (lib/services/widget_theme_service.dart) resolves the
 * app's live ColorScheme -- honoring Material You dynamic color, custom
 * themes, and light/dark mode -- and pushes both light and dark variants via
 * home_widget. This picks whichever matches the device's current night
 * mode, falling back to colors.xml (Mona's default, non-dynamic light
 * scheme) before the app has synced once.
 *
 * Retinting a shape drawable's fill color at runtime needs
 * [RemoteViews.setColorStateList], added in API 31, so below that the
 * widgets keep colors.xml's static look.
 */
object WidgetColors {
    private fun isNightMode(context: Context): Boolean {
        val mode = context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK
        return mode == Configuration.UI_MODE_NIGHT_YES
    }

    private fun color(
        context: Context,
        widgetData: SharedPreferences,
        key: String,
        fallbackRes: Int,
    ): Int {
        val suffix = if (isNightMode(context)) "dark" else "light"
        val fallback = ContextCompat.getColor(context, fallbackRes)
        val fullKey = "${key}_$suffix"

        // home_widget stores Dart `int`s as either a Kotlin Int or Long
        // depending on the value's magnitude (Flutter's platform channel
        // codec picks Int32 vs Int64). Every opaque ARGB color from
        // Color.toARGB32() is > 2^31, so in practice these always land here
        // as a Long -- but fall back to getInt for safety, e.g. a
        // semi-transparent color small enough to have been sent as Int32.
        return try {
            widgetData.getLong(fullKey, fallback.toLong()).toInt()
        } catch (e: ClassCastException) {
            widgetData.getInt(fullKey, fallback)
        }
    }

    private fun tintBackground(views: RemoteViews, viewId: Int, color: Int) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            views.setColorStateList(viewId, "setBackgroundTintList", ColorStateList.valueOf(color))
        }
    }

    /** Tints [cardViewId]'s card background and the title/subtitle text colors. */
    fun applyCard(
        context: Context,
        widgetData: SharedPreferences,
        views: RemoteViews,
        cardViewId: Int,
        titleViewId: Int,
        subtitleViewId: Int? = null,
    ) {
        tintBackground(
            views, cardViewId,
            color(context, widgetData, "widget_card_background", R.color.hrt_widget_card_background),
        )
        views.setTextColor(
            titleViewId,
            color(context, widgetData, "widget_title_text", R.color.hrt_widget_title_text),
        )
        if (subtitleViewId != null) {
            views.setTextColor(
                subtitleViewId,
                color(context, widgetData, "widget_subtitle_text", R.color.hrt_widget_subtitle_text),
            )
        }
    }

    /** Tints an icon circle + its glyph, using the app's error colors instead when [overdue]. */
    fun applyIcon(
        context: Context,
        widgetData: SharedPreferences,
        views: RemoteViews,
        circleViewId: Int,
        glyphViewId: Int,
        overdue: Boolean = false,
    ) {
        val backgroundKey =
            if (overdue) "widget_overdue_icon_background" else "widget_icon_background"
        val backgroundFallback =
            if (overdue) R.color.widget_overdue_icon_background else R.color.hrt_widget_icon_background
        val foregroundKey =
            if (overdue) "widget_overdue_icon_foreground" else "widget_icon_foreground"
        val foregroundFallback =
            if (overdue) R.color.widget_overdue_icon_foreground else R.color.hrt_widget_icon_foreground

        tintBackground(views, circleViewId, color(context, widgetData, backgroundKey, backgroundFallback))
        views.setInt(
            glyphViewId, "setColorFilter",
            color(context, widgetData, foregroundKey, foregroundFallback),
        )
    }

    /** Tints a plain (non-circle) text/icon color, e.g. an empty-state message. */
    fun applyText(
        context: Context,
        widgetData: SharedPreferences,
        views: RemoteViews,
        viewId: Int,
        subtle: Boolean = false,
    ) {
        views.setTextColor(viewId, textColor(context, widgetData, subtle))
    }

    /** The resolved subtitle (muted) or title (primary) text color, for ad-hoc use. */
    fun textColor(
        context: Context,
        widgetData: SharedPreferences,
        subtle: Boolean = false,
    ): Int {
        val key = if (subtle) "widget_subtitle_text" else "widget_title_text"
        val fallback = if (subtle) R.color.hrt_widget_subtitle_text else R.color.hrt_widget_title_text
        return color(context, widgetData, key, fallback)
    }
}
