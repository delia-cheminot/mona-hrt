import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:mona/controllers/medication_intake_manager.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/generic_supply_item.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/helpers/supply_item_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/forms/form_datetime_field.dart';
import 'package:mona/ui/widgets/forms/form_info_text.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/ui/widgets/intake_supply_picker.dart';
import 'package:mona/ui/widgets/placement_picker.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class EditIntakePage extends StatefulWidget {
  final MedicationIntake intake;

  const EditIntakePage(this.intake, {super.key});

  @override
  State<EditIntakePage> createState() => _EditIntakePageState();
}

class _EditIntakePageState extends State<EditIntakePage> {
  late DateTime _takenDate;
  bool _takenDateChanged = false;
  late TextEditingController _takenDoseController;
  late Decimal _takenDose;
  late Decimal _wastedAmount; // in mL
  late TextEditingController _wastedAmountController;
  late Decimal _deadSpace; // in μL
  late TextEditingController _deadSpaceController;
  List<Placement> _selectedPlacements = [];
  bool _hasInitializedSide = false;
  SupplyItem? _selectedSupplyItem;
  List<GenericSupply> _selectedGenerics = [];
  bool _hasInitializedSupplyItem = false;
  late TextEditingController _notesController;

  String? get _takenDoseError =>
      MedicationIntake.validateDose(_takenDoseController.text);

  String? get _wastedAmountError =>
      MedicationIntake.validateWastedAmount(_wastedAmountController.text);

  String? get _deadSpaceError =>
      MedicationIntake.validateDeadSpace(_deadSpaceController.text);

  bool get _isFormValid => _takenDoseError == null && _deadSpaceError == null;

  bool get _isInjection =>
      widget.intake.administrationRoute == AdministrationRoute.injection;

