import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:mona/controllers/medication_intake_manager.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/supply_item.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:mona/ui/widgets/forms/form_date_field.dart';
import 'package:mona/ui/widgets/forms/form_dropdown_field.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:provider/provider.dart';

class TakeMedicationPage extends StatefulWidget {
  final MedicationSchedule schedule;
  final DateTime scheduledDate;

  TakeMedicationPage(this.schedule, this.scheduledDate);

  @override
  State<TakeMedicationPage> createState() => _TakeMedicationPageState();
}

class _TakeMedicationPageState extends State<TakeMedicationPage> {
  late DateTime _takenDate;
  late TextEditingController _takenDoseController;
  late Decimal _takenDose;
  InjectionSide? _selectedSide;
  bool _hasInitializedSide = false;
  SupplyItem? _selectedSupplyItem;
  bool _hasInitializedSupplyItem = false;

  String? get _takenDoseError =>
      MedicationIntake.validateDose(_takenDoseController.text);

  bool get _isFormValid => _takenDoseError == null;

  bool get _isInjection =>
      widget.schedule.administrationRoute == AdministrationRoute.injection;

  void _takeIntake(MedicationIntakeProvider medicationIntakeProvider,
      SupplyItemProvider supplyItemProvider) {
    if (!_isFormValid) return;
    if (!mounted) return;

    MedicationIntakeManager(medicationIntakeProvider, supplyItemProvider)
        .takeMedication(
      dose: _takenDose,
      scheduledDate: widget.scheduledDate,
      takenDate: _takenDate,
      supplyItem: _selectedSupplyItem,
      schedule: widget.schedule,
      side: _selectedSide,
    );

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
    final dose = Decimal.tryParse(
      _takenDoseController.text.replaceAll(',', '.'),
    );
    if (dose != null) {
      setState(() {
        _takenDose = dose;
      });
    }
  }

  void _onSupplyItemChanged(SupplyItem? item) {
    setState(() {
      _selectedSupplyItem = item;
    });
  }

  @override
  void initState() {
    super.initState();
    _takenDate = DateTime.now();
    _takenDose = widget.schedule.dose;
    _takenDoseController =
        TextEditingController(text: widget.schedule.dose.toString());
  }

  @override
  void dispose() {
    _takenDoseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return Consumer2<MedicationIntakeProvider, SupplyItemProvider>(
      builder: (context, medicationIntakeProvider, supplyItemProvider, child) {
        final bool isLoading =
            medicationIntakeProvider.isLoading || supplyItemProvider.isLoading;

        if (!isLoading && !_hasInitializedSide && _isInjection) {
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
        final supplyItemDropdownItems = [
          DropdownMenuItem<SupplyItem?>(
            value: null,
            child: Text(strings.none),
          ),
          ...supplyItemOptions.map(
            (item) => DropdownMenuItem<SupplyItem?>(
              value: item,
              child: Text(item.name),
            ),
          ),
        ];
        final injectionSideItems = InjectionSide.values
            .map((side) => DropdownMenuItem<InjectionSide>(
                  value: side,
                  child: Text(strings.injectionSideName(side.name)),
                ))
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: Text(strings.takeIntake),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormDateField(
                      date: _takenDate,
                      label: strings.date,
                      onChanged: _onTakenDateChanged,
                    ),
                    FormTextField(
                      controller: _takenDoseController,
                      label: strings.amount,
                      onChanged: _onTakenDoseChanged,
                      inputType: TextInputType.number,
                      suffixText: widget.schedule.molecule.unit,
                      errorText: _takenDoseError,
                      regexFormatter: r'[0-9.,]',
                    ),
                    if (_selectedSupplyItem != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  Icons.info_outline,
                                  size: 16,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' $_takenDose ${widget.schedule.molecule.unit} = ${_selectedSupplyItem!.getAmount(_takenDose)} ${_selectedSupplyItem!.administrationRoute.unit}',
                              ),
                            ],
                          ),
                        ),
                      ),
                    FormDropdownField<SupplyItem?>(
                      value: _selectedSupplyItem,
                      items: supplyItemDropdownItems,
                      onChanged: _onSupplyItemChanged,
                      label: strings.supplyItem,
                    ),
                    if (_isInjection)
                      FormDropdownField<InjectionSide>(
                        value: _selectedSide,
                        items: injectionSideItems,
                        onChanged: _onInjectionSideChanged,
                        label: strings.injectionSideLabel,
                      ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: (!isLoading && _isFormValid)
                              ? () => _takeIntake(
                                  medicationIntakeProvider, supplyItemProvider)
                              : null,
                          child: Text(strings.takeIntake),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
