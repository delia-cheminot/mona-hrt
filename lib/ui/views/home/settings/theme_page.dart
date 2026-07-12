import 'package:flutter/material.dart';
import 'package:mona/services/preferences_service.dart';
import 'package:mona/theme/custom_theme_schemes.dart';
import 'package:mona/theme/custom_theme_settings.dart';
import 'package:provider/provider.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = context.watch<PreferencesService>();
    final customTheme = preferences.customTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Thème')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Thème personnalisé'),
            value: preferences.customThemeEnabled,
            onChanged: (v) => preferences.setCustomThemeEnabled(v),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilledButton(
              onPressed: () async {
                await preferences.setCustomTheme(
                  customTheme.copyWith(
                      seedArgb: CustomThemeSchemes.randomSourceArgb()),
                );
              },
              child: const Text('Générer'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Variante M3',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                _VariantGrid(
                  seedArgb: customTheme.seedArgb,
                  selected: customTheme.variant,
                  onChanged: (v) => preferences
                      .setCustomTheme(customTheme.copyWith(variant: v)),
                ),
                const SizedBox(height: 16),
                Text('Contraste',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                SegmentedButton<double>(
                  segments: const [
                    ButtonSegment(
                      value: CustomThemeSettings.contrastStandard,
                      label: Text('Standard'),
                    ),
                    ButtonSegment(
                      value: CustomThemeSettings.contrastMedium,
                      label: Text('Moyen'),
                    ),
                    ButtonSegment(
                      value: CustomThemeSettings.contrastHigh,
                      label: Text('Élevé'),
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
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Source ARGB: 0x'
                  '${customTheme.seedArgb.toRadixString(16).toUpperCase().padLeft(8, '0')}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                _ThemeShowcaseCard(settings: customTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeShowcaseCard extends StatelessWidget {
  const _ThemeShowcaseCard({required this.settings});

  final CustomThemeSettings settings;

  @override
  Widget build(BuildContext context) {
    final schemes = CustomThemeSchemes.fromSettings(settings);
    final scheme = Theme.of(context).brightness == Brightness.dark
        ? schemes.dark
        : schemes.light;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: ThemeData(colorScheme: scheme, useMaterial3: true),
        child: Builder(
          builder: (context) {
            final c = ColorScheme.of(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Material(
                  color: c.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.palette,
                          size: 18,
                          color: c.onPrimaryContainer,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Aperçu thème',
                          style: TextStyle(
                            color: c.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FilledButton(
                        onPressed: () {},
                        child: const Text('Action principale'),
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: c.secondary,
                          foregroundColor: c.onSecondary,
                        ),
                        child: const Text('Action secondaire'),
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: c.tertiary,
                          foregroundColor: c.onTertiary,
                        ),
                        child: const Text('Action tertiaire'),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: c.outlineVariant),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                  child: Text(
                    'Lorem dolor sit, pour voir le texte (onSurface) et les '
                    'lignes sur surface.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: c.onSurfaceVariant),
                  ),
                ),
              ],
            );
          },
        ),
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

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final variant in DynamicSchemeVariant.values)
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
    final scheme = ColorScheme.fromSeed(
      seedColor: Color(seedArgb),
      dynamicSchemeVariant: variant,
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
