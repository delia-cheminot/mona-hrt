import 'package:flutter/material.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/graph_calculator.dart';
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

  List<BloodTest> get estradiolTestsSortedDesc =>
      _bloodtestsSortedDesc.where((t) => t.estradiolLevels != null).toList();

  List<BloodTest> get testosteroneTestsSortedDesc =>
      _bloodtestsSortedDesc.where((t) => t.testosteroneLevels != null).toList();

  UnitValue<EstradiolUnit>? latestEstradiolLevel(EstradiolUnit unit) {
    final stored = estradiolTestsSortedDesc.firstOrNull?.estradiolLevels;
    if (stored == null) return null;
    return UnitValue(stored.inUnit(unit), unit);
  }

  UnitValue<TestosteroneUnit>? latestTestosteroneLevel(TestosteroneUnit unit) {
    final stored = testosteroneTestsSortedDesc.firstOrNull?.testosteroneLevels;
    if (stored == null) return null;
    return UnitValue(stored.inUnit(unit), unit);
  }

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

  List<GraphBloodTest> getBloodTestsForGraph(
      DateTime tMin, EstradiolUnit unit) {
    if (bloodtestsSortedDesc.isEmpty) return [];

    return bloodtestsSortedDesc
        .where((bloodtest) => bloodtest.estradiolLevels != null)
        .where((bloodtest) => !bloodtest.dateTime.isBefore(tMin))
        .map((bloodtest) => GraphBloodTest(
              offset: timeDifferenceInDays(bloodtest.dateTime, tMin),
              level: bloodtest.estradiolLevels!.inUnit(unit).toDouble(),
            ))
        .toList();
  }

  static final _bloodTestRepository = Repository<BloodTest>(
    tableName: 'blood_tests',
    toMap: (BloodTest bloodtest) => bloodtest.toMap(),
    fromMap: (map) => BloodTestMapper.fromMap(Map<String, dynamic>.from(map)),
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
