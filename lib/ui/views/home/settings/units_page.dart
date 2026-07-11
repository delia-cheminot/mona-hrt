import 'package:flutter/material.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';

class UnitsPage extends StatelessWidget {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final preferencesService = context.watch<PreferencesService>();
    final savedUnits = preferencesService.units;

    void onUnitsChanged(Units? value) {
      preferencesService.setUnits(value ?? Units.pg_mL_ng_dL);
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.units)),
      body: RadioGroup<Units>(
        groupValue: savedUnits,
        onChanged: onUnitsChanged,
        child: ListView(
          children: [
            for (final units in Units.values)
              RadioListTile<Units>(
                title: Text(units.localizedName),
                value: units,
              ),
          ],
        ),
      ),
    );
  }
}
