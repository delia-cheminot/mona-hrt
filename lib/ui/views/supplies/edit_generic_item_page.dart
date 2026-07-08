import 'package:flutter/material.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/extensions/generic_supply_type_icon.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/dropdowns/generic_type_dropdown.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class EditItemPage extends StatefulWidget {
  final GenericSupply item;

  EditItemPage({required this.item});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  late TextEditingController _nameController;
  late TextEditingController _amountController;
  late GenericSupplyType _genericSupplyType;
  late SupplyItemProvider _supplyItemProvider;

  String? get _nameError => SupplyItem.validateName(_nameController.text);

  String? get _amountError =>
      MedicationSupplyItem.validateTotalAmount(_amountController.text);

  bool get _isFormValid => _nameError == null && _amountError == null;

  void _refresh() => setState(() {});

  void _saveChanges() {
    if (!_isFormValid) return;
    if (!mounted) return;

    final updatedItem = widget.item.copyWith(
      name: _nameController.text,
      amount: _amountController.text.toInt,
      genericSupplyType: _genericSupplyType,
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
    _amountController =
        TextEditingController(text: widget.item.amount.toString());
    _nameController = TextEditingController(text: widget.item.name);
    _genericSupplyType = widget.item.genericSupplyType;
    _supplyItemProvider =
        Provider.of<SupplyItemProvider>(context, listen: false);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: t.editItem,
      avatar: _genericSupplyType.icon,
      submitButtonLabel: t.save,
      submitButtonKey: const ValueKey('editGenericItemSave'),
      deleteButtonKey: const ValueKey('editGenericItemDelete'),
      isFormValid: _isFormValid,
      saveChanges: _saveChanges,
      onDelete: _confirmDelete,
      fields: [
        FormTextField(
          controller: _nameController,
          label: t.name,
          fieldKey: const ValueKey('editGenericItemName'),
          onChanged: _refresh,
          inputType: TextInputType.text,
          errorText: _nameError,
        ),
        FormSpacer(),
        FormDropdownField<GenericSupplyType>(
          value: _genericSupplyType,
          items: genericItemTypeDropdownMenuItems(),
          onChanged: (value) {
            if (value == null) return;
            setState(() => _genericSupplyType = value);
          },
          label: t.supplyType,
        ),
        FormTextField(
            controller: _amountController,
            label: t.amount,
            onChanged: _refresh,
            inputType: TextInputType.numberWithOptions(decimal: true),
            errorText: _amountError,
            regexFormatter: RegexPatterns.floatNumber),
      ],
    );
  }
}
