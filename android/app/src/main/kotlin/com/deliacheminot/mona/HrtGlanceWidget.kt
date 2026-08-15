package com.deliacheminot.mona

import android.content.Context
import android.os.Build
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.ColorFilter
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
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

class HrtGlanceWidget : GlanceAppWidget() {

    override val stateDefinition = HomeWidgetGlanceStateDefinition()

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
            context.getString(R.string.hrt_home_widget_placeholder)
        }
        val subtitle = if (hasData && intakeCount != null) {
            intakeCountText(context, intakeCount, localeTag)
        } else {
            null
        }

        GlanceTheme {
            Row(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .background(GlanceTheme.colors.widgetBackground)
                    .cornerRadius(16.dp)
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
