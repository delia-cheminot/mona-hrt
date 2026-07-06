import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mona/controllers/medication_intake_manager.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/medication_supply_item.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/helpers/molecule_l10n.dart';
import 'package:mona/i18n/helpers/supply_item_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/widgets/dropdowns/injection_side_dropdown.dart';
import 'package:mona/ui/widgets/forms/form_datetime_field.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_info_text.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class TakeMedicationPage extends StatefulWidget {
  final MedicationSchedule schedule;

  final TimeOfDay? scheduledTime;

  TakeMedicationPage(this.schedule, {this.scheduledTime});

  @override
  State<TakeMedicationPage> createState() => _TakeMedicationPageState();
}

class _TakeMedicationPageState extends State<TakeMedicationPage> {
  late DateTime _takenDate;
  late TextEditingController _takenDoseController;
  late Decimal _takenDose;
  late TextEditingController _wastedAmountController;
  late Decimal _wastedAmount;
  InjectionSide? _selectedSide;
  bool _hasInitializedSide = false;
  SupplyItem? _selectedSupplyItem;
  bool _hasInitializedSupplyItem = false;
  late TextEditingController _deadSpaceController;
  Decimal? _deadSpace;
  late TextEditingController _notesController;
  bool _isTaken = false;

  String? get _takenDoseError =>
      MedicationIntake.validateDose(_takenDoseController.text);

  String? get _wastedAmountError =>
      MedicationIntake.validateWastedAmount(_wastedAmountController.text);

  String? get _deadSpaceError =>
      MedicationIntake.validateDeadSpace(_deadSpaceController.text);

  bool get _isFormValid => _takenDoseError == null && _deadSpaceError == null;

