import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/supplies/new_generic_item_specifics_page.dart';
import 'package:mona/ui/views/supplies/new_medication_item_specifics_page.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';

enum _ItemType { medication, genericSupply }

class NewItemPage extends StatefulWidget {
  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  late TextEditingController _nameController;
  _ItemType _type = _ItemType.medication;

  String? get _nameError => SupplyItem.validateName(_nameController.text);

  bool get _isFormValid => _nameError == null;

  void _refresh() => setState(() {});

  void _next() {
    final name = _nameController.text;

    final route = switch (_type) {
      _ItemType.medication => MaterialPageRoute<void>(
          builder: (context) => NewMedicationItemSpecificsPage(name: name),
        ),
      _ItemType.genericSupply => MaterialPageRoute<void>(
          builder: (context) => NewGenericItemSpecificsPage(name: name),
        ),
    };
    Navigator.of(context).push(route);
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: t.newItem,
      avatar: Symbols.medication,
      submitButtonLabel: t.next,
      submitButtonKey: const ValueKey('newItemNext'),
      isFormValid: _isFormValid,
      saveChanges: _next,
      fields: [
        FormTextField(
          controller: _nameController,
          label: t.name,
          fieldKey: const ValueKey('newItemName'),
          onChanged: _refresh,
          inputType: TextInputType.text,
        ),
        FormSpacer(),
        _typeToggle(context),
      ],
    );
  }

  Widget _typeToggle(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: M3EToggleButtonGroup(
        type: M3EButtonGroupType.standard,
        size: M3EButtonSize.md,
        decoration: M3EToggleButtonDecoration.styleFrom(
          haptic: M3EHapticFeedback.light,
        ),
        selectedIndex: _type.index,
        onSelectedIndexChanged: (index) {
          if (index == null) return;
          setState(() {
            _type = _ItemType.values[index];
          });
        },
        actions: [
          M3EToggleButtonGroupAction(
              label: Text(t.medicationItemType,
                  key: const ValueKey('newItemTypeMedication'))),
          M3EToggleButtonGroupAction(
              label: Text(t.genericItemType,
                  key: const ValueKey('newItemTypeGeneric'))),
        ],
      ),
    );
  }
}