  void _editIntake(
    MedicationIntakeProvider medicationIntakeProvider,
    SupplyItemProvider supplyItemProvider,
    PreferencesService preferencesService,
    MedicationIntake intake,
  ) async {
    if (!_isFormValid) return;
    if (!mounted) return;

    String timezoneIdentifier = intake.takenTimeZone!;
    if (_takenDateChanged) {
      final TimezoneInfo timezone = await FlutterTimezone.getLocalTimezone();
      timezoneIdentifier = timezone.identifier;
    }

    final String? notes =
        _notesController.text.isEmpty ? null : _notesController.text;

    await MedicationIntakeManager(
            medicationIntakeProvider, supplyItemProvider, preferencesService)
        .editIntake(
      intake,
      takenDose: _takenDose,
      wastedAmount: _wastedAmount,
      deadSpace: _deadSpace,
      takenDateTime: _takenDate.toUtc(),
      takenTimeZone: timezoneIdentifier,
      placements: _selectedPlacements,
      medicationItem: _selectedSupplyItem is MedicationSupplyItem
          ? _selectedSupplyItem as MedicationSupplyItem
          : null,
      genericItems: _selectedGenerics,
      notes: notes,
    );

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _deleteIntake(
    MedicationIntakeProvider medicationIntakeProvider,
    SupplyItemProvider supplyItemProvider,
    PreferencesService preferencesService,
    MedicationIntake intake,
  ) async {
    if (!mounted) return;
    MedicationIntakeManager(
            medicationIntakeProvider, supplyItemProvider, preferencesService)
        .deleteIntake(intake);
    Navigator.of(context).pop();
  }

  void _onPlacementChanged(List<Placement> placements) {
    setState(() {
      _selectedPlacements = placements;
    });
  }

  void _onTakenDateChanged(DateTime date) {
    setState(() {
      _takenDate = date;
      _takenDateChanged = true;
    });
  }

  void _onTakenDoseChanged() {
    final takenDose = _takenDoseController.text.toDecimalOrNull;

    if (takenDose != null) {
      setState(() {
        _takenDose = takenDose;
      });
    } else {
      setState(() {});
    }
  }

  void _onWastedAmountChanged() {
    final wasted = _wastedAmountController.text.toDecimalOrNull;

    if (wasted != null) {
      setState(() {
        _wastedAmount = wasted;
      });
    } else {
      setState(() {});
    }
  }

  void _onDeadSpaceChanged() {
    final deadSpace = _deadSpaceController.text.toDecimalOrNull;

    if (deadSpace != null) {
      setState(() {
        _deadSpace = deadSpace;
      });
    } else {
      setState(() {});
    }
  }

  void _refresh() => setState(() {});

  Future<bool?> confirmDeleteIntake(BuildContext context) {
    return Dialogs.confirmDeleteDialog(context: context, title: t.deleteIntake);
  }

  @override
  void initState() {
    super.initState();
    _takenDate = widget.intake.takenDateTime?.toLocal() ?? DateTime.now();
    _takenDose = widget.intake.takenDose;
    _wastedAmount = widget.intake.wastedAmount ?? Decimal.zero;
    _deadSpace = widget.intake.deadSpace ?? Decimal.zero;
    _takenDoseController = TextEditingController(text: _takenDose.toString());
    _wastedAmountController =
        TextEditingController(text: _wastedAmount.toString());
    _deadSpaceController = TextEditingController(text: _deadSpace.toString());
    _notesController = TextEditingController(text: widget.intake.notes ?? '');
  }

  @override
  void dispose() {
    _takenDoseController.dispose();
    _wastedAmountController.dispose();
    _deadSpaceController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<MedicationIntakeProvider, SupplyItemProvider,
        PreferencesService>(
      builder: (context, medicationIntakeProvider, supplyItemProvider,
          preferencesService, child) {
        final bool isLoading =
            medicationIntakeProvider.isLoading || supplyItemProvider.isLoading;

        if (!isLoading && !_hasInitializedSide && _isInjection) {
          _selectedPlacements = widget.intake.placements;
          _hasInitializedSide = true;
        }

        if (!isLoading && !_hasInitializedSupplyItem) {
          _selectedSupplyItem = supplyItemProvider
              .getItemById(widget.intake.medicationSupplyItemId);
          _selectedGenerics = supplyItemProvider
              .getItemsByIds(widget.intake.genericSupplyItemIds)
              .whereType<GenericSupply>()
              .toList();
          _hasInitializedSupplyItem = true;
        }

        final supplyItemOptions = supplyItemProvider.getItemsForMedication(
          widget.intake.molecule,
          widget.intake.administrationRoute,
          widget.intake.ester,
        );

        return ModelForm(
          title: t.editIntake,
          avatar: widget.intake.administrationRoute.icon,
          submitButtonLabel: t.save,
          submitButtonKey: const ValueKey('editIntakeSave'),
          deleteButtonKey: const ValueKey('editIntakeDelete'),
          isFormValid: _isFormValid,
          saveChanges: (!isLoading && _isFormValid)
              ? () => _editIntake(
                    medicationIntakeProvider,
                    supplyItemProvider,
                    preferencesService,
                    widget.intake,
                  )
              : () {},
          onDelete: () async {
            final confirmed = await confirmDeleteIntake(context);
            if (confirmed == false) return;
            _deleteIntake(
              medicationIntakeProvider,
              supplyItemProvider,
              preferencesService,
              widget.intake,
            );
          },
          fields: [
            FormDateTimeField(
              label: t.date,
              datetime: _takenDate,
              onChanged: _onTakenDateChanged,
            ),
            FormSpacer(),
            FormTextField(
              controller: _takenDoseController,
              label: t.takenAmount,
              onChanged: _onTakenDoseChanged,
              inputType: TextInputType.numberWithOptions(decimal: true),
              suffixText: widget.intake.molecule.localizedUnit,
              errorText: _takenDoseError,
              regexFormatter: RegexPatterns.floatNumber,
            ),
            if (_selectedSupplyItem case final MedicationSupplyItem supplyItem)
              FormInfoText(
                infoText: supplyItem.localizedSupplyAmount(
                  _takenDose,
                  widget.intake.molecule,
                ),
              ),
            FormSpacer(),
            IntakeSupplyPicker(
              medicationItem: _selectedSupplyItem is MedicationSupplyItem
                  ? _selectedSupplyItem as MedicationSupplyItem
                  : null,
              generics: _selectedGenerics,
              medicationOptions: supplyItemOptions,
              genericOptions: supplyItemProvider.genericItems,
              onRemoveMedication: () =>
                  setState(() => _selectedSupplyItem = null),
              onRemoveGenericAt: (index) => setState(() {
                final list = [..._selectedGenerics]..removeAt(index);
                _selectedGenerics = list;
              }),
              onAddMedication: (item) =>
                  setState(() => _selectedSupplyItem = item),
              onAddGeneric: (generic) => setState(
                  () => _selectedGenerics = [..._selectedGenerics, generic]),
            ),
            FormSpacer(),
            if (_isInjection) ...[
              if (preferencesService.placementsList.isNotEmpty) ...[
                PlacementPicker(
                  options: preferencesService.placementsList,
                  selected: _selectedPlacements,
                  onChanged: _onPlacementChanged,
                ),
                FormSpacer(),
              ],
              FormTextField(
                controller: _wastedAmountController,
                label: t.wastedAmount,
                onChanged: _onWastedAmountChanged,
                inputType: TextInputType.numberWithOptions(decimal: true),
                suffixText: t.milliliters,
                errorText: _wastedAmountError,
                regexFormatter: RegexPatterns.floatNumber,
              ),
              FormTextField(
                controller: _deadSpaceController,
                label: t.needleDeadSpace,
                onChanged: _onDeadSpaceChanged,
                inputType: TextInputType.numberWithOptions(decimal: true),
                suffixText: t.microliters,
                errorText: _deadSpaceError,
                regexFormatter: RegexPatterns.floatNumber,
              ),
              FormSpacer(),
            ],
            FormTextField(
              controller: _notesController,
              label: t.notes,
              fieldKey: const ValueKey('editIntakeNotes'),
              onChanged: _refresh,
              inputType: TextInputType.multiline,
              multiline: true,
            )
          ],
        );
      },
    );
  }
}
