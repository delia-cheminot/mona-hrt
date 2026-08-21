import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/chart/chart_page.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  Widget _graphTile(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Symbols.trending_up_rounded),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                t.estradiolLevelsTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Icon(Symbols.chevron_right_rounded),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
        ),
      ],
    );
  }

  Widget _levelTile(
    BuildContext context, {
    required String label,
    required String value,
    required String unit,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Symbols.water_drop_rounded),
            const SizedBox(width: 8),
            Expanded(
              child: Text(label, style: theme.textTheme.titleMedium),
            ),
            Text('14 Aug', style: theme.textTheme.bodyMedium),
            const SizedBox(width: 8),
            const Icon(Symbols.chevron_right_rounded),
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
            Container(
              width: 96,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
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
                    padding: const EdgeInsets.all(16),
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
                    onTap: (_) {},
                    children: [
                      if (estradiolLevel != null)
                        _levelTile(
                          context,
                          label: 'Estradiol',
                          value: estradiolLevel.value.toString(),
                          unit: estradiolLevel.unit.localizedName,
                        ),
                      if (testosteroneLevel != null)
                        _levelTile(
                          context,
                          label: 'Testosterone',
                          value: testosteroneLevel.value.toString(),
                          unit: testosteroneLevel.unit.localizedName,
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
