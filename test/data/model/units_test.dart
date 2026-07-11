import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/units.dart';

void main() {
  group('UnitValue', () {
    test('estradiol converts same does not change value', () {
      final value = UnitValue(200.toDecimal(), EstradiolUnit.pg_mL);
      final converted = value.inUnit(EstradiolUnit.pg_mL);

      expect(converted, 200.toDecimal());
    });

    test('estradiol converts from pg/mL to pmol/L', () {
      final value = UnitValue(200.toDecimal(), EstradiolUnit.pg_mL);
      final converted = value.inUnit(EstradiolUnit.pmol_L);

      expect(converted, Decimal.parse('734.20'));
    });

    test('estradiol converts from pmol/L to pg/mL', () {
      final value = UnitValue(700.toDecimal(), EstradiolUnit.pmol_L);
      final converted = value.inUnit(EstradiolUnit.pg_mL);

      expect(converted, Decimal.parse('190.68'));
    });

    test('testosterone converts same does not change value', () {
      final value = UnitValue(250.toDecimal(), TestosteroneUnit.ng_dL);
      final converted = value.inUnit(TestosteroneUnit.ng_dL);

      expect(converted, 250.toDecimal());
    });

    test('testosterone converts from ng/dL to nmol/L', () {
      final value = UnitValue(250.toDecimal(), TestosteroneUnit.ng_dL);
      final converted = value.inUnit(TestosteroneUnit.nmol_L);

      expect(converted, Decimal.parse('8.66'));
    });

    test('testosterone converts from nmol/L to ng/dL', () {
      final value = UnitValue(8.toDecimal(), TestosteroneUnit.nmol_L);
      final converted = value.inUnit(TestosteroneUnit.ng_dL);

      expect(converted, Decimal.parse('230.72'));
    });
  });
}
