import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'generic_repository_mock.dart';

void main(){
  late BloodTestProvider provider;
  late GenericRepositoryMock<BloodTest> repo;

  setUp(() {
    repo = GenericRepositoryMock<BloodTest>(
      withId: (i, id) => BloodTest(
          id: id,
          date: i.date,
          estradiolLevels: i.estradiolLevels,
          testosteroneLevels: i.testosteroneLevels),
    );
    provider = BloodTestProvider(repository: repo);
    repo.insert(BloodTest(
      id: 1,
      date: DateTime(2025, 3, 14, 6, 7),
      estradiolLevels: Decimal.parse('167.1'),
      testosteroneLevels: Decimal.parse('1.67'),
    ));
    repo.insert(BloodTest(
      id: 2,
      date: DateTime(2025, 4, 24, 2, 4),
      estradiolLevels: Decimal.parse('142.4'),
      testosteroneLevels: Decimal.parse('2.42'),
    ));
  });

  group('BloodTestProvider Tests', () {
    test('initialization loads bloodtests', () async {
      await provider.fetchBloodTests();
      expect(provider.bloodtests.length, repo.items.length);
    });
    test('add inserts a new item', () async {
      
      // Arrange
      final newDate = DateTime(2025, 1, 1, 1, 1);
      final newEstradiolLevels = Decimal.parse('111.1');
      final newTestosteroneLevels = Decimal.parse('1.1');

      // Act
      await provider.add(BloodTest(
        date: newDate,
        estradiolLevels: newEstradiolLevels,
        testosteroneLevels: newTestosteroneLevels,
      ));

      // Assert
      expect(
        provider.bloodtests
            .any((i) => i.date == newDate && i.estradiolLevels == newEstradiolLevels && i.testosteroneLevels == newTestosteroneLevels),
        true,
      );
    });

    test('updateBloodTest updates an existing item', () async {
      // Arrange
      final bloodtestToUpdate = repo.items.first;
      final updatedBloodTest = BloodTest(
        id: bloodtestToUpdate.id,
        date: DateTime(2025, 2, 2, 2, 2),
        estradiolLevels: bloodtestToUpdate.estradiolLevels,
        testosteroneLevels: bloodtestToUpdate.testosteroneLevels,
      );

      // Act
      await provider.updateBloodTest(updatedBloodTest);

      // Assert
      final fetchedBloodTests =
          provider.bloodtests.firstWhere((i) => i.id == bloodtestToUpdate.id);
      expect(fetchedBloodTests.date, DateTime(2025, 2, 2, 2, 2));
    });

    test('deleteBloodTestFromId removes the item', () async {
      // Act
      await provider.deleteBloodTestFromId(1);

      // Assert
      expect(
        [provider.bloodtests.length, provider.bloodtests.first.id],
        [1, 2],
      );
    });

    test('deleteBloodTest removes the item by object', () async {
      // Arrange
      final bloodtestToDelete = repo.items.first;

      // Act
      await provider.deleteBloodTest(bloodtestToDelete);

      // Assert
      expect(
        [provider.bloodtests.length, provider.bloodtests.first.id],
        [1, 2],
      );
     } 
    );
    test('takenIntakesSortedDesc returns taken intakes sorted descending',
        () async {
      await provider.fetchBloodTests();
      provider.add(BloodTest(
        id: 666,
        date: DateTime(2025, 5, 4, 3, 0),
        estradiolLevels: Decimal.parse('234.5'),
        testosteroneLevels: Decimal.parse('2.34'),
      ));
      provider.add(BloodTest(
        id: 667,
        date: DateTime(2025, 6, 7, 8, 9),
        estradiolLevels: Decimal.parse('292.9'),
        testosteroneLevels: Decimal.parse('2.43'),
      ));
      provider.add(BloodTest(
        id: 668,
        date: DateTime(2025, 3, 2, 1, 0),
        estradiolLevels: Decimal.parse('261.2'),
        testosteroneLevels: Decimal.parse('3.3'),
      ));

      final sorted = provider.bloodtestsSortedDesc;

      expect(
        sorted.asMap().entries.every((entry) {
          final i = entry.key;
          final bloodtest = entry.value;
          if (i < sorted.length - 1) {
            final next = sorted[i + 1];
            if (bloodtest.date!.isBefore(next.date!)) {
              return false;
            }
          }
          return true;
        }),
        true,
      );

      provider.deleteBloodTestFromId(666);
      provider.deleteBloodTestFromId(667);
      provider.deleteBloodTestFromId(668);
    });

  });


}