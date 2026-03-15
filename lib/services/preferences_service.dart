import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/l10n/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends ChangeNotifier {
  static const _notificationHourKey = 'notification_hour';
  static const _notificationMinuteKey = 'notification_minute';
  static const _notificationsEnabledKey = 'notifications_enabled';
  static const _customMoleculesKey = 'custom_molecules';
  static const _localeKey = 'app_locale';

  static const int defaultHour = 18;
  static const int defaultMinute = 0;
  static const bool defaultNotificationsEnabled = false;

  late final SharedPreferences _prefs;

  PreferencesService._(this._prefs);

  TimeOfDay get notificationTime => TimeOfDay(
        hour: _prefs.getInt(_notificationHourKey) ?? defaultHour,
        minute: _prefs.getInt(_notificationMinuteKey) ?? defaultMinute,
      );

  bool get notificationsEnabled =>
      _prefs.getBool(_notificationsEnabledKey) ?? defaultNotificationsEnabled;

  Future<void> setNotificationTime(TimeOfDay time) async {
    await _prefs.setInt(_notificationHourKey, time.hour);
    await _prefs.setInt(_notificationMinuteKey, time.minute);
    notifyListeners();
  }

  Future<void> setNotificationsEnabled(bool isEnabled) async {
    await _prefs.setBool(_notificationsEnabledKey, isEnabled);
    notifyListeners();
  }

  String get languageCode => _prefs.getString(_localeKey) ?? 'en';

  Future<void> setLanguageCode(String code) async {
    await _prefs.setString(_localeKey, code);
    notifyListeners();
  }

  AppStrings get strings => AppStrings(languageCode);

  List<Molecule> get customMolecules {
    final jsonString = _prefs.getString(_customMoleculesKey);
    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded
        .map((e) => Molecule.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  List<Molecule> get allMolecules {
    const builtIn = KnownMolecules.all;
    final custom = customMolecules;
    final Map<String, Molecule> map = {};

    for (final m in [...builtIn, ...custom]) {
      map[m.normalizedName] = m; // remove duplicates
    }

    return map.values.toList();
  }

  List<DropdownMenuItem<Molecule>> get moleculeDropdownItems => allMolecules
      .map(
        (molecule) => DropdownMenuItem<Molecule>(
          value: molecule,
          child: Text(
            molecule.name[0].toUpperCase() + molecule.name.substring(1),
          ),
        ),
      )
      .toList();

  Future<void> addCustomMolecule(Molecule molecule) async {
    final existing = customMolecules;

    if (allMolecules.any((m) => m.normalizedName == molecule.normalizedName)) {
      return;
    }

    final updated = [...existing, molecule];
    final jsonString = jsonEncode(updated.map((m) => m.toJson()).toList());

    await _prefs.setString(_customMoleculesKey, jsonString);
    notifyListeners();
  }

  Future<void> removeCustomMolecule(String name) async {
    final updated = customMolecules
        .where((m) => m.normalizedName != name.trim().toLowerCase())
        .toList();

    final jsonString = jsonEncode(updated.map((m) => m.toJson()).toList());

    await _prefs.setString(_customMoleculesKey, jsonString);
    notifyListeners();
  }

  static Future<PreferencesService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService._(prefs);
  }
}
