import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/generic_supply_item.dart';

extension GenericSupplyTypeIcon on GenericSupplyType {
  IconData get icon {
    switch (this) {
      case GenericSupplyType.syringe:
      case GenericSupplyType.needle:
        return Symbols.syringe_rounded;
      case GenericSupplyType.wipe:
        return Symbols.note_stack_rounded;
      case GenericSupplyType.gloves:
        return Symbols.handshake_rounded;
      case GenericSupplyType.bandage:
        return Symbols.healing_rounded;
    }
  }
}
