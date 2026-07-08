import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/extensions/generic_supply_type_icon.dart';
import 'package:mona/ui/widgets/dropdowns/generic_type_dropdown.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class NewGenericItemSpecificsPage extends StatefulWidget {
  final String name;

  const NewGenericItemSpecificsPage({super.key, required this.name});

  @override
  State<NewGenericItemSpecificsPage> createState() =>
      _NewGenericItemSpecificsPageState();
}

class _NewGenericItemSpecificsPageState
    extends State<NewGenericItemSpecificsPage> {
  late TextEditingController _amountController;
  GenericSupplyType? _genericSupplyType;

  String? get _amountError =>
      GenericSupply.validateAmount(_amountController.text);
  String? get _genericSupplyTypeError =>
      _genericSupplyType == null ? t.requiredField : null;

  bool get _isFormValid =>
      _amountError == null && _genericSupplyTypeError == null;

  void _refresh() => setState(() {});

  void _closeAll() {
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  void _addItem() {
    final item = GenericSupply(
      name: widget.name,
      amount: _amountController.text.toInt,
      genericSupplyType: _genericSupplyType!,
    );
    Provider.of<SupplyItemProvider>(context, listen: false).add(item);

    Navigator.of(context)
      ..pop()
      ..pop();
  }

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: widget.name,
      avatar: _genericSupplyType?.icon ?? Symbols.medication,
      submitButtonLabel: t.add,
      submitButtonKey: const ValueKey('newGenericItemAdd'),
      isFormValid: _isFormValid,
      saveChanges: _addItem,
      closeAll: _closeAll,
      fields: [
        FormDropdownField<GenericSupplyType>(
          value: _genericSupplyType,
          items: genericItemTypeDropdownMenuItems(),
          onChanged: (value) => setState(() => _genericSupplyType = value),
          label: t.supplyType,
        ),
        FormTextField(
          controller: _amountController,
          label: t.amount,
          fieldKey: const ValueKey('newGenericItemAmount'),
          onChanged: _refresh,
          inputType: TextInputType.number,
          regexFormatter: RegexPatterns.intNumber,
        ),
      ],
    );
  }
}
