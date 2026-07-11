import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/data/model/generic_supply_item.dart';

extension GenericSupplyTypeIcon on GenericSupplyType {
  IconData get icon {
    switch (this) {
      case GenericSupplyType.syringe:
      case GenericSupplyType.needle:
        return Symbols.syringe;
      case GenericSupplyType.wipe:
        return Symbols.note_stack;
      case GenericSupplyType.gloves:
        return Symbols.handshake;
      case GenericSupplyType.bandage:
        return Symbols.healing;
    }
  }
}
