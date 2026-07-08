import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/forms/form_datetime_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class NewBloodTestPage extends StatefulWidget {
  @override
  State<NewBloodTestPage> createState() => _NewBloodTestPageState();
}

class _NewBloodTestPageState extends State<NewBloodTestPage> {
  late TextEditingController _estradiolLevelsController;
  late TextEditingController _testosteroneLevelsController;
  late DateTime _testDateTime;
  late PreferencesService _preferencesService;

  String? get _testDateError => BloodTest.validateDate(_testDateTime);

  String? get _estradiolError =>
      BloodTest.validateLevel(_estradiolLevelsController.text);

  String? get _testosteroneError =>
      BloodTest.validateLevel(_testosteroneLevelsController.text);

  bool get _isFormValid =>
      _testDateError == null &&
      _estradiolError == null &&
      _testosteroneError == null;

  void _refresh() {
    setState(() {});
  }

  void _onDateTimeChanged(DateTime dateTime) {
    setState(() {
      _testDateTime = dateTime;
    });
  }

  void _addBloodTest() async {
    final bloodTestProvider =
        Provider.of<BloodTestProvider>(context, listen: false);
    final estradiolLevels = _estradiolLevelsController.text.toDecimalOrNull;
    final testosteroneLevels =
        _testosteroneLevelsController.text.toDecimalOrNull;
    final timezone = await FlutterTimezone.getLocalTimezone();
    final tzName = timezone.identifier;
    final units = _preferencesService.units;

    final bloodtest = BloodTest(
      dateTime: _testDateTime.toUtc(),
      timeZone: tzName,
      estradiolLevels: estradiolLevels != null
          ? UnitValue(estradiolLevels, units.estradiol)
          : null,
      testosteroneLevels: testosteroneLevels != null
          ? UnitValue(testosteroneLevels, units.testosterone)
          : null,
    );
    await bloodTestProvider.add(bloodtest);

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _estradiolLevelsController = TextEditingController();
    _testosteroneLevelsController = TextEditingController();
    _testDateTime = DateTime.now();
    _preferencesService = Provider.of(context, listen: false);
  }

  @override
  void dispose() {
    _estradiolLevelsController.dispose();
    _testosteroneLevelsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final units = _preferencesService.units;
    return ModelForm(
      title: t.newBloodTest,
      submitButtonLabel: t.add,
      isFormValid: _isFormValid,
      saveChanges: _addBloodTest,
      fields: <Widget>[
        FormTextField(
          controller: _estradiolLevelsController,
          label: t.estradiolLevelLabel,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: RegexPatterns.floatNumber,
          errorText: _estradiolError,
          suffixText: units.estradiol.localizedName,
        ),
        FormTextField(
          controller: _testosteroneLevelsController,
          label: t.testosteroneLevelLabel,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: RegexPatterns.floatNumber,
          errorText: _testosteroneError,
          suffixText: units.testosterone.localizedName,
        ),
        FormSpacer(),
        FormDateTimeField(
          datetime: _testDateTime,
          label: t.bloodTestDateLabel,
          errorText: _testDateError,
          onChanged: _onDateTimeChanged,
        ),
      ],
    );
  }
}
