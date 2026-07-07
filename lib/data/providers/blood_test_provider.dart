import 'package:flutter/material.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/services/repository.dart';
import 'package:mona/util/time_difference.dart';

class BloodTestProvider extends ChangeNotifier {
  List<BloodTest> _bloodtestsSortedDesc = [];
  bool _isLoading = true;

  final Repository<BloodTest> repository;

  BloodTestProvider({Repository<BloodTest>? repository})
      : repository = repository ?? _bloodTestRepository {
    _init();
  }

  bool get isLoading => _isLoading;
  List<BloodTest> get bloodtestsSortedDesc => _bloodtestsSortedDesc;

  Future<void> deleteBloodTestFromId(int id) async {
    await repository.delete(id);
    await _fetchBloodTests();
  }

  Future<void> deleteBloodTest(BloodTest bloodTest) async {
    await repository.delete(bloodTest.id);
    await _fetchBloodTests();
  }

  Future<void> add(BloodTest bloodtest) async {
    await repository.insert(bloodtest);
    await _fetchBloodTests();
  }

  Future<void> updateBloodTest(BloodTest bloodtest) async {
    await repository.update(bloodtest, bloodtest.id);
    await _fetchBloodTests();
  }

  List<({double offset, double level})> getGraphBloodTests(
      DateTime tMin, EstradiolUnit unit) {
    if (bloodtestsSortedDesc.isEmpty) return [];

    return bloodtestsSortedDesc
        .where((bloodtest) => bloodtest.estradiolLevels != null)
        .where((bloodtest) => !bloodtest.dateTime.isBefore(tMin))
        .map((bloodtest) => (
              offset: timeDifferenceInDays(bloodtest.dateTime, tMin),
              level: bloodtest.estradiolLevels!.inUnit(unit).toDouble(),
            ))
        .toList();
  }

  static final _bloodTestRepository = Repository<BloodTest>(
    tableName: 'blood_tests',
    toMap: (BloodTest bloodtest) => bloodtest.toMap(),
    fromMap: (Map<String, Object?> map) => BloodTest.fromMap(map),
  );

  Future<void> _fetchBloodTests() async {
    _bloodtestsSortedDesc = (await repository.getAll())
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    notifyListeners();
  }

  Future<void> _init() async {
    _bloodtestsSortedDesc = (await repository.getAll())
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    _isLoading = false;
    notifyListeners();
  }
}
