// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_schedule.dart';

class MedicationScheduleMapper extends ClassMapperBase<MedicationSchedule> {
  MedicationScheduleMapper._();

  static MedicationScheduleMapper? _instance;
  static MedicationScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationScheduleMapper._());
      MapperContainer.globals.useAll([
        EsterNameMapper(),
        DecimalStringMapper(),
        DateStringMapper(),
      ]);
      SchedulingStrategyMapper.ensureInitialized();
      MoleculeMapper.ensureInitialized();
      AdministrationRouteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationSchedule';

  static int _$id(MedicationSchedule v) => v.id;
  static const Field<MedicationSchedule, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String _$name(MedicationSchedule v) => v.name;
  static const Field<MedicationSchedule, String> _f$name = Field(
    'name',
    _$name,
  );
  static Decimal _$dose(MedicationSchedule v) => v.dose;
  static const Field<MedicationSchedule, Decimal> _f$dose = Field(
    'dose',
    _$dose,
  );
  static SchedulingStrategy _$scheduling(MedicationSchedule v) => v.scheduling;
  static const Field<MedicationSchedule, SchedulingStrategy> _f$scheduling =
      Field('scheduling', _$scheduling, hook: JsonStringHook());
  static Date _$startDate(MedicationSchedule v) => v.startDate;
  static const Field<MedicationSchedule, Date> _f$startDate = Field(
    'startDate',
    _$startDate,
    opt: true,
  );
  static Molecule _$molecule(MedicationSchedule v) => v.molecule;
  static const Field<MedicationSchedule, Molecule> _f$molecule = Field(
    'molecule',
    _$molecule,
    hook: JsonStringHook(),
  );
  static AdministrationRoute _$administrationRoute(MedicationSchedule v) =>
      v.administrationRoute;
  static const Field<MedicationSchedule, AdministrationRoute>
      _f$administrationRoute =
      Field('administrationRoute', _$administrationRoute);
  static Ester? _$ester(MedicationSchedule v) => v.ester;
  static const Field<MedicationSchedule, Ester> _f$ester = Field(
    'ester',
    _$ester,
    opt: true,
  );

  @override
  final MappableFields<MedicationSchedule> fields = const {
    #id: _f$id,
    #name: _f$name,
    #dose: _f$dose,
    #scheduling: _f$scheduling,
    #startDate: _f$startDate,
    #molecule: _f$molecule,
    #administrationRoute: _f$administrationRoute,
    #ester: _f$ester,
  };

  static MedicationSchedule _instantiate(DecodingData data) {
    return MedicationSchedule(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      dose: data.dec(_f$dose),
      scheduling: data.dec(_f$scheduling),
      startDate: data.dec(_f$startDate),
      molecule: data.dec(_f$molecule),
      administrationRoute: data.dec(_f$administrationRoute),
      ester: data.dec(_f$ester),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationSchedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationSchedule>(map);
  }

  static MedicationSchedule fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationSchedule>(json);
  }
}

mixin MedicationScheduleMappable {
  String toJson() {
    return MedicationScheduleMapper.ensureInitialized()
        .encodeJson<MedicationSchedule>(this as MedicationSchedule);
  }

  Map<String, dynamic> toMap() {
    return MedicationScheduleMapper.ensureInitialized()
        .encodeMap<MedicationSchedule>(this as MedicationSchedule);
  }

  MedicationScheduleCopyWith<MedicationSchedule, MedicationSchedule,
      MedicationSchedule> get copyWith => _MedicationScheduleCopyWithImpl<
          MedicationSchedule, MedicationSchedule>(
        this as MedicationSchedule,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MedicationScheduleMapper.ensureInitialized().stringifyValue(
      this as MedicationSchedule,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationScheduleMapper.ensureInitialized().equalsValue(
      this as MedicationSchedule,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationScheduleMapper.ensureInitialized().hashValue(
      this as MedicationSchedule,
    );
  }
}

extension MedicationScheduleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationSchedule, $Out> {
  MedicationScheduleCopyWith<$R, MedicationSchedule, $Out>
      get $asMedicationSchedule => $base.as(
            (v, t, t2) => _MedicationScheduleCopyWithImpl<$R, $Out>(v, t, t2),
          );
}

abstract class MedicationScheduleCopyWith<$R, $In extends MedicationSchedule,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  SchedulingStrategyCopyWith<$R, SchedulingStrategy, SchedulingStrategy>
      get scheduling;
  MoleculeCopyWith<$R, Molecule, Molecule> get molecule;
  $R call({
    int? id,
    String? name,
    Decimal? dose,
    SchedulingStrategy? scheduling,
    Date? startDate,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Ester? ester,
  });
  MedicationScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationSchedule, $Out>
    implements MedicationScheduleCopyWith<$R, MedicationSchedule, $Out> {
  _MedicationScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationSchedule> $mapper =
      MedicationScheduleMapper.ensureInitialized();
  @override
  SchedulingStrategyCopyWith<$R, SchedulingStrategy, SchedulingStrategy>
      get scheduling =>
          $value.scheduling.copyWith.$chain((v) => call(scheduling: v));
  @override
  MoleculeCopyWith<$R, Molecule, Molecule> get molecule =>
      $value.molecule.copyWith.$chain((v) => call(molecule: v));
  @override
  $R call({
    Object? id = $none,
    String? name,
    Decimal? dose,
    SchedulingStrategy? scheduling,
    Object? startDate = $none,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Object? ester = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != $none) #id: id,
          if (name != null) #name: name,
          if (dose != null) #dose: dose,
          if (scheduling != null) #scheduling: scheduling,
          if (startDate != $none) #startDate: startDate,
          if (molecule != null) #molecule: molecule,
          if (administrationRoute != null)
            #administrationRoute: administrationRoute,
          if (ester != $none) #ester: ester,
        }),
      );
  @override
  MedicationSchedule $make(CopyWithData data) => MedicationSchedule(
        id: data.get(#id, or: $value.id),
        name: data.get(#name, or: $value.name),
        dose: data.get(#dose, or: $value.dose),
        scheduling: data.get(#scheduling, or: $value.scheduling),
        startDate: data.get(#startDate, or: $value.startDate),
        molecule: data.get(#molecule, or: $value.molecule),
        administrationRoute: data.get(
          #administrationRoute,
          or: $value.administrationRoute,
        ),
        ester: data.get(#ester, or: $value.ester),
      );

  @override
  MedicationScheduleCopyWith<$R2, MedicationSchedule, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _MedicationScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
