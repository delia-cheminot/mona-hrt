import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/forms/form_datetime_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
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
  late DateTime _testDateTime;
  late BloodTestProvider _bloodTestProvider;
  late PreferencesService _preferencesService;
  bool _dateTimeChanged = false;

  String? get _testDateError => BloodTest.validateDate(_testDateTime);
  String? get _estradiolLevelsError =>
      BloodTest.validateLevel(_estradiolLevelsController.text);
  String? get _testosteroneLevelsError =>
      BloodTest.validateLevel(_testosteroneLevelsController.text);

  bool get _isFormValid => _testDateError == null;

  void _refresh() {
    setState(() {});
  }

  Future<void> _confirmDelete() async {
    final confirmed = await Dialogs.confirmDeleteDialog(
        context: context, title: "Delete this blood test?");

    if (confirmed == true && mounted) {
      _bloodTestProvider.deleteBloodTest(widget.bloodtest);
      Navigator.pop(context);
    }
  }

  void _saveBloodTest() async {
    if (!_isFormValid) return;
    if (!mounted) return;

    final timezone =
        _dateTimeChanged ? await FlutterTimezone.getLocalTimezone() : null;

    final defaultUnits = _preferencesService.units;

    final estradiolLevels = _estradiolLevelsController.text.toDecimalOrNull;
    final estradiolUnit =
        widget.bloodtest.estradiolLevels?.unit ?? defaultUnits.estradiol;
    final testosteroneLevels =
        _testosteroneLevelsController.text.toDecimalOrNull;
    final testosteroneUnit =
        widget.bloodtest.testosteroneLevels?.unit ?? defaultUnits.testosterone;

    final updatedBloodTest = widget.bloodtest.copyWith(
        dateTime: _testDateTime.toUtc(),
        timeZone: timezone?.identifier,
        estradiolLevels: estradiolLevels != null
            ? UnitValue(estradiolLevels, estradiolUnit)
            : null,
        testosteroneLevels: testosteroneLevels != null
            ? UnitValue(testosteroneLevels, testosteroneUnit)
            : null);
    await _bloodTestProvider.updateBloodTest(updatedBloodTest);

    if (!mounted) return;
    Navigator.pop(context, updatedBloodTest);
  }

  @override
  void initState() {
    super.initState();
    _bloodTestProvider = Provider.of<BloodTestProvider>(context, listen: false);
    _preferencesService = Provider.of(context, listen: false);
    _estradiolLevelsController = TextEditingController(
        text: widget.bloodtest.estradiolLevels?.value.toString());
    _testosteroneLevelsController = TextEditingController(
        text: widget.bloodtest.testosteroneLevels?.value.toString());
    _testDateTime = widget.bloodtest.localDateTime;
  }

  @override
  void dispose() {
    _estradiolLevelsController.dispose();
    _testosteroneLevelsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultUnits = _preferencesService.units;
    return ModelForm(
      title: t.editBloodTest,
      submitButtonLabel: t.save,
      isFormValid: _isFormValid,
      saveChanges: _saveBloodTest,
      onDelete: _confirmDelete,
      fields: <Widget>[
        FormTextField(
          controller: _estradiolLevelsController,
          label: t.estradiolLevelLabel,
          errorText: _estradiolLevelsError,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: RegexPatterns.floatNumber,
          suffixText:
              (widget.bloodtest.estradiolLevels?.unit ?? defaultUnits.estradiol)
                  .localizedName,
        ),
        FormTextField(
          controller: _testosteroneLevelsController,
          label: t.testosteroneLevelLabel,
          errorText: _testosteroneLevelsError,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: RegexPatterns.floatNumber,
          suffixText: (widget.bloodtest.testosteroneLevels?.unit ??
                  defaultUnits.testosterone)
              .localizedName,
        ),
        FormSpacer(),
        FormDateTimeField(
          datetime: _testDateTime,
          label: t.bloodTestDateLabel,
          errorText: _testDateError,
          onChanged: (date) => setState(() {
            _testDateTime = date;
            _dateTimeChanged = true;
          }),
        ),
      ],
    );
  }
}
