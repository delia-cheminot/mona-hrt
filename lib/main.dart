//
//  ooo        ooooo
//  `88.       .888'
//   888b     d'888   .ooooo.  ooo. .oo.    .oooo.
//   8 Y88. .P  888  d88' `88b `888P"Y88b  `P  )88b
//   8  `888'   888  888   888  888   888   .oP"888
//   8    Y     888  888   888  888   888  d8(  888
//  o8o        o888o `Y8bod8P' o888o o888o `Y888""8o
//

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/data/providers/medication_intake_provider.dart';
import 'package:mona/data/providers/medication_schedule_provider.dart';
import 'package:mona/data/providers/supply_item_provider.dart';
import 'package:mona/i18n/locale_provider.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tzdata.initializeTimeZones();

  final preferencesService = await PreferencesService.init();

  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    ).then((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
      );
    });
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SupplyItemProvider()),
        ChangeNotifierProvider(create: (_) => MedicationIntakeProvider()),
        ChangeNotifierProvider(create: (_) => MedicationScheduleProvider()),
        ChangeNotifierProvider(create: (_) => BloodTestProvider()),
        ChangeNotifierProvider.value(value: preferencesService),
        ChangeNotifierProvider(
            create: (_) => LocaleProvider(preferencesService)),
      ],
      child: const MonaApp(),
    ),
  );
}

//  /|、 meow
//（ﾟ､ ｡ ７
//  l  ~ヽ
//  じしf_,)ノ
