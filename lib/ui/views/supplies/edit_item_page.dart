import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/helpers/administration_route_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/dialogs.dart';
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

class EditItemPage extends StatefulWidget {
  final MedicationSupplyItem item;

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
      MedicationSupplyItem.validateTotalAmount(_totalAmountController.text);

  String? get _usedAmountError {
    final validator =
        MedicationSupplyItem.usedAmountValidator(_totalAmountController.text);
    return validator(_usedAmountController.text);
  }

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

    final concentration = _concentrationController.text.toDecimal;
    final totalDose = concentration * _totalAmountController.text.toDecimal;
    final usedDose = concentration * _usedAmountController.text.toDecimal;
    final ester = _useEsterField ? _ester : null;

    final updatedItem = widget.item.copyWith(
      name: _nameController.text,
      totalDose: totalDose,
      concentration: concentration,
      usedDose: usedDose,
      molecule: _molecule,
      administrationRoute: _administrationRoute,
      ester: ester,
    );
    _supplyItemProvider.updateItem(updatedItem);

    Navigator.of(context).pop();
  }

  Future<void> _confirmDelete() async {
    final confirmed = await Dialogs.confirmDeleteDialog(
      context: context,
      title: t.deleteItem(name: widget.item.name),
    );

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
    return ModelForm(
      title: t.editItem,
      avatar: _administrationRoute.icon,
      submitButtonLabel: t.save,
      submitButtonKey: const ValueKey('editItemSave'),
      deleteButtonKey: const ValueKey('editItemDelete'),
      isFormValid: _isFormValid,
      saveChanges: _saveChanges,
      onDelete: _confirmDelete,
      fields: [
        FormTextField(
          controller: _nameController,
          label: t.name,
          fieldKey: const ValueKey('editItemName'),
          onChanged: _refresh,
          inputType: TextInputType.text,
          errorText: _nameError,
        ),
        FormSpacer(),
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
            onChanged: _refresh,
            inputType: TextInputType.numberWithOptions(decimal: true),
            suffixText: _administrationRoute.localizedUnit(1),
            errorText: _totalAmountError,
            regexFormatter: RegexPatterns.floatNumber),
        FormTextField(
            controller: _usedAmountController,
            label: t.usedAmount,
            onChanged: _refresh,
            inputType: TextInputType.numberWithOptions(decimal: true),
            suffixText: _administrationRoute.localizedUnit(1),
            errorText: _usedAmountError,
            regexFormatter: RegexPatterns.floatNumber),
        FormTextField(
          controller: _concentrationController,
          label: t.concentration,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText:
              '${_molecule.localizedUnit}/${_administrationRoute.localizedUnit(1)}',
          errorText: _concentrationError,
          regexFormatter: RegexPatterns.floatNumber,
        ),
      ],
    );
  }
}
