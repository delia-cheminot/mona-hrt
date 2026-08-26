import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/model/hormone.dart';
import 'package:mona/data/model/level_entry.dart';
import 'package:mona/data/model/units.dart';
import 'package:mona/services/repository.dart';
import 'package:mona/util/time_difference.dart';

class BloodTestProvider extends ChangeNotifier {
  List<BloodTest> _bloodTestsSortedDesc = [];
  bool _isLoading = true;

  final Repository<BloodTest> repository;

  BloodTestProvider({Repository<BloodTest>? repository})
      : repository = repository ?? _bloodTestRepository {
    _init();
  }

  bool get isLoading => _isLoading;
  List<BloodTest> get bloodTestsSortedDesc => _bloodTestsSortedDesc;

  List<BloodTest> get estradiolTestsSortedDesc =>
      _bloodTestsSortedDesc.where((t) => t.estradiolLevels != null).toList();

  List<BloodTest> get testosteroneTestsSortedDesc =>
      _bloodTestsSortedDesc.where((t) => t.testosteroneLevels != null).toList();

  UnitValue<EstradiolUnit>? latestEstradiolLevel(EstradiolUnit unit) {
    final latest = _bloodTestsSortedDesc
        .firstWhereOrNull((t) => t.estradiolLevels != null)
        ?.estradiolLevels;
    if (latest == null) return null;
    return UnitValue(latest.inUnit(unit), unit);
  }

  UnitValue<TestosteroneUnit>? latestTestosteroneLevel(TestosteroneUnit unit) {
    final latest = _bloodTestsSortedDesc
        .firstWhereOrNull((t) => t.testosteroneLevels != null)
        ?.testosteroneLevels;
    if (latest == null) return null;
    return UnitValue(latest.inUnit(unit), unit);
  }

  List<LevelEntry> levelEntries(Hormone hormone, Units units) {
    switch (hormone) {
      case Hormone.estradiol:
        final unit = units.estradiol;
        return estradiolTestsSortedDesc
            .map((test) => (
                  localDate: test.localDate,
                  value: UnitValue(test.estradiolLevels!.inUnit(unit), unit),
                ))
            .toList();
      case Hormone.testosterone:
        final unit = units.testosterone;
        return testosteroneTestsSortedDesc
            .map((test) => (
                  localDate: test.localDate,
                  value: UnitValue(test.testosteroneLevels!.inUnit(unit), unit),
                ))
            .toList();
    }
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
    if (bloodTestsSortedDesc.isEmpty) return [];

    return bloodTestsSortedDesc
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
    _bloodTestsSortedDesc = (await repository.getAll())
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    notifyListeners();
  }

  Future<void> _init() async {
    _bloodTestsSortedDesc = (await repository.getAll())
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
    _isLoading = false;
    notifyListeners();
  }
}
