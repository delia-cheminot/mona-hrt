package com.deliacheminot.mona

import java.time.LocalDate
import java.time.temporal.ChronoUnit

enum class HrtDurationUnit { DAYS, WEEKS, MONTHS, YEARS }

data class HrtDuration(val unit: HrtDurationUnit, val value: Int)

private const val WEEKS_THRESHOLD_DAYS = 7L
private const val MONTHS_THRESHOLD_DAYS = 90L

fun hrtDurationSince(startIso: String, today: LocalDate): HrtDuration {
    val start = LocalDate.parse(startIso)
    val days = ChronoUnit.DAYS.between(start, today).let { if (it < 0) -it else it }

    if (days < WEEKS_THRESHOLD_DAYS) {
        return HrtDuration(HrtDurationUnit.DAYS, maxOf(days, 1L).toInt())
    }
    if (days < MONTHS_THRESHOLD_DAYS) {
        return HrtDuration(HrtDurationUnit.WEEKS, (days / 7L).toInt())
    }
    val months = ChronoUnit.MONTHS.between(start, today).let { if (it < 0) -it else it }
    val years = months / 12L
    if (years < 1L) {
        return HrtDuration(HrtDurationUnit.MONTHS, months.toInt())
    }
    return HrtDuration(HrtDurationUnit.YEARS, years.toInt())
}
