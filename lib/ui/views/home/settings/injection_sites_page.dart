import 'package:flutter/material.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/i18n/helpers/placement_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:provider/provider.dart';

class InjectionSitesPage extends StatelessWidget {
  const InjectionSitesPage({super.key});

  Future<void> _addSite(
      BuildContext context, PreferencesService preferencesService) async {
    final placement = await showDialog<Placement>(
      context: context,
      builder: (context) => const _AddSiteDialog(),
    );
    if (placement == null) return;

    final sites = List<Placement>.from(preferencesService.placementsList);
    if (!sites.contains(placement)) {
      await preferencesService.setPlacementsList(sites..add(placement));
    }
  }

  Future<void> _removeSiteAt(
      PreferencesService preferencesService, int index) async {
    final sites = List<Placement>.from(preferencesService.placementsList)
      ..removeAt(index);
    await preferencesService.setPlacementsList(sites);
  }

  @override
  Widget build(BuildContext context) {
    final preferencesService = context.watch<PreferencesService>();
    final sites = preferencesService.placementsList;

    return Scaffold(
      appBar: AppBar(title: Text(t.injectionSites)),
      body: ListView(
        children: [
          if (sites.isEmpty)
            Padding(
              padding: const EdgeInsets.all(borderPadding),
              child: Text(t.noInjectionSitesYet),
            ),
          for (int i = 0; i < sites.length; i++)
            ListTile(
              title: Text(sites[i].localizedName),
              trailing: IconButton(
                key: ValueKey('deleteSite_$i'),
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _removeSiteAt(preferencesService, i),
              ),
            ),
          ListTile(
            key: const ValueKey('addInjectionSiteTile'),
            leading: const Icon(Icons.add),
            title: Text(t.addInjectionSite),
            onTap: () => _addSite(context, preferencesService),
          ),
          const Divider(),
          SwitchListTile(
            key: const ValueKey('placementScopeToggle'),
            title: Text(t.placementSuggestionPerScheduleTitle),
            subtitle: Text(t.placementSuggestionPerScheduleDescription),
            value: preferencesService.placementSuggestionPerSchedule,
            onChanged: (value) =>
                preferencesService.setPlacementSuggestionPerSchedule(value),
          ),
        ],
      ),
    );
  }
}

class _AddSiteDialog extends StatefulWidget {
  const _AddSiteDialog();

  @override
  State<_AddSiteDialog> createState() => _AddSiteDialogState();
}

class _AddSiteDialogState extends State<_AddSiteDialog> {
  final _customController = TextEditingController();

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  Placement? _buildPlacement() {
    final custom = _customController.text.trim();
    if (custom.isNotEmpty) return CustomPlacement(custom);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(t.addInjectionSite),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (final preset in PlacementPreset.values)
                    ListTile(
                      key: ValueKey('presetSite_${preset.name}'),
                      title: Text(preset.localizedName),
                      onTap: () =>
                          Navigator.of(context).pop(PresetPlacement(preset)),
                    ),
                ],
              ),
            ),
            const Divider(),
            TextField(
              key: const ValueKey('customSiteField'),
              controller: _customController,
              decoration: InputDecoration(
                labelText: t.customSiteLabel,
                suffixIcon: IconButton(
                  key: const ValueKey('confirmAddSite'),
                  icon: const Icon(Icons.add),
                  onPressed: () => Navigator.of(context).pop(_buildPlacement()),
                ),
              ),
              onSubmitted: (_) => Navigator.of(context).pop(_buildPlacement()),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.cancel),
        ),
      ],
    );
  }
}
