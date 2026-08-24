import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/hormone.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/chart/bar_chart_graph.dart';
import 'package:provider/provider.dart';

typedef LevelEntry = ({Date localDate, Decimal value, String unit});

class BloodTestsChartPage extends StatefulWidget {
  const BloodTestsChartPage({super.key, required this.hormone});

  final Hormone hormone;

  @override
  State<BloodTestsChartPage> createState() => _BloodTestsChartPageState();

  List<LevelEntry> getListOfEntries(
    BloodTestProvider provider,
    PreferencesService preferences,
  ) {
    switch (hormone) {
      case Hormone.estradiol:
        final unit = preferences.units.estradiol;
        return provider.estradiolTestsSortedDesc
            .map((test) => (
                  localDate: test.localDate,
                  value: test.estradiolLevels!.inUnit(unit),
                  unit: unit.localizedName,
                ))
            .toList();
      case Hormone.testosterone:
        final unit = preferences.units.testosterone;
        return provider.testosteroneTestsSortedDesc
            .map((test) => (
                  localDate: test.localDate,
                  value: test.testosteroneLevels!.inUnit(unit),
                  unit: unit.localizedName,
                ))
            .toList();
    }
  }

  List<FlSpot> lastFiveEntriesSpots(List<LevelEntry> entries) {
    // entries are newest-first, so take the five newest then flip to oldest-first.
    final lastFiveEntries = entries.take(5).toList().reversed.toList();
    return lastFiveEntries
        .map((i) => FlSpot(
            i.localDate
                .differenceInDays(lastFiveEntries.first.localDate)
                .toDouble(),
            i.value.toDouble()))
        .toList();
  }
}

class _BloodTestsChartPageState extends State<BloodTestsChartPage> {
  int? _highlightedBarIndex;

  Hormone get hormone => widget.hormone;

  String get _title => switch (hormone) {
        Hormone.estradiol => t.estradiol,
        Hormone.testosterone => t.testosterone,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Consumer2<BloodTestProvider, PreferencesService>(
        builder: (context, bloodTestProvider, preferences, child) {
          final entries =
              widget.getListOfEntries(bloodTestProvider, preferences);
          final chronologicalEntries = entries.reversed.toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 250,
                    child: BarChartGraph(
                      spots: _entriesSpots(chronologicalEntries),
                      labels: _entriesLabels(context, chronologicalEntries),
                      unit: entries.first.unit,
                      highlightedIndex: _highlightedBarIndex,
                    ),
                  ),
                ),
                M3ECardList(
                  margin: pagePadding.add(EdgeInsets.only(
                      top: 8,
                      bottom: MediaQuery.viewPaddingOf(context).bottom)),
                  padding: EdgeInsets.zero,
                  itemCount: entries.length,
                  itemBuilder: (context, index) => InkWell(
                    onTapDown: (_) => setState(() =>
                        _highlightedBarIndex = entries.length - 1 - index),
                    onTapUp: (_) => setState(() => _highlightedBarIndex = null),
                    onTapCancel: () =>
                        setState(() => _highlightedBarIndex = null),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: _testTile(context, entries[index]),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _testTile(BuildContext context, LevelEntry entry) {
    final theme = Theme.of(context);
    final dateText =
        entry.localDate.format(DateFormat.yMMMd(context.intlLanguageTag));
    return Row(
      children: [
        Expanded(
          child: Text(dateText, style: theme.textTheme.bodyLarge),
        ),
        Text.rich(
          TextSpan(
            text: entry.value.toString(),
            style: theme.textTheme.titleMedium,
            children: [
              TextSpan(
                text: ' ${entry.unit}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<FlSpot> _entriesSpots(List<LevelEntry> entries) {
    return entries
        .map((i) => FlSpot(
            i.localDate.differenceInDays(entries.first.localDate).toDouble(),
            i.value.toDouble()))
        .toList();
  }

  List<String> _entriesLabels(BuildContext context, List<LevelEntry> entries) {
    return entries
        .map(
          (entry) => entry.localDate
              .format(DateFormat('MM/yy', context.intlLanguageTag)),
        )
        .toList();
  }
}
