import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/views/home/settings/schedules/new_schedule_scheduling_page.dart';
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

class NewScheduleMainInfoPage extends StatefulWidget {
  const NewScheduleMainInfoPage({super.key});

  @override
  State<NewScheduleMainInfoPage> createState() =>
      _NewScheduleMainInfoPageState();
}

class _NewScheduleMainInfoPageState extends State<NewScheduleMainInfoPage> {
  late TextEditingController _nameController;
  late TextEditingController _doseController;
  Molecule? _molecule;
  AdministrationRoute? _administrationRoute;
  Ester? _ester;
  late PreferencesService _preferencesService;

  String? get _nameError =>
      MedicationSchedule.validateName(_nameController.text);
  String? get _doseError =>
      MedicationSchedule.validateDose(_doseController.text);
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

  void _next() {
    final name = _nameController.text;
    final Decimal dose = _doseController.text.toDecimal;

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => NewScheduleSchedulingPage(
          name: name,
          dose: dose,
          molecule: _molecule!,
          administrationRoute: _administrationRoute!,
          ester: _ester,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _nameController = TextEditingController();
    _doseController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: t.newSchedule,
      submitButtonLabel: t.next,
      submitButtonKey: const ValueKey('newScheduleNext'),
      isFormValid: _isFormValid,
      saveChanges: _next,
      avatar: Symbols.prescriptions,
      fields: <Widget>[
        FormTextField(
          controller: _nameController,
          label: t.name,
          fieldKey: const ValueKey('newScheduleName'),
          onChanged: _refresh,
          inputType: TextInputType.text,
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
          controller: _doseController,
          label: t.amount,
          fieldKey: const ValueKey('newScheduleAmount'),
          suffixText: _molecule?.localizedUnit,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          regexFormatter: RegexPatterns.floatNumber,
        ),
      ],
    );
  }
}
