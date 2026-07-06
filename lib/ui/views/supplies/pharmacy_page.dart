import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/supplies/supply_item_card.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({super.key});

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  _Filter _filter = _Filter.all;

  @override
  Widget build(BuildContext context) {
    return Consumer<SupplyItemProvider>(
      builder: (context, supplyItemProvider, child) {
        final hasMedication = supplyItemProvider.medicationItems.isNotEmpty;
        final hasGeneric = supplyItemProvider.genericItems.isNotEmpty;
        final shouldDisplayFilter = hasMedication && hasGeneric;
        final effectiveFilter =
            _filter.isAvailable(hasMed: hasMedication, hasGen: hasGeneric)
                ? _filter
                : _Filter.all;
        final items = effectiveFilter.items(supplyItemProvider);

        return MainPageWrapper(
          isLoading: supplyItemProvider.isLoading,
          isEmpty: supplyItemProvider.items.isEmpty,
          emptyMessage: t.empty_supplies,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (shouldDisplayFilter)
                  Padding(
                    padding: pagePadding +
                        const EdgeInsets.only(top: 16, bottom: 16),
                    child: Align(
                      alignment: Alignment.center,
                      child: _filterToggle(effectiveFilter, context),
                    ),
                  ),
                MasonryGridView.builder(
                  padding:
                      pagePadding - const EdgeInsets.symmetric(horizontal: 4),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return SupplyItemCard(
                      key: ValueKey(item.id),
                      item: item,
                    );
                  },
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _filterToggle(_Filter effectiveFilter, BuildContext context) {
    final theme = Theme.of(context);

    return M3EToggleButtonGroup(
      type: M3EButtonGroupType.standard,
      size: M3EButtonSize.md,
      decoration: M3EToggleButtonDecoration.styleFrom(
        haptic: M3EHapticFeedback.light,
      ),
      selectedIndex: effectiveFilter.index,
      onSelectedIndexChanged: (index) {
        if (index == null) return;
        setState(() {
          _filter = _Filter.values[index];
        });
      },
      actions: [
        for (final filter in _Filter.values)
          M3EToggleButtonGroupAction(
            label: Text(filter.label),
            decoration: filter.decoration(theme),
          ),
      ],
    );
  }
}

enum _Filter { all, medication, generic }

extension _FilterX on _Filter {
  String get label => switch (this) {
        _Filter.all => t.allItemsFilter,
        _Filter.medication => t.medicationItemsFilter,
        _Filter.generic => t.genericItemsFilter,
      };

  List<SupplyItem> items(SupplyItemProvider p) => switch (this) {
        _Filter.all => p.allItemsOrderedByName,
        _Filter.medication => p.medicationItemsOrderedByName,
        _Filter.generic => p.genericItemsOrderedByName,
      };

  M3EToggleButtonDecoration? decoration(ThemeData theme) => switch (this) {
        _Filter.generic => M3EToggleButtonDecoration.styleFrom(
            checkedBackgroundColor: theme.colorScheme.secondary,
            checkedForegroundColor: theme.colorScheme.onSecondary,
          ),
        _ => null,
      };

  bool isAvailable({required bool hasMed, required bool hasGen}) =>
      switch (this) {
        _Filter.all => true,
        _Filter.medication => hasMed,
        _Filter.generic => hasGen,
      };
}
