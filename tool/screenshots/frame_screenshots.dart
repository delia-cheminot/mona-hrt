import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/theme/default_color_schemes.dart';

import 'caption_source.dart';
import 'screenshot_fonts.dart';
import 'screenshot_frame.dart';

const String _inputDir = String.fromEnvironment('FRAME_INPUT_DIR');
const String _outputDir = String.fromEnvironment('FRAME_OUTPUT_DIR');
const String _captionsPath = String.fromEnvironment('FRAME_CAPTIONS');

void main() {
  testWidgets('frame every screenshot', (tester) async {
    await tester.runAsync(() => loadScreenshotFonts());

    final input = Directory(_inputDir);
    final files = input
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.png'))
        .toList()
      ..sort((a, b) => a.path.compareTo(b.path));

    final captions =
        (await tester.runAsync(() => loadScreenshotCaptions(_captionsPath)))!;

    await tester.runAsync(() => Directory(_outputDir).create(recursive: true));

    for (final file in files) {
      final name = file.uri.pathSegments.last;
      final stem = name.substring(0, name.length - '.png'.length);
      final bytes = await tester.runAsync(() => file.readAsBytes());

      late ui.Image image;
      await tester.runAsync(() async {
        final codec = await ui.instantiateImageCodec(bytes!);
        image = (await codec.getNextFrame()).image;
      });

      final size = Size(image.width.toDouble(), image.height.toDouble());
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final key = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: key,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ScreenshotFrame(
              image: image,
              caption: captions[stem]!,
              colors: DefaultColorSchemes.light,
              size: size,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final png = await tester.runAsync(() async {
        final boundary =
            key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
        final rendered = await boundary.toImage(pixelRatio: 1.0);
        return rendered.toByteData(format: ui.ImageByteFormat.png);
      });

      await tester.runAsync(
        () => File('$_outputDir/$name').writeAsBytes(png!.buffer.asUint8List()),
      );
      debugPrint('framed $name (${image.width}x${image.height})');
    }

    expect(files, isNotEmpty, reason: 'no PNGs found in $_inputDir');
  });
}
