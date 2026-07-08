import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/i18n/translations.g.dart';

extension GenericItemTypeL10n on GenericSupplyType {
  String get localizedName {
    switch (this) {
      case GenericSupplyType.syringe:
        return t.syringe;
      case GenericSupplyType.wipe:
        return t.wipe;
      case GenericSupplyType.needle:
        return t.needle;
      case GenericSupplyType.gloves:
        return t.gloves;
      case GenericSupplyType.bandage:
        return t.bandage;
    }
  }

  String localizedRemaining(num count) {
    switch (this) {
      case GenericSupplyType.syringe:
        return t.syringeRemaining(count: count);
      case GenericSupplyType.wipe:
        return t.wipeRemaining(count: count);
      case GenericSupplyType.needle:
        return t.needleRemaining(count: count);
      case GenericSupplyType.gloves:
        return t.glovesRemaining(count: count);
      case GenericSupplyType.bandage:
        return t.bandageRemaining(count: count);
    }
  }

  String fallbackLabel() {
    final name = this.name;
    if (name.isEmpty) return name;
    return name[0].toUpperCase() + name.substring(1);
  }
}
