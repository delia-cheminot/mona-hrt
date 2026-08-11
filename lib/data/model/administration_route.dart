import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

part 'administration_route.mapper.dart';

@MappableEnum()
enum AdministrationRoute {
  injection(unit: 'mL', icon: Symbols.syringe),
  oral(unit: 'pill', icon: Symbols.pill),
  sublingual(unit: 'pill', icon: Symbols.pill),
  patch(unit: 'patch', icon: Symbols.sticker),
  gel(unit: 'pump', icon: Symbols.sanitizer),
  implant(unit: 'implant', icon: Symbols.syringe),
  suppository(unit: 'suppository', icon: Symbols.pill),
  transdermalSpray(unit: 'spray', icon: Symbols.fragrance),
  transdermalDrops(unit: 'mL', icon: Symbols.colorize);

  const AdministrationRoute({
    required this.unit,
    required this.icon,
  });

  final String unit;
  final IconData icon;
}
