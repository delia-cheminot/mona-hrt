import 'package:clock/clock.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/model/hormone.dart';
import 'package:mona/data/model/level_entry.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/chart/baby_graph.dart';
import 'package:mona/ui/views/chart/baby_main_graph.dart';
import 'package:mona/ui/views/chart/blood_tests_chart_page.dart';
import 'package:mona/ui/views/chart/chart_page.dart';
import 'package:mona/ui/views/chart/level_entry_spots.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:mona/util/time_difference.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  Widget _graphTile(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    MedicationIntakeProvider intakeProvider =
        context.watch<MedicationIntakeProvider>();
    final preferencesProvider = context.watch<PreferencesService>();
    final unit = preferencesProvider.units.estradiol;
    final DateTime baseline = intakeProvider.getGraphLocalStart()!;
    final intakes = intakeProvider.getIntakesForGraph(baseline);
    final double tNow = timeDifferenceInDays(clock.now(), baseline);
    final List<FlSpot> lastWeekSpots = GraphCalculator()
        .generateLevelsSpots(intakes, unit, tMin: tNow - 14, tMax: tNow + 4);
    final double nowLevel =
        GraphCalculator().totalConcentrationAtTime(tNow, intakes, unit);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Symbols.trending_up_rounded, color: colorScheme.onSurface),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.estradiolLevelsTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Icon(Symbols.chevron_right_rounded, color: colorScheme.onSurface),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text.rich(
            textAlign: TextAlign.right,
            TextSpan(
              text: nowLevel.toStringAsFixed(0),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: colorScheme.tertiary),
              children: [
                TextSpan(
                  text: ' ${unit.localizedName}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: colorScheme.tertiary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: BabyMainChartGraph(spots: lastWeekSpots, nowX: tNow),
        ),
      ],
    );
  }

  Widget _levelTile(
    BuildContext context, {
    required String label,
    required String value,
    required String unit,
    required List<LevelEntry> entries,
  }) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(Symbols.water_drop_rounded, color: colorScheme.onSurface),
            const SizedBox(width: 8),
            Expanded(
              child: Text(label, style: theme.textTheme.titleMedium),
            ),
            Text(
                entries.first.localDate
                    .format(DateFormat.MMMd(context.intlLanguageTag)),
                style: theme.textTheme.bodyMedium),
            const SizedBox(width: 8),
            Icon(Symbols.chevron_right_rounded, color: colorScheme.onSurface),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                text: value,
                style: theme.textTheme.headlineSmall,
                children: [
                  TextSpan(
                    text: ' $unit',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 96,
              height: 48,
              child: BabyBarChartGraph(spots: entries.lastFiveSpots()),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer3<MedicationIntakeProvider, BloodTestProvider,
        PreferencesService>(
      builder: (context, medicationIntakeProvider, bloodTestProvider,
          preferences, child) {
        final estradiolLevel =
            bloodTestProvider.latestEstradiolLevel(preferences.units.estradiol);
        final testosteroneLevel = bloodTestProvider
            .latestTestosteroneLevel(preferences.units.testosterone);
        final tEntries = bloodTestProvider.levelEntries(
            Hormone.testosterone, preferences.units);
        final eEntries = bloodTestProvider.levelEntries(
            Hormone.estradiol, preferences.units);
        return MainPageWrapper(
          isLoading:
              medicationIntakeProvider.isLoading || bloodTestProvider.isLoading,
          isEmpty: medicationIntakeProvider.plottableIntakes.isEmpty &&
              estradiolLevel == null &&
              testosteroneLevel == null,
          emptyMessage: t.empty_levels,
          child: SingleChildScrollView(
            padding: pagePadding,
            child: Column(
              children: [
                if (medicationIntakeProvider.plottableIntakes.isNotEmpty)
                  M3ECardColumn(
                    padding: const EdgeInsets.only(top: 16),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: colorScheme.surface,
                    onTap: (_) => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => ChartPage(),
                      ),
                    ),
                    children: [
                      _graphTile(context),
                    ],
                  ),
                if (estradiolLevel != null || testosteroneLevel != null)
                  M3ECardColumn(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: colorScheme.surface,
                    onTap: (index) => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => BloodTestsChartPage(
                          hormone: [
                            if (estradiolLevel != null) Hormone.estradiol,
                            if (testosteroneLevel != null) Hormone.testosterone,
                          ][index],
                        ),
                      ),
                    ),
                    children: [
                      if (estradiolLevel != null)
                        _levelTile(
                          context,
                          label: t.estradiol,
                          value: estradiolLevel.value.toString(),
                          unit: estradiolLevel.unit.localizedName,
                          entries: eEntries,
                        ),
                      if (testosteroneLevel != null)
                        _levelTile(
                          context,
                          label: t.testosterone,
                          value: testosteroneLevel.value.toString(),
                          unit: testosteroneLevel.unit.localizedName,
                          entries: tEntries,
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
