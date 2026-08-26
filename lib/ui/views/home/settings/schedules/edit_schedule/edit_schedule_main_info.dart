import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/helpers/medication_schedule_l10n.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/views/home/settings/schedules/edit_schedule/edit_schedule_scheduling_page.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/dropdowns/administration_route_dropdown.dart';
import 'package:mona/ui/widgets/dropdowns/ester_dropdown.dart';
import 'package:mona/ui/widgets/dropdowns/molecule_dropdown.dart';
import 'package:mona/ui/widgets/forms/form_date_field.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class EditScheduleMainInfoPage extends StatefulWidget {
  final MedicationSchedule schedule;

  EditScheduleMainInfoPage({required this.schedule});

  @override
  State<EditScheduleMainInfoPage> createState() =>
      _EditScheduleMainInfoPageState();
}

class _EditScheduleMainInfoPageState extends State<EditScheduleMainInfoPage> {
  late TextEditingController _nameController;
  late TextEditingController _doseController;
  late Molecule _molecule;
  late AdministrationRoute _administrationRoute;
  late Ester? _ester;
  late Date _startDate;
  late PreferencesService _preferencesService;
  late MedicationScheduleProvider _medicationScheduleProvider;

  String? get _nameError =>
      MedicationSchedule.validateName(_nameController.text);
  String? get _doseError =>
      MedicationSchedule.validateDose(_doseController.text);
  String? get _moleculeError => MedicationSchedule.validateMolecule(_molecule);
  String? get _administrationRouteError =>
      MedicationSchedule.validateAdministrationRoute(_administrationRoute);
  String? get _startDateError =>
      MedicationSchedule.validateStartDate(_startDate);
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
      _esterError == null &&
      _startDateError == null;

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

  void _saveSchedule() {
    if (!_isFormValid) return;
    if (!mounted) return;

    final originalSchedule =
        _medicationScheduleProvider.getScheduleById(widget.schedule.id) ??
            widget.schedule;
    final updatedSchedule = originalSchedule.copyWith(
      name: _nameController.text,
      dose: _doseController.text.toDecimal,
      molecule: _molecule,
      administrationRoute: _administrationRoute,
      ester: _useEsterField ? _ester : null,
      startDate: _startDate,
    );
    _medicationScheduleProvider.updateSchedule(updatedSchedule);

    Navigator.pop(context, updatedSchedule);
  }

  Future<void> _confirmDelete() async {
    final confirmed = await Dialogs.confirmDeleteDialog(
      context: context,
      title: t.deleteSchedule(name: widget.schedule.name),
    );

    if (confirmed == true && mounted) {
      _medicationScheduleProvider.deleteSchedule(widget.schedule);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _medicationScheduleProvider =
        Provider.of<MedicationScheduleProvider>(context, listen: false);
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _nameController = TextEditingController(text: widget.schedule.name);
    _doseController =
        TextEditingController(text: widget.schedule.dose.toString());
    _molecule = widget.schedule.molecule;
    _administrationRoute = widget.schedule.administrationRoute;
    _ester = widget.schedule.ester;
    _startDate = widget.schedule.startDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentSchedule = context
            .watch<MedicationScheduleProvider>()
            .getScheduleById(widget.schedule.id) ??
        widget.schedule;

    return ModelForm(
      title: t.editSchedule,
      submitButtonLabel: t.save,
      submitButtonKey: const ValueKey('editScheduleSave'),
      deleteButtonKey: const ValueKey('editScheduleDelete'),
      isFormValid: _isFormValid,
      saveChanges: _saveSchedule,
      onDelete: _confirmDelete,
      fields: [
        FormTextField(
          controller: _nameController,
          label: t.name,
          fieldKey: const ValueKey('editScheduleName'),
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
        FormTextField(
          controller: _doseController,
          label: t.amount,
          onChanged: _refresh,
          inputType: TextInputType.numberWithOptions(decimal: true),
          suffixText: _molecule.localizedUnit,
          errorText: _doseError,
          regexFormatter: RegexPatterns.floatNumber,
        ),
        FormSpacer(),
        FormDateField(
          date: _startDate,
          label: t.startDate,
          errorText: _startDateError,
          onChanged: (date) => setState(() => _startDate = date),
        ),
        FormSpacer(),
        M3ECardColumn(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 8),
          children: [
            ListTile(
              key: const ValueKey('editScheduleSchedulingTile'),
              title: Text(t.scheduling),
              subtitle: Text(currentSchedule.localizedFrequency),
              leading: Icon(Symbols.event_repeat_rounded),
              trailing: Icon(Symbols.chevron_right_rounded),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (context) => EditScheduleSchedulingPage(
                    schedule: currentSchedule,
                  ),
                ));
              },
            ),
          ],
        ),
      ],
    );
  }
}
