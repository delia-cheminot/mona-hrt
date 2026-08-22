import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:mona/data/model/hormone.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:provider/provider.dart';

typedef _LevelEntry = ({DateTime localDateTime, String value, String unit});

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
                _graphPlaceholder(context),
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
                  localDateTime: test.localDateTime,
                  value: test.estradiolLevels!.inUnit(unit).toString(),
                  unit: unit.localizedName,
                ))
            .toList();
      case Hormone.testosterone:
        final unit = preferences.units.testosterone;
        return provider.testosteroneTestsSortedDesc
            .map((test) => (
                  localDateTime: test.localDateTime,
                  value: test.testosteroneLevels!.inUnit(unit).toString(),
                  unit: unit.localizedName,
                ))
            .toList();
    }
  }

  Widget _testTile(BuildContext context, _LevelEntry entry) {
    final theme = Theme.of(context);
    final dateText =
        DateFormat.yMMMd(context.intlLanguageTag).format(entry.localDateTime);
    return Row(
      children: [
        Expanded(
          child: Text(dateText, style: theme.textTheme.bodyLarge),
        ),
        Text.rich(
          TextSpan(
            text: entry.value,
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

  Widget _graphPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
    );
  }
}
