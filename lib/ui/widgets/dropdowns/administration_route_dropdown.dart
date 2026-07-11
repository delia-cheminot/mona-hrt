import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';

List<DropdownMenuItem<AdministrationRoute>>
    administrationRouteDropdownMenuItems() => AdministrationRoute.all
        .map(
          (route) => DropdownMenuItem<AdministrationRoute>(
            value: route,
            child: Text(route.localizedName),
          ),
        )
        .toList();
