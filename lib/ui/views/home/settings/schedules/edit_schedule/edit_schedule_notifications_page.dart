import 'package:flutter/material.dart';
import 'package:mona/data/model/medication_schedule.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:provider/provider.dart';

class EditScheduleNotificationsPage extends StatefulWidget {
  final MedicationSchedule schedule;
  final bool isNewSchedule;

  EditScheduleNotificationsPage(
      {required this.schedule, this.isNewSchedule = false});

  @override
  State<EditScheduleNotificationsPage> createState() =>
      _EditScheduleNotificationsPageState();
}

class _EditScheduleNotificationsPageState
    extends State<EditScheduleNotificationsPage> {
  late List<TimeOfDay> _notificationTimes;
  late MedicationScheduleProvider _medicationScheduleProvider;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _notificationTimes.add(picked);
      });
    }
  }

  void _savechanges() {
    if (!mounted) return;

    final updatedSchedule = widget.schedule.copyWith(
      notificationTimes: _notificationTimes,
    );

    if (widget.isNewSchedule) {
      _medicationScheduleProvider.add(updatedSchedule);
      Navigator.pop(context);
    } else {
      _medicationScheduleProvider.updateSchedule(updatedSchedule);
    }

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _notificationTimes = widget.schedule.notificationTimes.toList();
    _medicationScheduleProvider =
        Provider.of<MedicationScheduleProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final medicationScheduleProvider =
        context.watch<MedicationScheduleProvider>();

    if (medicationScheduleProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Schedule notifications'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule notifications'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: _savechanges,
              child: Text('Save'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickTime,
        tooltip: 'Add a notification',
        child: Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: false,
      body: _notificationTimes.isEmpty
          ? Center(
              child: Padding(
                padding: pagePadding,
                child: Text(
                  'No notifications for ${widget.schedule.name}. You can add one using the Add button.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : SafeArea(
              child: ListView.builder(
                itemCount: _notificationTimes.length,
                itemBuilder: (context, index) {
                  final time = _notificationTimes[index];
                  return ListTile(
                    title: Text(time.format(context)),
                    trailing: Icon(Icons.delete),
                    onTap: () {
                      setState(() {
                        _notificationTimes.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
    );
  }
}
