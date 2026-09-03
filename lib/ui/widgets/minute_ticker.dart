import 'dart:async';

import 'package:flutter/widgets.dart';

mixin MinuteTicker<T extends StatefulWidget> on State<T> {
  Timer? _minuteTimer;

  @override
  void initState() {
    super.initState();
    _minuteTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _minuteTimer?.cancel();
    super.dispose();
  }
}
