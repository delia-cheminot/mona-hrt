import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/ester.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/widgets/forms/form_date_field.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/ui/widgets/time_list_card.dart';
import 'package:mona/ui/widgets/weekday_picker.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

enum _ScheduleType { daily, intervalDays, weekly }

class NewScheduleSchedulingPage extends StatefulWidget {
  final String name;
  final Decimal dose;
  final Molecule molecule;
  final AdministrationRoute administrationRoute;
  final Ester? ester;

  const NewScheduleSchedulingPage({
    super.key,
    required this.name,
    required this.dose,
    required this.molecule,
    required this.administrationRoute,
    this.ester,
  });

  @override
  State<NewScheduleSchedulingPage> createState() =>
      _NewScheduleSchedulingPageState();
}

class _NewScheduleSchedulingPageState extends State<NewScheduleSchedulingPage> {
  _ScheduleType _type = _ScheduleType.daily;

  late TextEditingController _intervalDaysController;
  final List<TimeOfDay> _intakeOrNotificationTimes = [];
  bool _dailyNotify = true;
  final List<int> _weeklyDays = [];
  late Date _startDate;

  String? get _intervalDaysError =>
      IntervalDaysSchedule.validateIntervalDays(_intervalDaysController.text);
  String? get _startDateError =>
      MedicationSchedule.validateStartDate(_startDate);
  String? get _dailyIntakeTimesError =>
      DailySchedule.validateIntakeTimes(_intakeOrNotificationTimes);
  String? get _weeklyDaysError =>
      WeeklySchedule.validateDaysOfWeek(_weeklyDays);

  bool get _isFormValid {
    if (_startDateError != null) return false;
    return switch (_type) {
      _ScheduleType.intervalDays => _intervalDaysError == null,
      _ScheduleType.daily => _dailyIntakeTimesError == null,
      _ScheduleType.weekly => _weeklyDaysError == null,
    };
  }

  void _refresh() => setState(() {});

  void _closeAll() {
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  Future<void> _addTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked == null) return;

    final alreadyExists = _intakeOrNotificationTimes
        .any((t) => t.hour == picked.hour && t.minute == picked.minute);
    if (alreadyExists) return;

