import 'package:flutter/material.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/theme/custom_theme_schemes.dart';
import 'package:mona/theme/custom_theme_settings.dart';
import 'package:mona/ui/constants/dimensions.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = context.watch<PreferencesService>();
    final customTheme = preferences.customTheme;

    return Scaffold(
      appBar: AppBar(title: Text(t.theme)),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(t.customThemeEnabled),
            value: preferences.customThemeEnabled,
            onChanged: (v) => preferences.setCustomThemeEnabled(v),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: pagePadding,
            child: FilledButton(
              onPressed: () async {
                await preferences.setCustomTheme(
                  customTheme.copyWith(
                      seedArgb: CustomThemeSchemes.randomSourceArgb()),
                );
              },
              child: Text(t.themeGenerate),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(t.themeVariant,
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                _VariantGrid(
                  seedArgb: customTheme.seedArgb,
                  selected: customTheme.variant,
                  onChanged: (v) => preferences
                      .setCustomTheme(customTheme.copyWith(variant: v)),
                ),
                const SizedBox(height: 16),
                Text(t.themeContrast,
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                SegmentedButton<double>(
                  segments: [
                    ButtonSegment(
                      value: CustomThemeSettings.contrastStandard,
                      label: Text(t.themeContrastStandard),
                    ),
                    ButtonSegment(
                      value: CustomThemeSettings.contrastMedium,
                      label: Text(t.themeContrastMedium),
                    ),
                    ButtonSegment(
                      value: CustomThemeSettings.contrastHigh,
                      label: Text(t.themeContrastHigh),
                    ),
                  ],
                  selected: {customTheme.contrastLevel},
                  onSelectionChanged: (selection) {
                    preferences.setCustomTheme(
                      customTheme.copyWith(contrastLevel: selection.first),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VariantGrid extends StatelessWidget {
  const _VariantGrid({
    required this.seedArgb,
    required this.selected,
    required this.onChanged,
  });

  final int seedArgb;
  final DynamicSchemeVariant selected;
  final ValueChanged<DynamicSchemeVariant> onChanged;

  static const _spec2025Variants = [
    DynamicSchemeVariant.tonalSpot,
    DynamicSchemeVariant.vibrant,
    DynamicSchemeVariant.expressive,
    DynamicSchemeVariant.neutral,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final variant in _spec2025Variants)
          _VariantSwatch(
            seedArgb: seedArgb,
            variant: variant,
            isSelected: variant == selected,
            onTap: () => onChanged(variant),
          ),
      ],
    );
  }
}

class _VariantSwatch extends StatelessWidget {
  const _VariantSwatch({
    required this.seedArgb,
    required this.variant,
    required this.isSelected,
    required this.onTap,
  });

  final int seedArgb;
  final DynamicSchemeVariant variant;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _size = 48;

  @override
  Widget build(BuildContext context) {
    final scheme = CustomThemeSchemes.schemeFor(
      seedArgb: seedArgb,
      variant: variant,
      contrastLevel: CustomThemeSettings.contrastStandard,
      brightness: Theme.of(context).brightness,
    );

    final borderColor = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.outlineVariant;

    return Container(
      width: _size + 8,
      height: _size + 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: isSelected ? 2.5 : 1.5,
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: CustomPaint(
            painter: _QuadrantPainter(
              topLeft: scheme.primary,
              topRight: scheme.primaryContainer,
              bottomLeft: scheme.secondary,
              bottomRight: scheme.tertiary,
            ),
          ),
        ),
      ),
    );
  }
}

class _QuadrantPainter extends CustomPainter {
  const _QuadrantPainter({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  final Color topLeft;
  final Color topRight;
  final Color bottomLeft;
  final Color bottomRight;

  @override
  void paint(Canvas canvas, Size size) {
    final half = size.width / 2;
    final paint = Paint()..style = PaintingStyle.fill;

    paint.color = topLeft;
    canvas.drawRect(Rect.fromLTWH(0, 0, half, half), paint);

    paint.color = topRight;
    canvas.drawRect(Rect.fromLTWH(half, 0, half, half), paint);

    paint.color = bottomLeft;
    canvas.drawRect(Rect.fromLTWH(0, half, half, half), paint);

    paint.color = bottomRight;
    canvas.drawRect(Rect.fromLTWH(half, half, half, half), paint);
  }

  @override
  bool shouldRepaint(_QuadrantPainter old) =>
      old.topLeft != topLeft ||
      old.topRight != topRight ||
      old.bottomLeft != bottomLeft ||
      old.bottomRight != bottomRight;
}
