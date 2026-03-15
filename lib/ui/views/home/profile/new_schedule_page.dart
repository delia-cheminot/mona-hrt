import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/forms/form_date_field.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/decimal_helpers.dart';
import 'package:provider/provider.dart';

class NewSchedulePage extends StatefulWidget {
  @override
  State<NewSchedulePage> createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  late TextEditingController _nameController;
  late TextEditingController _doseController;
  late TextEditingController _intervalDaysController;
  late DateTime _startDate;
  Molecule? _molecule;
  AdministrationRoute? _administrationRoute;
  Ester? _ester;
  late PreferencesService _preferencesService;

  String? get _nameError =>
      MedicationSchedule.validateName(_nameController.text);
  String? get _doseError =>
      MedicationSchedule.validateDose(_doseController.text);
  String? get _intervalDaysError =>
      MedicationSchedule.validateIntervalDays(_intervalDaysController.text);
  String? get _startDateError =>
      MedicationSchedule.validateStartDate(_startDate);
  String? get _moleculeError => MedicationSchedule.validateMolecule(_molecule);
  String? get _administrationRouteError =>
      MedicationSchedule.validateAdministrationRoute(_administrationRoute);
  String? get _esterError {
    final validator =
        MedicationSchedule.esterValidator(_molecule, _administrationRoute);
    return validator(_ester);
  }

  bool get _isFormValid =>
      _nameError == null &&
      _doseError == null &&
      _intervalDaysError == null &&
      _startDateError == null &&
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

  void _addSchedule() {
    final name = _nameController.text;
    final dose = parseDecimal(_doseController.text);
    final intervalDays = int.parse(_intervalDaysController.text);
    final medicationScheduleProvider =
        Provider.of<MedicationScheduleProvider>(context, listen: false);

    final schedule = MedicationSchedule(
      name: name,
      dose: dose,
      intervalDays: intervalDays,
      startDate: _startDate,
      molecule: _molecule!,
      administrationRoute: _administrationRoute!,
      ester: _ester,
    );
    medicationScheduleProvider.add(schedule);

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _nameController = TextEditingController();
    _doseController = TextEditingController();
    _intervalDaysController = TextEditingController();
    _startDate = DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _intervalDaysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return ModelForm(
      title: strings.newSchedule,
      submitButtonLabel: strings.add,
      isFormValid: _isFormValid,
      saveChanges: _addSchedule,
      fields: <Widget>[
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
          controller: _doseController,
          label: strings.amount,
          suffixText: _molecule?.unit,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: '[0-9.,]',
        ),
        FormTextField(
          controller: _intervalDaysController,
          label: strings.every,
          suffixText: strings.days,
          onChanged: _refresh,
          inputType: TextInputType.number,
          regexFormatter: '[0-9]',
        ),
        FormDateField(
          date: _startDate,
          label: strings.startDate,
          errorText: _startDateError,
          onChanged: (date) => setState(() {
            _startDate = date;
          }),
        ),
      ],
    );
  }
}
