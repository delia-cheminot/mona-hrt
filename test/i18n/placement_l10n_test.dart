import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/placement.dart';
import 'package:mona/i18n/helpers/placement_l10n.dart';
import 'package:mona/i18n/translations.g.dart';

void main() {
  group('PlacementL10n', () {
    test('preset placement is translated', () {
      // Arrange
      const placement = PresetPlacement(PlacementPreset.left);

      // Act
      final label = placement.localizedName;

      // Assert
      expect(label, t.placementLeft);
    });

    test('custom placement is shown verbatim', () {
      // Arrange
      const placement = CustomPlacement('belly button');

      // Act
      final label = placement.localizedName;

      // Assert
      expect(label, 'belly button');
    });
  });
}
