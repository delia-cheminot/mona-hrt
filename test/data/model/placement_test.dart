import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/placement.dart';

void main() {
  group('Placement', () {
    group('value equality', () {
      final cases = <(String, Placement, Placement, bool)>[
        (
          'same preset is equal',
          const PresetPlacement(PlacementPreset.left),
          const PresetPlacement(PlacementPreset.left),
          true,
        ),
        (
          'different presets are not equal',
          const PresetPlacement(PlacementPreset.left),
          const PresetPlacement(PlacementPreset.right),
          false,
        ),
        (
          'preset and custom are not equal',
          const PresetPlacement(PlacementPreset.left),
          const CustomPlacement('left'),
          false,
        ),
        (
          'same custom label is equal',
          const CustomPlacement('thigh'),
          const CustomPlacement('thigh'),
          true,
        ),
      ];

      for (final (name, a, b, expected) in cases) {
        test(name, () {
          // Arrange / Act
          final result = a == b;

          // Assert
          expect(result, expected);
        });
      }
    });
  });
}
