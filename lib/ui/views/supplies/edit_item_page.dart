import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/decimal_helpers.dart';
import 'package:provider/provider.dart';

class EditItemPage extends StatefulWidget {
  final SupplyItem item;

  EditItemPage({required this.item});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  late TextEditingController _totalAmountController;
  late TextEditingController _usedAmountController;
  late TextEditingController _concentrationController;
  late TextEditingController _nameController;
  late Molecule _molecule;
  late AdministrationRoute _administrationRoute;
  late Ester? _ester;
  late PreferencesService _preferencesService;
  late SupplyItemProvider _supplyItemProvider;

  String? get _nameError => SupplyItem.validateName(_nameController.text);

  String? get _totalAmountError =>
      SupplyItem.validateTotalAmount(_totalAmountController.text);

  String? get _usedAmountError {
    final validator =
        SupplyItem.usedAmountValidator(_totalAmountController.text);
    return validator(_usedAmountController.text);
  }

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
      _usedAmountError == null &&
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

  void _refresh() => setState(() {});

  void _saveChanges() {
    if (!_isFormValid) return;
    if (!mounted) return;

    final concentration = parseDecimal(_concentrationController.text);
    final totalDose = concentration * parseDecimal(_totalAmountController.text);
    final usedDose = concentration * parseDecimal(_usedAmountController.text);

    final updatedItem = widget.item.copyWith(
      name: _nameController.text,
      totalDose: totalDose,
      concentration: concentration,
      usedDose: usedDose,
      molecule: _molecule,
      administrationRoute: _administrationRoute,
      ester: _ester,
      clearEster: !_useEsterField,
    );
    _supplyItemProvider.updateItem(updatedItem);

    Navigator.of(context).pop();
  }

  Future<void> _confirmDelete() async {
    final confirmed = await Dialogs.confirmDelete(context);

    if (confirmed == true) {
      if (!mounted) return;
      _supplyItemProvider.deleteItem(widget.item);
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();
    final totalAmountText =
        widget.item.getAmount(widget.item.totalDose).toString();
    final usedAmountText =
        widget.item.getAmount(widget.item.usedDose).toString();
    _totalAmountController = TextEditingController(text: totalAmountText);
    _usedAmountController = TextEditingController(text: usedAmountText);
    _concentrationController =
        TextEditingController(text: widget.item.concentration.toString());
    _nameController = TextEditingController(text: widget.item.name);
    _molecule = widget.item.molecule;
    _administrationRoute = widget.item.administrationRoute;
    _ester = widget.item.ester;
    _supplyItemProvider =
        Provider.of<SupplyItemProvider>(context, listen: false);
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
  }

  @override
  void dispose() {
    _totalAmountController.dispose();
    _usedAmountController.dispose();
    _concentrationController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return ModelForm(
      title: strings.editItem,
      submitButtonLabel: strings.save,
      isFormValid: _isFormValid,
      saveChanges: _saveChanges,
      onDelete: _confirmDelete,
      fields: [
        FormTextField(
          controller: _nameController,
          label: strings.name,
          onChanged: _refresh,
          inputType: TextInputType.text,
          errorText: _nameError,
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
          suffixText: _administrationRoute.unit,
          errorText: _totalAmountError,
          regexFormatter: r'[0-9.,]',
        ),
        FormTextField(
          controller: _usedAmountController,
          label: strings.usedAmount,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: _administrationRoute.unit,
          errorText: _usedAmountError,
          regexFormatter: r'[0-9.,]',
        ),
        FormTextField(
          controller: _concentrationController,
          label: strings.concentration,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: '${_molecule.unit}/${_administrationRoute.unit}',
          errorText: _concentrationError,
          regexFormatter: r'[0-9.,]',
        ),
      ],
    );
  }
}
