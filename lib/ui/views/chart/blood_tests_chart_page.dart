import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:mona/data/model/hormone.dart';
import 'package:mona/data/model/level_entry.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/chart/bar_chart_graph.dart';
import 'package:mona/ui/views/chart/level_entry_spots.dart';
import 'package:provider/provider.dart';

class BloodTestsChartPage extends StatefulWidget {
  const BloodTestsChartPage({super.key, required this.hormone});

  final Hormone hormone;

  @override
  State<BloodTestsChartPage> createState() => _BloodTestsChartPageState();
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
              bloodTestProvider.levelEntries(hormone, preferences.units);
          final chronologicalEntries = entries.reversed.toList();
          final unitLabel = switch (hormone) {
            Hormone.estradiol => preferences.units.estradiol.localizedName,
            Hormone.testosterone =>
              preferences.units.testosterone.localizedName,
          };

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 250,
                    child: BarChartGraph(
                      spots: chronologicalEntries.toSpots(),
                      labels: _entriesLabels(context, chronologicalEntries),
                      unit: unitLabel,
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
            text: entry.value.value.toString(),
            style: theme.textTheme.titleMedium,
            children: [
              TextSpan(
                text: ' ${entry.value.unit.localizedName}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
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
