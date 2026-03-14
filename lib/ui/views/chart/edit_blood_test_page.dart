import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/forms/form_date_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/decimal_helpers.dart';
import 'package:provider/provider.dart';

class EditBloodTestPage extends StatefulWidget {
  final BloodTest bloodtest;
  EditBloodTestPage({required this.bloodtest});

  @override
  State<EditBloodTestPage> createState() => _EditBloodTestPageState();
}

class _EditBloodTestPageState extends State<EditBloodTestPage> {
  late TextEditingController _estradiolLevelsController;
  late TextEditingController _testosteroneLevelsController;
  late DateTime _testDate;
  late BloodTestProvider _bloodTestProvider;

  String? get _testDateError => BloodTest.validateDate(_testDate);
  String? get _estradiolLevelsError =>
      BloodTest.validateLevel(_estradiolLevelsController.text);
  String? get _testosteroneLevelsError =>
      BloodTest.validateLevel(_testosteroneLevelsController.text);

  bool get _isFormValid => _testDateError == null;

  Decimal? _parseOptionalDecimal(String decimalString) {
    final decimal = decimalString.trim();
    if (decimal.isEmpty) return null;
    return parseDecimal(decimal);
  }

  void _refresh() {
    setState(() {});
  }

  Future<void> _confirmDelete() async {
    final confirmed = await Dialogs.confirmDelete(context);

    if (confirmed == true && mounted) {
      _bloodTestProvider.deleteBloodTest(widget.bloodtest);
      Navigator.pop(context);
    }
  }

  void _saveBloodTest() {
    if (!_isFormValid) return;
    if (!mounted) return;

    final updatedBloodTest = widget.bloodtest.copyWith(
      date: _testDate,
      estradiolLevels: _parseOptionalDecimal(_estradiolLevelsController.text),
      testosteroneLevels:
          _parseOptionalDecimal(_testosteroneLevelsController.text),
    );
    _bloodTestProvider.updateBloodTest(updatedBloodTest);

    Navigator.pop(context, updatedBloodTest);
  }

  @override
  void initState() {
    super.initState();
    _bloodTestProvider = Provider.of<BloodTestProvider>(context, listen: false);
    _estradiolLevelsController = TextEditingController(
        text: widget.bloodtest.estradiolLevels?.toString());
    _testosteroneLevelsController = TextEditingController(
        text: widget.bloodtest.testosteroneLevels?.toString());
    _testDate = widget.bloodtest.date;
  }

  @override
  void dispose() {
    _estradiolLevelsController.dispose();
    _testosteroneLevelsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: 'Edit blood test',
      submitButtonLabel: 'Save',
      isFormValid: _isFormValid,
      saveChanges: _saveBloodTest,
      onDelete: _confirmDelete,
      fields: <Widget>[
        FormTextField(
          controller: _estradiolLevelsController,
          label: 'Estradiol levels',
          errorText: _estradiolLevelsError,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: '[0-9.,]',
        ),
        FormSpacer(),
        FormTextField(
          controller: _testosteroneLevelsController,
          label: 'Testosterone levels',
          errorText: _testosteroneLevelsError,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: '[0-9.,]',
        ),
        FormSpacer(),
        FormDateField(
          date: _testDate,
          label: 'Test date',
          errorText: _testDateError,
          onChanged: (date) => setState(() {
            _testDate = date;
          }),
        ),
      ],
    );
  }
}
