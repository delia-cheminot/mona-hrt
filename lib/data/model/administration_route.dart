import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class AdministrationRoute {
  final String name;
  final String unit;
  final IconData icon;

  const AdministrationRoute({
    required this.name,
    required this.unit,
    required this.icon,
  });

  static const injection = AdministrationRoute(
    name: 'injection',
    unit: 'mL',
    icon: Symbols.syringe,
  );
  static const oral = AdministrationRoute(
    name: 'oral',
    unit: 'pill',
    icon: Symbols.pill,
  );
  static const sublingual = AdministrationRoute(
    name: 'sublingual',
    unit: 'pill',
    icon: Symbols.pill,
  );
  static const patch = AdministrationRoute(
    name: 'patch',
    unit: 'patch',
    icon: Symbols.sticker,
  );
  static const gel = AdministrationRoute(
    name: 'gel',
    unit: 'pump',
    icon: Symbols.sanitizer,
  );
  static const implant = AdministrationRoute(
    name: 'implant',
    unit: 'implant',
    icon: Symbols.syringe,
  );
  static const suppository = AdministrationRoute(
    name: 'suppository',
    unit: 'suppository',
    icon: Symbols.pill,
  );
  static const transdermalSpray = AdministrationRoute(
    name: 'transdermal spray',
    unit: 'spray',
    icon: Symbols.fragrance,
  );
  static const transdermalDrops = AdministrationRoute(
    name: 'transdermal drops',
    unit: 'mL',
    icon: Symbols.colorize,
  );

  static const List<AdministrationRoute> all = [
    injection,
    oral,
    sublingual,
    patch,
    gel,
    implant,
    suppository,
    transdermalSpray,
    transdermalDrops,
  ];

  static AdministrationRoute fromName(String name) {
    return all.firstWhere((route) => route.name == name);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdministrationRoute && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
