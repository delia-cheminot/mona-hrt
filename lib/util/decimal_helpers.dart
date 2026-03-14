import 'package:decimal/decimal.dart';

Decimal parseDecimal(String text) {
  final sanitizedText = text.replaceAll(',', '.');
  return Decimal.parse(sanitizedText);
}

Decimal? parseOptionalDecimal(String decimalString) {
  final decimal = decimalString.trim();
  if (decimal.isEmpty) return null;
  return parseDecimal(decimal);
}
