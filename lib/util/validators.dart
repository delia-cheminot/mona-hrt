import 'package:decimal/decimal.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/util/string_parsing.dart';

String? strictlyPositiveDecimal(String? value) {
  if (value.isEmpty) return null;

  return value.toDecimalOrZero <= Decimal.zero ? t.mustBePositiveNumber : null;
}

String? positiveDecimal(String? value) {
  if (value.isEmpty) return null;

  return (!value.isDecimal || value.toDecimalOrZero < Decimal.zero)
      ? t.mustBePositiveNumber
      : null;
}

String? positiveInt(String? value) {
  if (value.isEmpty) return null;

  return value.toIntOrZero <= 0 ? t.mustBePositiveNumber : null;
}

String? requiredString(String? value) => value.isEmpty ? t.requiredField : null;

String? requiredDateTime(DateTime? value) =>
    value == null ? t.requiredField : null;

String? requiredDate(Date? value) => value == null ? t.requiredField : null;

String? requiredStrictlyPositiveDecimal(String? value) =>
    requiredString(value) ?? strictlyPositiveDecimal(value);

String? requiredPositiveDecimal(String? value) =>
    requiredString(value) ?? positiveDecimal(value);

String? requiredPositiveInt(String? value) =>
    requiredString(value) ?? positiveInt(value);

String? requiredMolecule(Molecule? value) =>
    value == null ? t.requiredField : null;

String? requiredAdministrationRoute(AdministrationRoute? value) =>
    value == null ? t.requiredField : null;

String? requiredList<T>(List<T> value) =>
    value.isEmpty ? t.requiredField : null;
