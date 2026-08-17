package com.deliacheminot.mona

import java.time.LocalDate
import org.junit.Assert.assertEquals
import org.junit.Test

class HrtDurationTest {
    @Test
    fun day1_flooredToOne() {
        // Arrange
        val start = "2026-08-13"
        val today = LocalDate.of(2026, 8, 13)
        // Act
        val result = hrtDurationSince(start, today)
        // Assert
        assertEquals(HrtDuration(HrtDurationUnit.DAYS, 1), result)
    }

    @Test
    fun day6_isDays() {
        // Arrange
        val start = "2026-08-01"
        val today = LocalDate.of(2026, 8, 7)
        // Act
        val result = hrtDurationSince(start, today)
        // Assert
        assertEquals(HrtDuration(HrtDurationUnit.DAYS, 6), result)
    }

    @Test
    fun day7_becomesWeeks() {
        // Arrange
        val start = "2026-08-01"
        val today = LocalDate.of(2026, 8, 8)
        // Act
        val result = hrtDurationSince(start, today)
        // Assert
        assertEquals(HrtDuration(HrtDurationUnit.WEEKS, 1), result)
    }

    @Test
    fun day89_isWeeks() {
        // Arrange
        val start = "2026-01-01"
        val today = LocalDate.of(2026, 3, 31) // 89 days
        // Act
        val result = hrtDurationSince(start, today)
        // Assert
        assertEquals(HrtDuration(HrtDurationUnit.WEEKS, 12), result)
    }

    @Test
    fun day90_becomesMonths() {
        // Arrange
        val start = "2026-01-01"
        val today = LocalDate.of(2026, 4, 1) // 90 days
        // Act
        val result = hrtDurationSince(start, today)
        // Assert
        assertEquals(HrtDuration(HrtDurationUnit.MONTHS, 3), result)
    }

    @Test
    fun oneYearPlus_isYears() {
        // Arrange
        val start = "2025-01-01"
        val today = LocalDate.of(2026, 8, 13)
        // Act
        val result = hrtDurationSince(start, today)
        // Assert
        assertEquals(HrtDuration(HrtDurationUnit.YEARS, 1), result)
    }
}
