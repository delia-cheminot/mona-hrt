import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/mapping_hooks.dart';
import 'package:mona/data/model/placement.dart';

void main() {
  group('JsonStringHook', () {
    const hook = JsonStringHook();

    group('afterEncode collapses a mapper-encoded value to a String', () {
      final object = PresetPlacement(PlacementPreset.left).toMap();
      final list = [
        PresetPlacement(PlacementPreset.left).toMap(),
        CustomPlacement('belly').toMap(),
      ];

      final cases = <(String, Object)>[
        ('single object', object),
        ('list of objects', list),
      ];

      for (final (name, encoded) in cases) {
        test(name, () {
          // Arrange / Act
          final column = hook.afterEncode(encoded);

          // Assert
          expect(column, isA<String>());
        });
      }
    });

    group('beforeDecode round-trips a String column back to real objects', () {
      final object = const PresetPlacement(PlacementPreset.left);
      final list = <Placement>[
        const PresetPlacement(PlacementPreset.left),
        const CustomPlacement('belly'),
      ];

      test('single object', () {
        // Arrange
        final column = hook.afterEncode(object.toMap()) as String;

        // Act
        final decoded = PlacementMapper.fromMap(
            Map<String, dynamic>.from(hook.beforeDecode(column) as Map));

        // Assert
        expect(decoded, object);
      });

      test('list of objects', () {
        // Arrange
        final column =
            hook.afterEncode(list.map((p) => p.toMap()).toList()) as String;

        // Act
        final decoded = (hook.beforeDecode(column) as List)
            .map((e) => PlacementMapper.fromMap(Map<String, dynamic>.from(e)))
            .toList();

        // Assert
        expect(decoded, list);
      });
    });
  });
}
