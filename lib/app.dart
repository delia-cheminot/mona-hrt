import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mona/controllers/notification_scheduler.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';
import 'ui/views/main_page.dart';

class MonaApp extends StatefulWidget {
  const MonaApp({super.key});

  @override
  State<MonaApp> createState() => _MonaAppState();
}

class _MonaAppState extends State<MonaApp> with WidgetsBindingObserver {
  String? _lastTimeZone;
  late MedicationScheduleProvider _medicationScheduleProvider;
  late PreferencesService _preferencesService;

  ColorScheme _getLightColorScheme(ColorScheme? lightDynamic) {
    return lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.deepPurple);
  }

  ColorScheme _getDarkColorScheme(ColorScheme? darkDynamic) {
    return darkDynamic ??
        ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _lastTimeZone = DateTime.now().timeZoneOffset.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _medicationScheduleProvider = context.read<MedicationScheduleProvider>();
      _preferencesService = context.read<PreferencesService>();
      _medicationScheduleProvider.addListener(_regenerateNotifications);
      _preferencesService.addListener(_regenerateNotifications);
      _regenerateNotifications();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _medicationScheduleProvider.removeListener(_regenerateNotifications);
    _preferencesService.removeListener(_regenerateNotifications);
    super.dispose();
  }

  void _regenerateNotifications() {
    NotificationScheduler(_medicationScheduleProvider, _preferencesService)
        .regenerateAll();
  }

  void _checkTimezoneChange() {
    final currentTimezone = DateTime.now().timeZoneOffset.toString();
    if (_lastTimeZone != currentTimezone) {
      _lastTimeZone = currentTimezone;
      _regenerateNotifications();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkTimezoneChange();
    }
  }

  @override
  Widget build(BuildContext context) {
    final preferencesService = context.watch<PreferencesService>();
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final lightColorScheme = _getLightColorScheme(lightDynamic);
        final darkColorScheme = _getDarkColorScheme(darkDynamic);

        return MaterialApp(
          title: 'Mona',
          locale: Locale(preferencesService.languageCode),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('hi'),
            Locale('ml'),
          ],
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          themeMode: ThemeMode.system,
          home: MainPage(),
        );
      },
    );
  }
}
