import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/dropdowns/administration_route_dropdown.dart';
import 'package:mona/ui/widgets/dropdowns/ester_dropdown.dart';
import 'package:mona/ui/widgets/dropdowns/molecule_dropdown.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class NewMedicationItemSpecificsPage extends StatefulWidget {
  final String name;

  const NewMedicationItemSpecificsPage({super.key, required this.name});

  @override
  State<NewMedicationItemSpecificsPage> createState() =>
      _NewMedicationItemSpecificsPageState();
}

class _NewMedicationItemSpecificsPageState
    extends State<NewMedicationItemSpecificsPage> {
  late TextEditingController _totalAmountController;
  late TextEditingController _concentrationController;
  Molecule? _molecule;
  AdministrationRoute? _administrationRoute;
  Ester? _ester;
  late PreferencesService _preferencesService;

  String? get _totalAmountError =>
      MedicationSupplyItem.validateTotalAmount(_totalAmountController.text);
  String? get _concentrationError =>
      MedicationSupplyItem.validateConcentration(_concentrationController.text);
  String? get _moleculeError =>
      MedicationSupplyItem.validateMolecule(_molecule);
  String? get _administrationRouteError =>
      MedicationSupplyItem.validateAdministrationRoute(_administrationRoute);
  String? get _esterError {
    final validator =
        MedicationSupplyItem.esterValidator(_molecule, _administrationRoute);
    return validator(_ester);
  }

  bool get _isFormValid =>
      _totalAmountError == null &&
      _concentrationError == null &&
      _moleculeError == null &&
      _administrationRouteError == null &&
      _esterError == null;

  bool get _useEsterField =>
      _molecule == KnownMolecules.estradiol &&
      _administrationRoute == AdministrationRoute.injection;

  void _onMoleculeChanged(Molecule? molecule) {
    if (molecule != null) {
      setState(() {
        _molecule = molecule;
        if (!_useEsterField) {
          _ester = null;
        }
      });
    }
  }

  void _onAdministrationRouteChanged(AdministrationRoute? administrationRoute) {
    if (administrationRoute != null) {
      setState(() {
        _administrationRoute = administrationRoute;
        if (!_useEsterField) {
          _ester = null;
        }
      });
    }
  }

  void _onEsterChanged(Ester? ester) {
    if (ester != null) {
      setState(() {
        _ester = ester;
      });
    }
  }

  void _refresh() {
    setState(() {});
  }

  void _closeAll() {
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  void _addItem() {
    final totalAmount = _totalAmountController.text.toDecimal;
    final concentration = _concentrationController.text.toDecimal;
    final totalDose = concentration * totalAmount;

    final item = MedicationSupplyItem(
      name: widget.name,
      totalDose: totalDose,
      concentration: concentration,
      molecule: _molecule!,
      administrationRoute: _administrationRoute!,
      ester: _ester,
    );
    Provider.of<SupplyItemProvider>(context, listen: false).add(item);

    Navigator.of(context)
      ..pop()
      ..pop();
  }

  @override
  void initState() {
    super.initState();
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _totalAmountController = TextEditingController();
    _concentrationController = TextEditingController();
  }

  @override
  void dispose() {
    _totalAmountController.dispose();
    _concentrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: widget.name,
      avatar: _administrationRoute?.icon ?? Symbols.medication,
      submitButtonLabel: t.add,
      submitButtonKey: const ValueKey('newMedicationItemAdd'),
      isFormValid: _isFormValid,
      saveChanges: _addItem,
      closeAll: _closeAll,
      fields: [
        FormDropdownField<Molecule>(
          value: _molecule,
          items: moleculeDropdownMenuItems(_preferencesService.allMolecules),
          onChanged: _onMoleculeChanged,
          label: t.molecule,
        ),
        FormDropdownField<AdministrationRoute>(
          value: _administrationRoute,
          items: administrationRouteDropdownMenuItems(),
          onChanged: _onAdministrationRouteChanged,
          label: t.adminRoute,
        ),
        if (_useEsterField)
          FormDropdownField<Ester>(
            value: _ester,
            items: esterDropdownMenuItems(),
            onChanged: _onEsterChanged,
            label: t.ester,
          ),
        FormSpacer(),
        FormTextField(
          controller: _totalAmountController,
          label: t.totalAmount,
          fieldKey: const ValueKey('newMedicationItemTotalAmount'),
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: _administrationRoute?.localizedUnit(1),
          regexFormatter: RegexPatterns.floatNumber,
        ),
        FormTextField(
          controller: _concentrationController,
          label: t.concentration,
          fieldKey: const ValueKey('newMedicationItemConcentration'),
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: _molecule != null && _administrationRoute != null
              ? '${_molecule!.localizedUnit}/${_administrationRoute!.localizedUnit(1)}'
              : null,
          regexFormatter: RegexPatterns.floatNumber,
        ),
      ],
    );
  }
}
