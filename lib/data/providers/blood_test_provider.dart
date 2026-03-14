import 'package:flutter/material.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/services/repository.dart';

class BloodTestProvider extends ChangeNotifier {
  List<BloodTest> _bloodtests = [];
  List<BloodTest> _bloodtestsSortedDesc = [];
  bool _isLoading = true;

  final Repository<BloodTest> repository;

  BloodTestProvider({Repository<BloodTest>? repository})
      : repository = repository ?? _bloodTestRepository {
    _init();
  }

  bool get isLoading => _isLoading;
  List<BloodTest> get bloodtests => _bloodtests;
  List<BloodTest> get bloodtestsSortedDesc => _bloodtestsSortedDesc;

  Future<void> _init() async {
    _bloodtests = await repository.getAll();
    _updateSorted();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchBloodTests() async {
    _bloodtests = await repository.getAll();
    _updateSorted();
    notifyListeners();
  }

  Future<void> deleteBloodTestFromId(int id) async {
    await repository.delete(id);
    await fetchBloodTests();
  }

  void _updateSorted() {
    _bloodtestsSortedDesc = List<BloodTest>.from(_bloodtests)
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> deleteBloodTest(BloodTest bloodTest) async {
    await repository.delete(bloodTest.id);
    await fetchBloodTests();
  }

  Future<void> add(BloodTest bloodtest) async {
    await repository.insert(bloodtest);
    await fetchBloodTests();
  }

  Future<void> updateBloodTest(BloodTest bloodtest) async {
    await repository.update(bloodtest, bloodtest.id);
    await fetchBloodTests();
  }

  static final _bloodTestRepository = Repository<BloodTest>(
    tableName: 'blood_tests',
    toMap: (BloodTest bloodtest) => bloodtest.toMap(),
    fromMap: (Map<String, Object?> map) => BloodTest.fromMap(map),
  );
}
