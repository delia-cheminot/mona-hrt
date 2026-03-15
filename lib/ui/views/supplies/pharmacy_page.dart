import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/views/supplies/supply_item_card.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class PharmacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return Consumer<SupplyItemProvider>(
      builder: (context, supplyItemProvider, child) {
        return MainPageWrapper(
          isLoading: supplyItemProvider.isLoading,
          isEmpty: supplyItemProvider.items.isEmpty,
          emptyMessage: strings.noSuppliesMessage,
          child: MasonryGridView.builder(
            padding: pagePadding,
            gridDelegate: SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300),
            itemCount: supplyItemProvider.items.length,
            itemBuilder: (context, index) {
              SupplyItem item = supplyItemProvider.items[index];
              return SupplyItemCard(item: item);
            },
          ),
        );
      },
    );
  }
}
