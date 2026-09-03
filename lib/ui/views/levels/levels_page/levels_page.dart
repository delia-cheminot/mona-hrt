import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/model/hormone.dart';
import 'package:mona/data/model/level_entry.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/today_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/levels/blood_test_chart_page/blood_tests_chart_page.dart';
import 'package:mona/ui/views/levels/level_entry_spots.dart';
import 'package:mona/ui/views/levels/levels_page/baby_bar_chart_graph.dart';
import 'package:mona/ui/views/levels/levels_page/baby_main_chart_graph.dart';
import 'package:mona/ui/views/levels/main_graph_page/chart_page.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:mona/util/time_difference.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<TodayProvider>(); // needed for the graph tile
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer3<MedicationIntakeProvider, BloodTestProvider,
        PreferencesService>(
      builder: (context, medicationIntakeProvider, bloodTestProvider,
          preferences, child) {
        final estradiolLevel =
            bloodTestProvider.latestEstradiolLevel(preferences.units.estradiol);
        final testosteroneLevel = bloodTestProvider
            .latestTestosteroneLevel(preferences.units.testosterone);
        final levelRows = [
          if (estradiolLevel != null)
            (
              hormone: Hormone.estradiol,
              label: t.estradiol,
              value: estradiolLevel.value.toString(),
              unit: estradiolLevel.unit.localizedName,
              entries: bloodTestProvider.levelEntries(
                  Hormone.estradiol, preferences.units),
            ),
          if (testosteroneLevel != null)
            (
              hormone: Hormone.testosterone,
              label: t.testosterone,
              value: testosteroneLevel.value.toString(),
              unit: testosteroneLevel.unit.localizedName,
              entries: bloodTestProvider.levelEntries(
                  Hormone.testosterone, preferences.units),
            ),
        ];

        return MainPageWrapper(
          isLoading:
              medicationIntakeProvider.isLoading || bloodTestProvider.isLoading,
          isEmpty: medicationIntakeProvider.plottableIntakes.isEmpty &&
              levelRows.isEmpty,
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
                    children: const [
                      _GraphTile(),
                    ],
                  ),
                if (levelRows.isNotEmpty)
                  M3ECardColumn(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: colorScheme.surface,
                    onTap: (index) => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => BloodTestsChartPage(
                          hormone: levelRows[index].hormone,
                        ),
                      ),
                    ),
                    children: [
                      for (final row in levelRows)
                        _LevelTile(
                          label: row.label,
                          value: row.value,
                          unit: row.unit,
                          entries: row.entries,
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

class _GraphTile extends StatelessWidget {
  const _GraphTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final intakeProvider = context.watch<MedicationIntakeProvider>();
    final unit = context.watch<PreferencesService>().units.estradiol;
    final baseline = intakeProvider.getGraphLocalStart()!;
    final intakes = intakeProvider.getIntakesForGraph(baseline);
    final tNow = timeDifferenceInDays(clock.now(), baseline);
    final lastWeekSpots = GraphCalculator()
        .generateLevelsSpots(intakes, unit, tMin: tNow - 9, tMax: tNow + 5);
    final nowLevel =
        GraphCalculator().totalConcentrationAtTime(tNow, intakes, unit);
    final showPreview =
        lastWeekSpots.peakY >= 10; // value meaningless under 10 whatever unit

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
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Icon(Symbols.chevron_right_rounded, color: colorScheme.onSurface),
            ],
          ),
        ),
        if (showPreview) ...[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(right: 78),
            child: Text.rich(
              textAlign: TextAlign.right,
              TextSpan(
                text: nowLevel.toStringAsFixed(0),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: colorScheme.tertiary),
                children: [
                  TextSpan(
                    text: ' ${unit.localizedName}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.tertiary),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 160,
            child: BabyMainChartGraph(
                spots: lastWeekSpots, nowX: tNow, nowY: nowLevel),
          ),
        ] else
          const SizedBox(height: 16),
      ],
    );
  }
}

class _LevelTile extends StatelessWidget {
  _LevelTile({
    required this.label,
    required this.value,
    required this.unit,
    required this.entries,
  }) : assert(entries.isNotEmpty, 'entries must not be empty');

  final String label;
  final String value;
  final String unit;
  final List<LevelEntry> entries;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
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
}