  void _takeIntake(MedicationIntakeProvider medicationIntakeProvider,
      SupplyItemProvider supplyItemProvider) async {
    if (!_isFormValid || !mounted || _isTaken) return;

    final String? notes =
        _notesController.text.isEmpty ? null : _notesController.text;

    MedicationIntakeManager(medicationIntakeProvider, supplyItemProvider)
        .takeMedication(
            takenDose: _takenDose,
            scheduledTime: widget.scheduledTime,
            takenDateTime: _takenDate.toUtc(),
            supplyItem: _selectedSupplyItem,
            schedule: widget.schedule,
            side: _selectedSide,
            deadSpace: _deadSpace,
            notes: notes,
            wastedAmount: _wastedAmount);

    setState(() {
      _isTaken = true;
    });

    HapticFeedback.lightImpact();
    await Future.delayed(const Duration(milliseconds: 120));
    HapticFeedback.lightImpact();

    await Future.delayed(const Duration(milliseconds: 880));

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _onInjectionSideChanged(InjectionSide? side) {
    if (side != null) {
      setState(() {
        _selectedSide = side;
      });
    }
  }

  void _onTakenDateChanged(DateTime date) {
    setState(() {
      _takenDate = date;
    });
  }

  void _onTakenDoseChanged() {
    final takenDose = _takenDoseController.text.toDecimalOrNull;

    if (takenDose != null) {
      setState(() {
        _takenDose = takenDose;
      });
    }
  }

  void _onDeadSpaceChanged() {
    final deadSpace = _deadSpaceController.text.toDecimalOrNull;

    if (deadSpace != null) {
      setState(() {
        _deadSpace = deadSpace;
      });
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

  void _onSupplyItemChanged(SupplyItem? item) {
    setState(() {
      _selectedSupplyItem = item;
    });
  }

  void _refresh() => setState(() {});

  @override
  void initState() {
    super.initState();
    _takenDate = DateTime.now();
    _takenDose = widget.schedule.dose;
    _wastedAmount = Decimal.zero;
    _takenDoseController =
        TextEditingController(text: widget.schedule.dose.toString());
    _wastedAmountController = TextEditingController(text: '0');
    _deadSpaceController = TextEditingController(text: '0');
    _notesController = TextEditingController();
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
    final bool isInjection =
        widget.schedule.administrationRoute == AdministrationRoute.injection;

    return Consumer2<MedicationIntakeProvider, SupplyItemProvider>(
      builder: (context, medicationIntakeProvider, supplyItemProvider, child) {
        final bool isLoading =
            medicationIntakeProvider.isLoading || supplyItemProvider.isLoading;

        if (!isLoading && !_hasInitializedSide && isInjection) {
          _selectedSide = MedicationIntakeManager(
            medicationIntakeProvider,
            supplyItemProvider,
          ).getNextSide();
          _hasInitializedSide = true;
        }

        if (!isLoading && !_hasInitializedSupplyItem) {
          _selectedSupplyItem = supplyItemProvider.getMostUsedItemForMedication(
            widget.schedule.molecule,
            widget.schedule.administrationRoute,
            widget.schedule.ester,
          );
          _hasInitializedSupplyItem = true;
        }

        final supplyItemOptions = supplyItemProvider.getItemsForMedication(
          widget.schedule.molecule,
          widget.schedule.administrationRoute,
          widget.schedule.ester,
        );

        if (_selectedSupplyItem != null) {
          final selectedId = _selectedSupplyItem!.id;
          _selectedSupplyItem = supplyItemOptions
              .cast<SupplyItem?>()
              .firstWhere((item) => item?.id == selectedId, orElse: () => null);
        }

        final supplyItemDropdownItems = [
          DropdownMenuItem<SupplyItem?>(
            value: null,
            child: Text(t.none),
          ),
          ...supplyItemOptions.map(
            (item) => DropdownMenuItem<SupplyItem?>(
              value: item,
              child: Text(item.name),
            ),
          ),
        ];

        return ModelForm(
          title: t.takeMedication(scheduleName: widget.schedule.name),
          avatar: widget.schedule.administrationRoute.icon,
          submitButtonLabel: _isTaken ? t.intakeRecorded : t.takeIntake,
          submitButtonIcon: _isTaken ? Icons.check_circle : null,
          submitButtonKey: const ValueKey('takeIntakeSubmit'),
          isFormValid: _isFormValid,
          saveChanges: (!isLoading && _isFormValid && !_isTaken)
              ? () => _takeIntake(medicationIntakeProvider, supplyItemProvider)
              : () {},
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
                suffixText: widget.schedule.molecule.localizedUnit,
                errorText: _takenDoseError,
                regexFormatter: RegexPatterns.floatNumber),
            if (_selectedSupplyItem case final MedicationSupplyItem supplyItem)
              FormInfoText(
                infoText: supplyItem.localizedSupplyAmount(
                  _takenDose,
                  widget.schedule.molecule,
                ),
              ),
            FormSpacer(),
            FormDropdownField<SupplyItem?>(
              value: _selectedSupplyItem,
              items: supplyItemDropdownItems,
              onChanged: _onSupplyItemChanged,
              label: t.supplyItem,
            ),
            if (isInjection) ...[
              FormDropdownField<InjectionSide>(
                value: _selectedSide,
                items: injectionSideDropdownMenuItems(),
                onChanged: _onInjectionSideChanged,
                label: t.injectionSide,
              ),
              FormTextField(
                  controller: _wastedAmountController,
                  label: t.wastedAmount,
                  onChanged: _onWastedAmountChanged,
                  inputType: TextInputType.numberWithOptions(decimal: true),
                  suffixText: t.milliliters,
                  errorText: _wastedAmountError,
                  regexFormatter: RegexPatterns.floatNumber),
              FormTextField(
                  controller: _deadSpaceController,
                  label: t.needleDeadSpace,
                  onChanged: _onDeadSpaceChanged,
                  inputType: TextInputType.numberWithOptions(decimal: true),
                  suffixText: t.microliters,
                  errorText: _deadSpaceError,
                  regexFormatter: RegexPatterns.floatNumber),
            ],
            FormSpacer(),
            FormTextField(
              controller: _notesController,
              label: t.notes,
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
