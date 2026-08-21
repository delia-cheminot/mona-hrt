import 'package:flutter/material.dart';
import 'package:m3e_core/m3e_core.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/model/scheduling_strategy.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/widgets/forms/form_spacer.dart';
import 'package:mona/ui/widgets/forms/form_text_field.dart';
import 'package:mona/ui/widgets/forms/model_form.dart';
import 'package:mona/ui/widgets/scheduling_type_picker.dart';
import 'package:mona/ui/widgets/time_list_card.dart';
import 'package:mona/ui/widgets/weekday_picker.dart';
import 'package:mona/util/regex_patterns.dart';
import 'package:mona/util/string_parsing.dart';
import 'package:provider/provider.dart';

class EditScheduleSchedulingPage extends StatefulWidget {
  final MedicationSchedule schedule;

  const EditScheduleSchedulingPage({super.key, required this.schedule});

  @override
  State<EditScheduleSchedulingPage> createState() =>
      _EditScheduleSchedulingPageState();
}

class _EditScheduleSchedulingPageState
    extends State<EditScheduleSchedulingPage> {
  late SchedulingType _type;

  late TextEditingController _intervalDaysController;
  late TextEditingController _monthlyDayController;
  late TextEditingController _monthlyIntervalController;
  final List<TimeOfDay> _intakeOrNotificationTimes = [];
  bool _dailyNotify = true;
  bool _anchorToLastIntake = false;
  final List<int> _weeklyDays = [];

  late MedicationScheduleProvider _medicationScheduleProvider;

  String? get _intervalDaysError =>
      IntervalDaysSchedule.validateIntervalDays(_intervalDaysController.text);
  String? get _dailyIntakeTimesError =>
      DailySchedule.validateIntakeTimes(_intakeOrNotificationTimes);
  String? get _weeklyDaysError =>
      WeeklySchedule.validateDaysOfWeek(_weeklyDays);
  String? get _monthlyDayError =>
      MonthlySchedule.validateDayOfMonth(_monthlyDayController.text);
  String? get _monthlyIntervalError =>
      MonthlySchedule.validateIntervalMonths(_monthlyIntervalController.text);

  bool get _isFormValid {
    return switch (_type) {
      SchedulingType.intervalDays => _intervalDaysError == null,
      SchedulingType.daily => _dailyIntakeTimesError == null,
      SchedulingType.weekly => _weeklyDaysError == null,
      SchedulingType.monthly =>
        _monthlyDayError == null && _monthlyIntervalError == null,
      SchedulingType.asNeeded => true,
    };
  }

  void _refresh() => setState(() {});

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
    if (!mounted) return;

    final SchedulingStrategy scheduling = switch (_type) {
      SchedulingType.intervalDays => _anchorToLastIntake
          ? DynamicIntervalSchedule(
              intervalDays: _intervalDaysController.text.toInt,
              notificationTimes: List.unmodifiable(_intakeOrNotificationTimes),
            )
          : IntervalDaysSchedule(
              intervalDays: _intervalDaysController.text.toInt,
              notificationTimes: List.unmodifiable(_intakeOrNotificationTimes),
            ),
      SchedulingType.daily => DailySchedule(
          intakeTimes: List.unmodifiable(_intakeOrNotificationTimes),
          notify: _dailyNotify,
        ),
      SchedulingType.weekly => WeeklySchedule(
          daysOfWeek: List.unmodifiable(_weeklyDays),
          notificationTimes: List.unmodifiable(_intakeOrNotificationTimes),
        ),
      SchedulingType.monthly => MonthlySchedule(
          dayOfMonth: _monthlyDayController.text.toInt,
          intervalMonths: _monthlyIntervalController.text.toInt,
          notificationTimes: List.unmodifiable(_intakeOrNotificationTimes),
        ),
      SchedulingType.asNeeded => AsNeededSchedule(),
    };

    final updatedSchedule = widget.schedule.copyWith(
      scheduling: scheduling,
    );

    _medicationScheduleProvider.updateSchedule(updatedSchedule);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _medicationScheduleProvider =
        Provider.of<MedicationScheduleProvider>(context, listen: false);

    _intervalDaysController = TextEditingController();
    _monthlyDayController = TextEditingController();
    _monthlyIntervalController = TextEditingController(text: '1');
    final scheduling = widget.schedule.scheduling;
    _type = scheduling.type;
    switch (scheduling) {
      case IntervalDaysSchedule(:final intervalDays, :final notificationTimes):
        _intervalDaysController.text = intervalDays.toString();
        _intakeOrNotificationTimes.addAll(notificationTimes);
      case DynamicIntervalSchedule(
          :final intervalDays,
          :final notificationTimes
        ):
        _anchorToLastIntake = true;
        _intervalDaysController.text = intervalDays.toString();
        _intakeOrNotificationTimes.addAll(notificationTimes);
      case DailySchedule(:final intakeTimes, :final notify):
        _intakeOrNotificationTimes.addAll(intakeTimes);
        _dailyNotify = notify;
      case WeeklySchedule(:final daysOfWeek, :final notificationTimes):
        _weeklyDays.addAll(daysOfWeek);
        _intakeOrNotificationTimes.addAll(notificationTimes);
      case MonthlySchedule(
          :final dayOfMonth,
          :final intervalMonths,
          :final notificationTimes
        ):
        _monthlyDayController.text = dayOfMonth.toString();
        _monthlyIntervalController.text = intervalMonths.toString();
        _intakeOrNotificationTimes.addAll(notificationTimes);
      case AsNeededSchedule():
        break;
    }
    _sortTimes();
  }

  @override
  void dispose() {
    _intervalDaysController.dispose();
    _monthlyDayController.dispose();
    _monthlyIntervalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModelForm(
      title: widget.schedule.name,
      submitButtonLabel: t.save,
      isFormValid: _isFormValid,
      saveChanges: _save,
      fields: <Widget>[
        SchedulingTypePicker(
          value: _type,
          onChanged: (type) => setState(() => _type = type),
        ),
        FormSpacer(),
        ...switch (_type) {
          SchedulingType.intervalDays => _intervalDaysSpecifics(),
          SchedulingType.daily => _dailySpecifics(),
          SchedulingType.weekly => _weeklySpecifics(),
          SchedulingType.monthly => _monthlySpecifics(),
          SchedulingType.asNeeded => [],
        },
      ],
    );
  }

  List<Widget> _intervalDaysSpecifics() {
    return [
      FormTextField(
        controller: _intervalDaysController,
        label: t.every,
        suffixText: t.days,
        onChanged: _refresh,
        inputType: TextInputType.number,
        regexFormatter: RegexPatterns.intNumber,
      ),
      M3ECardColumn(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.symmetric(vertical: 8),
        children: [
          SwitchListTile(
            title: Text(t.anchorToLastIntake),
            subtitle: Text(t.anchorToLastIntakeDescription),
            value: _anchorToLastIntake,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onChanged: (value) => setState(() => _anchorToLastIntake = value),
          ),
        ],
      ),
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: Symbols.notifications_rounded,
        addLabel: t.addNotification,
        onAdd: _addTime,
        onEdit: _editTime,
        onDelete: _deleteTime,
      ),
      FormSpacer(),
    ];
  }

  List<Widget> _dailySpecifics() {
    return [
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: widget.schedule.administrationRoute.icon,
        addLabel: t.addIntakeTime,
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
      FormSpacer(),
    ];
  }

  List<Widget> _weeklySpecifics() {
    return [
      WeekdayPicker(
        selectedDays: _weeklyDays,
        errorText: _weeklyDaysError,
        onDayToggled: _toggleWeeklyDay,
      ),
      FormSpacer(),
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: Symbols.notifications_rounded,
        addLabel: t.addNotification,
        onAdd: _addTime,
        onEdit: _editTime,
        onDelete: _deleteTime,
      ),
      FormSpacer(),
    ];
  }

  List<Widget> _monthlySpecifics() {
    return [
      FormTextField(
        controller: _monthlyDayController,
        label: t.dayOfMonth,
        errorText: _monthlyDayError,
        onChanged: _refresh,
        inputType: TextInputType.number,
        regexFormatter: RegexPatterns.intNumber,
      ),
      FormSpacer(),
      FormTextField(
        controller: _monthlyIntervalController,
        label: t.every,
        suffixText: t.months,
        errorText: _monthlyIntervalError,
        onChanged: _refresh,
        inputType: TextInputType.number,
        regexFormatter: RegexPatterns.intNumber,
      ),
      FormSpacer(),
      TimeListCard(
        times: _intakeOrNotificationTimes,
        rowIcon: Symbols.notifications_rounded,
        addLabel: t.addNotification,
        onAdd: _addTime,
        onEdit: _editTime,
        onDelete: _deleteTime,
      ),
      FormSpacer(),
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
