import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';

class _ChartConstants {
  static const double maxYPadding = 1.15;
  static const double windowWidthFactor = 0.02;
  static const double labelFontSize = 12;
  static const double titleFontSize = 14;
  static const double axesPadding = 8.0;
  static const double bottomReservedSize = 40;
  static const double leftReservedSize = 40;
  static const double lineBarWidth = 3;
  static const double tooltipPadding = 6;
  static const double tooltipRadius = 8;
}

class MainGraph extends StatelessWidget {
  final double window;
  MainGraph({required this.window});

  @override
  Widget build(BuildContext context) {
    final medicationIntakeProvider = context.watch<MedicationIntakeProvider>();
    final preferencesProvider = context.watch<PreferencesService>();
    final bloodTestProvider = context.watch<BloodTestProvider>();
    final theme = Theme.of(context);
    final unit = preferencesProvider.units.estradiol;

    Map<int, GraphIntake> daysAndIntakes =
        medicationIntakeProvider.getDaysAndIntakes();

    if (daysAndIntakes.isEmpty) return SizedBox.shrink();

    final Date firstDay =
        medicationIntakeProvider.getFirstGraphIntakeLocalDate()!;
    Map<int, double> daysAndBloodTests =
        bloodTestProvider.getDaysAndBloodTests(firstDay, unit);

    final List<FlSpot> spots =
        GraphCalculator().generateFlSpots(daysAndIntakes, unit);

    final List<FlSpot> bloodSpots = daysAndBloodTests.entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();

    final int totalDays = medicationIntakeProvider
        .getLastGraphIntakeDate()!
        .differenceInDays(firstDay);
    final double daysSinceStart =
        DateTime.now().difference(firstDay.toDateTime()).inSeconds / 86400.0;

    FlSpot? todaySpot;
    if (daysSinceStart <= totalDays + GraphCalculator.tMaxOffset) {
      final todayConcentration = GraphCalculator()
          .totalConcentrationAtTime(daysSinceStart, daysAndIntakes, unit);
      todaySpot = FlSpot(daysSinceStart, todayConcentration);
    }

    final double maxY =
        [...spots, ...bloodSpots].map((s) => s.y).fold(0.0, math.max);
    final double maxYWithPadding = maxY * _ChartConstants.maxYPadding;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width *
            (1 + _ChartConstants.windowWidthFactor * window),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: _ChartConstants.axesPadding),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text('${t.concentration} (${unit.localizedName})',
                    style: const TextStyle(
                        fontSize: _ChartConstants.titleFontSize)),
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: (totalDays + GraphCalculator.tMaxOffset),
                  minY: 0,
                  maxY: maxYWithPadding,
                  gridData: FlGridData(show: true),
                  titlesData: _buildTitlesData(context, firstDay),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    _buildLineBarData(spots, theme),
                    _buildBloodTestData(bloodSpots, theme),
                  ],
                  lineTouchData:
                      _buildLineTouchData(context, theme, firstDay, unit),
                  extraLinesData: _buildTodayVerticalLine(
                      theme, todaySpot, daysSinceStart, unit),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ExtraLinesData? _buildTodayVerticalLine(ThemeData theme, FlSpot? todaySpot,
      double daysSinceStart, EstradiolUnit unit) {
    if (todaySpot == null) return null;

    final nowLabel =
        '${t.chartNowConcentration(value: todaySpot.y.toStringAsFixed(0))} ${unit.localizedName}';

    return ExtraLinesData(
      verticalLines: [
        VerticalLine(
          x: daysSinceStart,
          color: theme.colorScheme.tertiary,
          strokeWidth: 2,
          dashArray: [6, 4],
          label: VerticalLineLabel(
            show: true,
            labelResolver: (_) => nowLabel,
            style: TextStyle(fontSize: 11, color: theme.colorScheme.tertiary),
          ),
        )
      ],
      extraLinesOnTop: true,
    );
  }

  LineChartBarData _buildLineBarData(List<FlSpot> spots, ThemeData theme) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: theme.colorScheme.primary,
      barWidth: _ChartConstants.lineBarWidth,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: theme.colorScheme.primary.withValues(alpha: 0.3),
      ),
    );
  }

  LineChartBarData _buildBloodTestData(
      List<FlSpot> bloodSpots, ThemeData theme) {
    return LineChartBarData(
      spots: bloodSpots,
      isCurved: false,
      color: theme.colorScheme.tertiary,
      barWidth: 0,
      dotData: FlDotData(show: true),
    );
  }

  LineTouchData _buildLineTouchData(BuildContext context, ThemeData theme,
      Date firstDay, EstradiolUnit unit) {
    return LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpots) => theme.colorScheme.tertiaryContainer,
        tooltipBorderRadius:
            BorderRadius.circular(_ChartConstants.tooltipRadius),
        tooltipPadding: const EdgeInsets.all(_ChartConstants.tooltipPadding),
        maxContentWidth: 200,
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((spot) {
            String text;
            if (spot.barIndex == 0) {
              text = spot.y.toStringAsFixed(1);
            } else {
              text =
                  '${t.chartBloodTestLevelTooltip(date: _getDateLabel(spot.x, firstDay, context), level: spot.y.toStringAsFixed(1))} ${unit.localizedName}';
            }
            return LineTooltipItem(
                text,
                theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onTertiaryContainer) ??
                    const TextStyle());
          }).toList();
        },
      ),
    );
  }

  FlTitlesData _buildTitlesData(BuildContext context, Date firstDay) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: _ChartConstants.bottomReservedSize,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              meta: meta,
              space: _ChartConstants.axesPadding,
              child: Transform.rotate(
                angle: -math.pi / 4,
                child: Text(
                  _getDateLabel(value, firstDay, context),
                  style: const TextStyle(
                    fontSize: _ChartConstants.labelFontSize,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: _ChartConstants.leftReservedSize,
          getTitlesWidget: (value, meta) {
            return Text(value.toStringAsFixed(0),
                style:
                    const TextStyle(fontSize: _ChartConstants.labelFontSize));
          },
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  String _getDateLabel(double value, Date firstDay, BuildContext context) {
    final date = firstDay.add(Duration(days: value.toInt()));
    return DateFormat.Md(context.intlLanguageTag).format(date.toDateTime());
  }
}
