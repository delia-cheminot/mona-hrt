import 'package:flutter/material.dart';
import 'package:mona/data/model/administration_route.dart';
import 'package:mona/data/model/date.dart';
import 'package:mona/data/model/graph_calculator.dart';
import 'package:mona/data/model/medication_intake.dart';
import 'package:mona/data/model/molecule.dart';
import 'package:mona/services/repository.dart';
import 'package:mona/util/time_difference.dart';

class MedicationIntakeProvider extends ChangeNotifier {
  List<MedicationIntake> _intakes = [];
  List<MedicationIntake> _takenIntakesSortedDesc = [];
  bool _isLoading = true;
  final Repository<MedicationIntake> repository;

  MedicationIntakeProvider({Repository<MedicationIntake>? repository})
      : repository = repository ?? _medicationIntakeRepository {
    _init();
  }

  bool get isLoading => _isLoading;

  List<MedicationIntake> get intakes => _intakes;

  List<MedicationIntake> get takenIntakesSortedDesc => _takenIntakesSortedDesc;

  List<MedicationIntake> get takenIntakes =>
      _intakes.where((intake) => intake.isTaken).toList();

  List<MedicationIntake> get notTakenIntakes =>
      _intakes.where((intake) => !intake.isTaken).toList();

  List<MedicationIntake> get plottableIntakes => takenIntakes
      .where((intake) =>
          intake.molecule == KnownMolecules.estradiol &&
          intake.administrationRoute == AdministrationRoute.injection &&
          intake.ester != null)
      .toList();

  Future<void> _init() async {
    _intakes = await repository.getAll();
    _updateTakenSorted();
    _isLoading = false;
    notifyListeners();
  }

  void _updateTakenSorted() {
    _takenIntakesSortedDesc = List<MedicationIntake>.from(takenIntakes)
      ..sort((a, b) => b.takenDateTime!.compareTo(a.takenDateTime!));
  }

  List<MedicationIntake> getTakenIntakesForSchedule(int scheduleId) =>
      takenIntakes.where((intake) => intake.scheduleId == scheduleId).toList();

  Future<void> fetchIntakes() async {
    _intakes = await repository.getAll();
    _updateTakenSorted();
    notifyListeners();
  }

  Future<void> deleteIntakeFromId(int id) async {
    await repository.delete(id);
    await fetchIntakes();
  }

  Future<void> deleteIntake(MedicationIntake intake) async {
    await repository.delete(intake.id);
    await fetchIntakes();
  }

  Future<void> add(MedicationIntake intake) async {
    await repository.insert(intake);
    await fetchIntakes();
  }

  Future<void> updateIntake(MedicationIntake intake) async {
    await repository.update(intake, intake.id);
    await fetchIntakes();
  }

  List<GraphIntake> getIntakesForGraph() {
    if (plottableIntakes.isEmpty) return [];

    final tMin = getFirstGraphIntakeInstant()!;

    return plottableIntakes
        .map((intake) => GraphIntake(
              dose: intake.takenDose.toDouble(),
              ester: intake.ester!,
              time: timeDifferenceInDays(intake.takenDateTime!, tMin),
            ))
        .toList();
  }

  Date? getFirstGraphIntakeLocalDate() {
    if (plottableIntakes.isEmpty) return null;

    return plottableIntakes
        .reduce((a, b) => a.takenDateTime!.isBefore(b.takenDateTime!) ? a : b)
        .takenLocalDate;
  } // TODO remove

  DateTime? getFirstGraphIntakeInstant() {
    if (plottableIntakes.isEmpty) return null;

    return plottableIntakes
        .reduce((a, b) => a.takenDateTime!.isBefore(b.takenDateTime!) ? a : b)
        .takenDateTime;
  }

  double? getGraphSpan() {
    if (plottableIntakes.isEmpty) return null;

    final lastInstant = plottableIntakes
        .reduce((a, b) => a.takenDateTime!.isAfter(b.takenDateTime!) ? a : b)
        .takenDateTime!;

    return timeDifferenceInDays(lastInstant, getFirstGraphIntakeInstant()!);
  }

  Date? getLastIntakeLocalDateFromList(List<MedicationIntake> intakes) {
    if (intakes.isEmpty) return null;

    return intakes
        .reduce((a, b) => a.takenDateTime!.isAfter(b.takenDateTime!) ? a : b)
        .takenLocalDate;
  }

  Date? getLastIntakeLocalDateForSchedule(int scheduleId) {
    final scheduleIntakes = getTakenIntakesForSchedule(scheduleId);
    return getLastIntakeLocalDateFromList(scheduleIntakes);
  }

  List<MedicationIntake> getTakenIntakesForScheduleOn(
      int scheduleId, Date date) {
    return getTakenIntakesForSchedule(scheduleId)
        .where((intake) => intake.takenLocalDate == date)
        .toList();
  }

  MedicationIntake? getLastTakenIntakeForSchedule(int scheduleId) {
    final scheduleIntakes = getTakenIntakesForSchedule(scheduleId);
    if (scheduleIntakes.isEmpty) return null;
    return scheduleIntakes
        .reduce((a, b) => a.takenDateTime!.isAfter(b.takenDateTime!) ? a : b);
  }

  MedicationIntake? getLastTakenIntake() {
    if (takenIntakes.isEmpty) return null;
    return takenIntakes
        .reduce((a, b) => a.takenDateTime!.isAfter(b.takenDateTime!) ? a : b);
  }

  MedicationIntake? getLastTakenInjectionIntake() {
    final injectionIntakes = takenIntakes
        .where((intake) =>
            intake.administrationRoute == AdministrationRoute.injection)
        .toList();
    if (injectionIntakes.isEmpty) return null;
    return injectionIntakes
        .reduce((a, b) => a.takenDateTime!.isAfter(b.takenDateTime!) ? a : b);
  }

  static final _medicationIntakeRepository = Repository<MedicationIntake>(
    tableName: 'medication_intakes',
    toMap: (MedicationIntake intake) => intake.toMap(),
    fromMap: (map) =>
        MedicationIntakeMapper.fromMap(Map<String, dynamic>.from(map)),
  );
}