    setState(() {
      _intakeOrNotificationTimes.add(picked);
      _sortTimes();
    });
  }

  Future<void> _editTime(int index) async {
    final current = _intakeOrNotificationTimes[index];
    final picked = await showTimePicker(
      context: context,
      initialTime: current,
    );
    if (picked == null) return;
    if (picked.hour == current.hour && picked.minute == current.minute) return;

    final isDuplicate = _intakeOrNotificationTimes
        .any((t) => t.hour == picked.hour && t.minute == picked.minute);
    if (isDuplicate) return;

    setState(() {
      _intakeOrNotificationTimes[index] = picked;
      _sortTimes();
    });
  }

  void _sortTimes() {
    _intakeOrNotificationTimes.sort((a, b) {
      final hourCompare = a.hour.compareTo(b.hour);
      return hourCompare != 0 ? hourCompare : a.minute.compareTo(b.minute);
    });
  }

  void _save() {
    if (!_isFormValid) return;

    final SchedulingStrategy scheduling = switch (_type) {
      _ScheduleType.intervalDays => IntervalDaysSchedule(
          intervalDays: _intervalDaysController.text.toInt,
          notificationTimes: List.unmodifiable(_intakeOrNotificationTimes),
        ),
      _ScheduleType.daily => DailySchedule(
          intakeTimes: List.unmodifiable(_intakeOrNotificationTimes),
          notify: _dailyNotify,
        ),
      _ScheduleType.weekly => WeeklySchedule(
          daysOfWeek: List.unmodifiable(_weeklyDays),
          notificationTimes: List.unmodifiable(_intakeOrNotificationTimes),
        ),
    };

    final schedule = MedicationSchedule(
      name: widget.name,
      dose: widget.dose,
      scheduling: scheduling,
      startDate: _startDate,
      molecule: widget.molecule,
      administrationRoute: widget.administrationRoute,
      ester: widget.ester,
    );

    Provider.of<MedicationScheduleProvider>(context, listen: false)
        .add(schedule);

    Navigator.of(context)
      ..pop()
      ..pop();
  }

  @override
  void initState() {
    super.initState();
    _intervalDaysController = TextEditingController();
    _startDate = Date.today();
  }

  @override
  void dispose() {
    _intervalDaysController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: widget.name,
      submitButtonLabel: t.save,
      submitButtonKey: const ValueKey('newScheduleSave'),
      isFormValid: _isFormValid,
      saveChanges: _save,
      closeAll: _closeAll,
      fields: <Widget>[
        _typeToggle(),
        FormSpacer(),
        ...switch (_type) {
          _ScheduleType.intervalDays => _intervalDaysSpecifics(),
          _ScheduleType.daily => _dailySpecifics(),
          _ScheduleType.weekly => _weeklySpecifics(),
        },
        FormSpacer(),
        FormDateField(
          date: _startDate,
          label: t.startDate,
          errorText: _startDateError,
          onChanged: (date) => setState(() {
            _startDate = date;
          }),
        ),
      ],
    );
  }

  Widget _typeToggle() {
    return M3EToggleButtonGroup(
      type: M3EButtonGroupType.standard,
      size: M3EButtonSize.md,
      selectedIndex: _type.index,
      onSelectedIndexChanged: (index) {
        if (index == null) return;
        setState(() {
          _type = _ScheduleType.values[index];
        });
      },
      actions: [
        M3EToggleButtonGroupAction(label: Text(t.scheduleFrequencyDaily)),
        M3EToggleButtonGroupAction(
          label: Text(
            t.scheduleFrequencyInterval,
            key: const ValueKey('scheduleTypeInterval'),
          ),
        ),
        M3EToggleButtonGroupAction(label: Text(t.scheduleFrequencyWeekly)),
      ],
    );
  }

  List<Widget> _intervalDaysSpecifics() {
    return [
      FormTextField(
        controller: _intervalDaysController,
        label: t.every,
        fieldKey: const ValueKey('newScheduleEvery'),
        suffixText: t.days,
        onChanged: _refresh,
        inputType: TextInputType.number,
        regexFormatter: RegexPatterns.intNumber,
      ),
      FormSpacer(),
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: Icons.alarm,
        addLabel: t.addNotification,
        onAdd: _addTime,
        onEdit: _editTime,
        onDelete: _deleteTime,
      ),
    ];
  }

  List<Widget> _dailySpecifics() {
    return [
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: widget.administrationRoute.icon,
        addLabel: t.addIntakeTime,
        addTileKey: const ValueKey('addNotificationTile'),
        onAdd: _addTime,
        onEdit: _editTime,
        onDelete: _deleteTime,
        trailingChildren: [
          SwitchListTile(
            title: Text(t.enableNotifications),
            subtitle: Text(t.enableNotificationsDescription),
            value: _dailyNotify,
            onChanged: (value) => setState(() => _dailyNotify = value),
          ),
        ],
      ),
    ];
  }

  List<Widget> _weeklySpecifics() {
    return [
      WeekdayPicker(
        selectedDays: _weeklyDays,
        onDayToggled: _toggleWeeklyDay,
      ),
      FormSpacer(),
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: widget.administrationRoute.icon,
        addLabel: t.addNotification,
        onAdd: _addTime,
        onEdit: _editTime,
        onDelete: _deleteTime,
      ),
    ];
  }

  void _toggleWeeklyDay(int day, bool selected) {
    setState(() {
      if (selected) {
        _weeklyDays.add(day);
      } else {
        _weeklyDays.remove(day);
      }
    });
  }

  void _deleteTime(int index) {
    setState(() {
      _intakeOrNotificationTimes.removeAt(index);
    });
  }
}
