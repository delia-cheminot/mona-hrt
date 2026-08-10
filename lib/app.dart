import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mona/controllers/notification_planner.dart';
import 'package:mona/controllers/notification_scheduler.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/distribution.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/locale_provider.dart';
import 'package:mona/i18n/tok_localizations.dart';
import 'package:mona/services/hrt_widget_service.dart';
import 'package:mona/services/next_dose_widget_service.dart';
import 'package:mona/services/notification_service.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/services/recent_intakes_widget_service.dart';
import 'package:mona/services/widget_theme_service.dart';
import 'package:mona/theme/app_theme_controller.dart';
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
  late MedicationIntakeProvider _medicationIntakeProvider;
  late PreferencesService _preferencesService;
  late NotificationScheduler _notificationScheduler;
  late HrtWidgetService _hrtWidgetService;
  late NextDoseWidgetService _nextDoseWidgetService;
  late RecentIntakesWidgetService _recentIntakesWidgetService;
  final WidgetThemeService _widgetThemeService = WidgetThemeService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _lastTimeZone = DateTime.now().timeZoneOffset.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService().initialize();
      if (!mounted) return;
      _medicationScheduleProvider = context.read<MedicationScheduleProvider>();
      _medicationIntakeProvider = context.read<MedicationIntakeProvider>();
      _preferencesService = context.read<PreferencesService>();
      _notificationScheduler = NotificationScheduler(
        NotificationPlanner(
            _medicationIntakeProvider, _medicationScheduleProvider),
        _preferencesService,
      );
      _hrtWidgetService = HrtWidgetService(
        medicationIntakeProvider: _medicationIntakeProvider,
        preferencesService: _preferencesService,
      );
      _nextDoseWidgetService = NextDoseWidgetService(
        medicationIntakeProvider: _medicationIntakeProvider,
        medicationScheduleProvider: _medicationScheduleProvider,
      );
      _recentIntakesWidgetService = RecentIntakesWidgetService(
        medicationIntakeProvider: _medicationIntakeProvider,
      );
      _medicationScheduleProvider.addListener(_regenerateNotifications);
      _medicationIntakeProvider.addListener(_regenerateNotifications);
      _preferencesService.addListener(_regenerateNotifications);
      _medicationIntakeProvider.addListener(_updateHomeWidgets);
      _preferencesService.addListener(_updateHomeWidgets);
      _medicationScheduleProvider.addListener(_updateHomeWidgets);
      _regenerateNotifications();
      _updateHomeWidgets();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _medicationScheduleProvider.removeListener(_regenerateNotifications);
    _medicationIntakeProvider.removeListener(_regenerateNotifications);
    _preferencesService.removeListener(_regenerateNotifications);
    _medicationIntakeProvider.removeListener(_updateHomeWidgets);
    _preferencesService.removeListener(_updateHomeWidgets);
    _medicationScheduleProvider.removeListener(_updateHomeWidgets);
    super.dispose();
  }

  void _regenerateNotifications() {
    if (!mounted) return;

    final locale = context.read<LocaleProvider>().locale;
    _notificationScheduler.regenerateAll(locale.intlLanguageTag);
  }

  void _updateHomeWidgets() {
    _hrtWidgetService.sync();
    _nextDoseWidgetService.sync();
    _recentIntakesWidgetService.sync();
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
    context.watch<AppThemeProvider>();
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final themes = context.read<AppThemeProvider>().buildThemeData(
              systemLight: lightDynamic,
              systemDark: darkDynamic,
            );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _widgetThemeService.sync(
            light: themes.theme.colorScheme,
            dark: themes.darkTheme.colorScheme,
          );
        });

        return MaterialApp(
          title: 'Mona',
          locale: context.watch<LocaleProvider>().locale,
          supportedLocales: context.watch<LocaleProvider>().supportedLocales,
          localizationsDelegates: const [
            TokMaterialLocalizationsDelegate(),
            TokCupertinoLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: themes.theme,
          darkTheme: themes.darkTheme,
          themeMode: ThemeMode.system,
          builder: (context, child) =>
              _BottomInsetClamp(child: child ?? const SizedBox.shrink()),
          home: const MainPage(),
        );
      },
    );
  }
}

class _BottomInsetClamp extends StatelessWidget {
  final Widget child;

  const _BottomInsetClamp({required this.child});

  @override
  Widget build(BuildContext context) {
    if (!isIosLiquidGlass) return child;

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: child,
    );
  }
}
