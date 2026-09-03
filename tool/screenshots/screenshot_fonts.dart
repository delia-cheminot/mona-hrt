import 'dart:io';

import 'package:flutter/services.dart' show FontLoader;

Future<void> loadScreenshotFonts() async {
  final bytes =
      await File('tool/screenshots/fonts/Roboto-SemiBold.ttf').readAsBytes();
  final loader = FontLoader('ScreenshotCaption')
    ..addFont(Future.value(bytes.buffer.asByteData()));
  await loader.load();
}
