import 'package:dart_mappable/dart_mappable.dart';

part 'placement.mapper.dart';

@MappableEnum()
enum PlacementPreset {
  left,
  right,
  leftThigh,
  rightThigh,
  leftArm,
  rightArm,
  leftButtock,
  rightButtock,
  leftAbdomen,
  rightAbdomen,
}

@MappableClass(
    discriminatorKey: 'kind',
    includeSubClasses: [PresetPlacement, CustomPlacement])
sealed class Placement with PlacementMappable {
  const Placement();
}

@MappableClass(discriminatorValue: 'preset')
class PresetPlacement extends Placement with PresetPlacementMappable {
  final PlacementPreset preset;

  const PresetPlacement(this.preset);
}

@MappableClass(discriminatorValue: 'custom')
class CustomPlacement extends Placement with CustomPlacementMappable {
  final String label;

  const CustomPlacement(this.label);
}
