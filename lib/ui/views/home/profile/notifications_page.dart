import 'package:flutter/material.dart';
import 'package:mona/services/notification_service.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late bool _notificationsEnabled;
  late TimeOfDay _notificationTime;
  late PreferencesService _preferencesService;
  bool _permissionGranted = true;

  @override
  void initState() {
    super.initState();
    _preferencesService =
        Provider.of<PreferencesService>(context, listen: false);
    _notificationsEnabled = _preferencesService.notificationsEnabled;
    _notificationTime = _preferencesService.notificationTime;
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final granted = await NotificationService().hasPermission();
    setState(() {
      _permissionGranted = granted;
    });
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _notificationTime,
    );

    if (picked != null) {
      setState(() {
        _notificationTime = picked;
      });

      await _preferencesService.setNotificationTime(picked);
    }
  }

  Future<void> _toggleNotifications(bool value) async {
    if (value == true) {
      await NotificationService().requestNotificationPermission();
    }

    await _preferencesService.setNotificationsEnabled(value);
    await _checkPermission();

    setState(() {
      _notificationsEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.watch<PreferencesService>().strings;
    return Scaffold(
      appBar: AppBar(title: Text(strings.notifications)),
      body: ListView(
        children: [
          if (_notificationsEnabled && !_permissionGranted)
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(strings.notificationsAreDisabled),
              subtitle: Text(strings.clickToOpenSettings),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
                await openAppSettings();
              },
            ),
          SwitchListTile(
            title: Text(strings.enableNotifications),
            value: _notificationsEnabled,
            onChanged: _toggleNotifications,
          ),
          ListTile(
            title: Text(strings.notificationTime),
            subtitle: Text(_notificationTime.format(context)),
            trailing: const Icon(Icons.access_time),
            onTap: _pickTime,
          ),
        ],
      ),
    );
  }
}
