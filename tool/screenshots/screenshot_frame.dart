import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ScreenshotFrame extends StatelessWidget {
  const ScreenshotFrame({
    super.key,
    required this.image,
    required this.caption,
    required this.colors,
    required this.size,
  });

  final ui.Image image;
  final String caption;
  final ColorScheme colors;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final bandHeight = size.height * 0.18;
    final padX = size.width * 0.08;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: ColoredBox(
        color: colors.surfaceContainerHighest,
        child: Column(
          children: [
            SizedBox(
              height: bandHeight,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: padX),
                  child: Text(
                    caption,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'ScreenshotCaption',
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.05,
                      height: 1.2,
                      color: colors.onSurface,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(padX, 0, padX, size.height * 0.06),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: image.width / image.height,
                    child: _bezel(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bezel() {
    final radius = size.width * 0.11;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: ColoredBox(
        color: colors.surfaceContainerLow,
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.015),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius * 0.85),
            child: RawImage(image: image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
