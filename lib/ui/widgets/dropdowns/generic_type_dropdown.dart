import 'package:flutter/material.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/i18n/helpers/generic_type_l10n.dart';

List<DropdownMenuItem<GenericSupplyType>> genericItemTypeDropdownMenuItems() =>
    GenericSupplyType.values
        .map(
          (type) => DropdownMenuItem<GenericSupplyType>(
            value: type,
            child: Text(type.localizedName),
          ),
        )
        .toList();
