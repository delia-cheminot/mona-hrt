///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsPl extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPl(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.pl,
              overrides: overrides ?? {},
              cardinalResolver: cardinalResolver,
              ordinalResolver: ordinalResolver,
            ),
        super(
            cardinalResolver: cardinalResolver,
            ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <pl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsPl _root = this; // ignore: unused_field

  @override
  TranslationsPl $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsPl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Przyjęcia';
  @override
  String get nav_levels => 'Poziomy';
  @override
  String get nav_supplies => 'Zapasy';
  @override
  String get takeAnIntake => 'Odnotuj przyjęcie';
  @override
  String get addAnItem => 'Dodaj przedmiot';
  @override
  String get empty_home => 'Rozpocznij od dodania harmonogramu w Ustawieniach';
  @override
  String get allDone => 'Wszystko gotowe!';
  @override
  String get noIntakesDue => 'Nie ma dziś żadnych przyjęć';
  @override
  String get upcoming => 'Nadchodzące';
  @override
  String get taken => 'Zażyte';
}

/// The flat map containing all translations for locale <pl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPl {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'nav_home' => 'Mona',
      'nav_intakes' => 'Przyjęcia',
      'nav_levels' => 'Poziomy',
      'nav_supplies' => 'Zapasy',
      'takeAnIntake' => 'Odnotuj przyjęcie',
      'addAnItem' => 'Dodaj przedmiot',
      'empty_home' => 'Rozpocznij od dodania harmonogramu w Ustawieniach',
      'allDone' => 'Wszystko gotowe!',
      'noIntakesDue' => 'Nie ma dziś żadnych przyjęć',
      'upcoming' => 'Nadchodzące',
      'taken' => 'Zażyte',
      _ => null,
    };
  }
}
