import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/views/supplies/edit_item_page.dart';
import 'package:provider/provider.dart';

class SupplyItemCard extends StatelessWidget {
  final SupplyItem item;

  const SupplyItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (context) => EditItemPage(item: item),
          ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  child: Center(
                    child: item.administrationRoute ==
                            AdministrationRoute.injection
                        ? SvgPicture.asset(
                            _getVialAsset(item.getRatio()),
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          )
                        : Icon(
                            item.administrationRoute.icon,
                            size: 100,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  // text with description
                  Text(
                    '$item',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '${(item.getAmount(item.remainingDose))} ${(item.administrationRoute.unit)} ${strings.remaining}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getVialAsset(double ratio) {
    switch (ratio) {
      case < 0.10:
        return 'assets/pharmacie/fioles/fiole_00.svg';
      case < 0.20:
        return 'assets/pharmacie/fioles/fiole_02.svg';
      case < 0.25:
        return 'assets/pharmacie/fioles/fiole_025.svg';
      case < 0.30:
        return 'assets/pharmacie/fioles/fiole_03.svg';
      case < 0.40:
        return 'assets/pharmacie/fioles/fiole_04.svg';
      case < 0.50:
        return 'assets/pharmacie/fioles/fiole_05.svg';
      case < 0.60:
        return 'assets/pharmacie/fioles/fiole_06.svg';
      case < 0.75:
        return 'assets/pharmacie/fioles/fiole_075.svg';
      case < 0.80:
        return 'assets/pharmacie/fioles/fiole_08.svg';
      case < 0.90:
        return 'assets/pharmacie/fioles/fiole_09.svg';
      default:
        return 'assets/pharmacie/fioles/fiole_1.svg';
    }
  }
}
