import 'package:mona/data/model/placement.dart';
import 'package:mona/i18n/translations.g.dart';

extension PlacementPresetL10n on PlacementPreset {
  String get localizedName => switch (this) {
        PlacementPreset.left => t.placementLeft,
        PlacementPreset.right => t.placementRight,
        PlacementPreset.leftThigh => t.placementLeftThigh,
        PlacementPreset.rightThigh => t.placementRightThigh,
        PlacementPreset.leftArm => t.placementLeftArm,
        PlacementPreset.rightArm => t.placementRightArm,
        PlacementPreset.leftButtock => t.placementLeftButtock,
        PlacementPreset.rightButtock => t.placementRightButtock,
        PlacementPreset.leftAbdomen => t.placementLeftAbdomen,
        PlacementPreset.rightAbdomen => t.placementRightAbdomen,
      };
}

extension PlacementL10n on Placement {
  String get localizedName => switch (this) {
        PresetPlacement(:final preset) => preset.localizedName,
        CustomPlacement(:final label) => label,
      };
}
