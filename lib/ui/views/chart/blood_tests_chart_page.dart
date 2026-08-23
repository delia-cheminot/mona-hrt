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

typedef _LevelEntry = ({Date localDate, Decimal value, String unit});

class BloodTestsChartPage extends StatelessWidget {
  const BloodTestsChartPage({super.key, required this.hormone});

  final Hormone hormone;

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
          final entries = _entries(bloodTestProvider, preferences);

          return SingleChildScrollView(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 200,
                    child: BarChartGraph(
                      spots: _entriesSpots(entries),
                      labels: _entriesLabels(context, entries),
                    ),
                  ),
                ),
                M3ECardList(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: entries.length,
                  itemBuilder: (context, index) =>
                      _testTile(context, entries[index]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<_LevelEntry> _entries(
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

  Widget _testTile(BuildContext context, _LevelEntry entry) {
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

  List<FlSpot> _entriesSpots(List<_LevelEntry> entries) {
    return entries
        .map((i) => FlSpot(
            i.localDate.differenceInDays(entries.last.localDate).toDouble(),
            i.value.toDouble()))
        .toList();
  }

  List<String> _entriesLabels(BuildContext context, List<_LevelEntry> entries) {
    return entries
        .map(
          (entry) => entry.localDate
              .format(DateFormat('MM/yy', context.intlLanguageTag)),
        )
        .toList();
  }
}
