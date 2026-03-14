import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/blood_test.dart';

void main() {
  group('BloodTest model', () {
    test('toMap and fromMap should preserve values', () {
      final labDate = DateTime(2025, 3, 14, 6, 7);

      final bloodtest = BloodTest(
          id: 1,
          date: labDate,
          estradiolLevels: Decimal.parse('167.1'),
          testosteroneLevels: Decimal.parse('1.67')); 

      final map = bloodtest.toMap();
      final fromMap = BloodTest.fromMap(map);

      expect(
        fromMap,
        isA<BloodTest>()
            .having((i) => i.id, 'id', bloodtest.id)
            .having((i) => i.date, 'date', bloodtest.date)
            .having((i) => i.estradiolLevels, 'estradiolLevels',
                bloodtest.estradiolLevels)
            .having((i) => i.testosteroneLevels, 'testosteroneLevels',
                bloodtest.testosteroneLevels),
      );
    });
  });
}
