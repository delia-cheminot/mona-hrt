package com.deliacheminot.mona

import android.content.Context
import android.graphics.Typeface
import android.os.Build
import android.text.TextPaint
import android.util.TypedValue
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.ColorFilter
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.LocalSize
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.SizeMode
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import es.antonborri.home_widget.HomeWidgetGlanceState
import es.antonborri.home_widget.HomeWidgetGlanceStateDefinition
import es.antonborri.home_widget.actionStartActivity
import java.time.LocalDate
import java.util.Locale

private const val TITLE_TEXT_SP = 18f
private const val ROW_PADDING_DP = 16f
private const val ICON_BOX_DP = 48f
private const val ICON_SPACER_DP = 12f

private fun GlanceModifier.appWidgetBackgroundRadius(): GlanceModifier =
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        cornerRadius(android.R.dimen.system_app_widget_background_radius)
    } else {
        cornerRadius(16.dp)
    }

class HrtGlanceWidget : GlanceAppWidget() {

    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    override val sizeMode = SizeMode.Exact

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent { Content(context, currentState()) }
    }

    @Composable
    private fun Content(context: Context, state: HomeWidgetGlanceState) {
        val prefs = state.preferences
        val firstDate = prefs.getString("hrt_first_date", null)
        val localeTag = prefs.getString("app_locale", "en") ?: "en"
        val intakeCount = prefs.getString("hrt_intake_count", null)?.toIntOrNull()

        val hasData = !firstDate.isNullOrEmpty()
        val text = if (hasData) {
            durationText(context, firstDate!!, localeTag)
        } else {
            localizedContext(context, localeTag)
                .getString(R.string.hrt_home_widget_placeholder)
        }
        val widthDp = LocalSize.current.width.value
        val subtitle = if (hasData && intakeCount != null && titleFitsOneLine(context, text, widthDp)) {
            intakeCountText(context, intakeCount, localeTag)
        } else {
            null
        }

        GlanceTheme {
            Row(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .background(GlanceTheme.colors.widgetBackground)
                    .appWidgetBackgroundRadius()
                    .padding(16.dp)
                    .clickable(onClick = actionStartActivity<MainActivity>(context)),
                verticalAlignment = Alignment.CenterVertically,
            ) {
                Box(
                    contentAlignment = Alignment.Center,
                    modifier = GlanceModifier.size(48.dp),
                ) {
                    Image(
                        provider = ImageProvider(R.drawable.widget_icon_circle),
                        contentDescription = null,
                        colorFilter = ColorFilter.tint(GlanceTheme.colors.tertiaryContainer),
                        modifier = GlanceModifier.fillMaxSize(),
                    )
                    Image(
                        provider = ImageProvider(R.drawable.ic_hrt_calendar),
                        contentDescription = null,
                        colorFilter = ColorFilter.tint(GlanceTheme.colors.onTertiaryContainer),
                        modifier = GlanceModifier.size(24.dp),
                    )
                }
                Spacer(modifier = GlanceModifier.width(12.dp))
                Column {
                    Text(
                        text = text,
                        style = TextStyle(
                            color = GlanceTheme.colors.primary,
                            fontSize = 18.sp,
                            fontWeight = FontWeight.Medium,
                        ),
                    )
                    if (subtitle != null) {
                        Text(
                            text = subtitle,
                            style = TextStyle(
                                color = GlanceTheme.colors.primary,
                                fontSize = 13.sp,
                                fontWeight = FontWeight.Normal,
                            ),
                        )
                    }
                }
            }
        }
    }

    private fun durationText(context: Context, startIso: String, localeTag: String): String {
        val duration = hrtDurationSince(startIso, LocalDate.now())
        val pluralRes = when (duration.unit) {
            HrtDurationUnit.DAYS -> R.plurals.on_hrt_for_days
            HrtDurationUnit.WEEKS -> R.plurals.on_hrt_for_weeks
            HrtDurationUnit.MONTHS -> R.plurals.on_hrt_for_months
            HrtDurationUnit.YEARS -> R.plurals.on_hrt_for_years
        }
        val localized = localizedContext(context, localeTag)
        return localized.resources.getQuantityString(pluralRes, duration.value, duration.value)
    }

    private fun intakeCountText(context: Context, count: Int, localeTag: String): String {
        val localized = localizedContext(context, localeTag)
        return localized.resources.getQuantityString(R.plurals.intakes_logged_count, count, count)
    }

    private fun titleFitsOneLine(context: Context, title: String, widthDp: Float): Boolean {
        val metrics = context.resources.displayMetrics
        val availableDp = widthDp - (ROW_PADDING_DP * 2) - ICON_BOX_DP - ICON_SPACER_DP
        if (availableDp <= 0f) return false
        val availablePx = availableDp * metrics.density
        val paint = TextPaint().apply {
            textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, TITLE_TEXT_SP, metrics)
            typeface = Typeface.DEFAULT_BOLD
        }
        return paint.measureText(title) <= availablePx
    }

    private fun localizedContext(context: Context, localeTag: String): Context {
        val locale = Locale.forLanguageTag(localeTag)
        val config = android.content.res.Configuration(context.resources.configuration)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            config.setLocale(locale)
        } else {
            @Suppress("DEPRECATION")
            config.locale = locale
        }
        return context.createConfigurationContext(config)
    }
}
