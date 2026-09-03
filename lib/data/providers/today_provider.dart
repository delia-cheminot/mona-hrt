import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/widgets.dart';
import 'package:mona/data/model/date.dart';

class TodayProvider extends ChangeNotifier with WidgetsBindingObserver {
  Date _today = Date.today();
  Timer? _dayChangeTimer;

  TodayProvider() {
    WidgetsBinding.instance.addObserver(this);
    _scheduleDayChange();
  }

  Date get today => _today;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refresh();
      _scheduleDayChange();
    } else if (state == AppLifecycleState.paused) {
      _dayChangeTimer?.cancel();
    }
  }

  void _refresh() {
    final current = Date.today();
    if (current != _today) {
      _today = current;
      notifyListeners();
    }
  }

  void _scheduleDayChange() {
    _dayChangeTimer?.cancel();
    final now = clock.now();
    final delay = _nextDayChange(now).difference(now) +
        const Duration(seconds: 1); // 1 second of slack to avoid race condition
    _dayChangeTimer = Timer(delay, () {
      _refresh();
      _scheduleDayChange();
    });
  }

  DateTime _nextDayChange(DateTime now) {
    final startHour = logicalDayStartMinutes ~/ 60;
    final startMinute = logicalDayStartMinutes % 60;
    final dayChange =
        DateTime(now.year, now.month, now.day, startHour, startMinute);
    return dayChange.isAfter(now)
        ? dayChange
        : dayChange.add(const Duration(days: 1));
  }

  @override
  void dispose() {
    _dayChangeTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
