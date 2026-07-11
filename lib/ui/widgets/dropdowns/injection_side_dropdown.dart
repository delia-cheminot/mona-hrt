import 'package:flutter/material.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/i18n/helpers/injection_side_l10n.dart';

List<DropdownMenuItem<InjectionSide>> injectionSideDropdownMenuItems() =>
    InjectionSide.values
        .map(
          (side) => DropdownMenuItem<InjectionSide>(
            value: side,
            child: Text(side.localizedName),
          ),
        )
        .toList();
