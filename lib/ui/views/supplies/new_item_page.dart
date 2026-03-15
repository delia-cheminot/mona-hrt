import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/decimal_helpers.dart';
import 'package:provider/provider.dart';

class NewItemPage extends StatefulWidget {
  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  late TextEditingController _totalAmountController;
  late TextEditingController _nameController;
  late TextEditingController _concentrationController;
  Molecule? _molecule;
  AdministrationRoute? _administrationRoute;
  Ester? _ester;
  late PreferencesService _preferencesService;

  String? get _nameError => SupplyItem.validateName(_nameController.text);
  String? get _totalAmountError =>
      SupplyItem.validateTotalAmount(_totalAmountController.text);
  String? get _concentrationError =>
      SupplyItem.validateConcentration(_concentrationController.text);
  String? get _moleculeError => SupplyItem.validateMolecule(_molecule);
  String? get _administrationRouteError =>
      SupplyItem.validateAdministrationRoute(_administrationRoute);
  String? get _esterError {
    final validator =
        SupplyItem.esterValidator(_molecule, _administrationRoute);
    return validator(_ester);
  }

  bool get _isFormValid =>
      _nameError == null &&
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

  void _addItem() async {
    final totalAmount = parseDecimal(_totalAmountController.text);
    final concentration = parseDecimal(_concentrationController.text);
    final totalDose = concentration * totalAmount;
    final name = _nameController.text;
    final supplyItemProvider =
        Provider.of<SupplyItemProvider>(context, listen: false);

    final item = SupplyItem(
      name: name,
      totalDose: totalDose,
      concentration: concentration,
      molecule: _molecule!,
      administrationRoute: _administrationRoute!,
      ester: _ester,
    );
    supplyItemProvider.add(item);

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _totalAmountController = TextEditingController();
    _nameController = TextEditingController();
    _concentrationController = TextEditingController();
  }

  @override
  void dispose() {
    _totalAmountController.dispose();
    _nameController.dispose();
    _concentrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return ModelForm(
      title: strings.newItem,
      submitButtonLabel: strings.add,
      isFormValid: _isFormValid,
      saveChanges: _addItem,
      fields: [
        FormTextField(
          controller: _nameController,
          label: strings.name,
          onChanged: _refresh,
          inputType: TextInputType.text,
        ),
        FormSpacer(),
        FormDropdownField<Molecule>(
          value: _molecule,
          items: _preferencesService.moleculeDropdownItems,
          onChanged: _onMoleculeChanged,
          label: strings.molecule,
        ),
        FormDropdownField<AdministrationRoute>(
          value: _administrationRoute,
          items: AdministrationRoute.menuItems,
          onChanged: _onAdministrationRouteChanged,
          label: strings.administrationRoute,
        ),
        if (_useEsterField)
          FormDropdownField<Ester>(
            value: _ester,
            items: Ester.menuItems,
            onChanged: _onEsterChanged,
            label: strings.ester,
          ),
        FormSpacer(),
        FormTextField(
          controller: _totalAmountController,
          label: strings.totalAmount,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: _administrationRoute?.unit,
          regexFormatter: r'[0-9.,]',
        ),
        FormTextField(
          controller: _concentrationController,
          label: strings.concentration,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: '${_molecule?.unit}/${_administrationRoute?.unit}',
          regexFormatter: r'[0-9.,]',
        ),
      ],
    );
  }
}
