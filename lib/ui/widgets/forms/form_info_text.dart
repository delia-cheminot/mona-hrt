import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class FormInfoText extends StatelessWidget {
  final String infoText;

  const FormInfoText({required this.infoText, super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.onSurface;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Symbols.info_rounded,
                size: 16,
                color: color,
              ),
            ),
            TextSpan(
              text: infoText,
            ),
          ],
        ),
      ),
    );
  }
}
