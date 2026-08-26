import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

part 'administration_route.mapper.dart';

@MappableEnum()
enum AdministrationRoute {
  injection(unit: 'mL', icon: Symbols.syringe_rounded),
  oral(unit: 'pill', icon: Symbols.pill_rounded),
  sublingual(unit: 'pill', icon: Symbols.pill_rounded),
  patch(unit: 'patch', icon: Symbols.sticker_rounded),
  gel(unit: 'pump', icon: Symbols.sanitizer_rounded),
  implant(unit: 'implant', icon: Symbols.syringe_rounded),
  suppository(unit: 'suppository', icon: Symbols.pill_rounded),
  transdermalSpray(unit: 'spray', icon: Symbols.fragrance_rounded),
  transdermalDrops(unit: 'mL', icon: Symbols.colorize_rounded);

  const AdministrationRoute({
    required this.unit,
    required this.icon,
  });

  final String unit;
  final IconData icon;
}
