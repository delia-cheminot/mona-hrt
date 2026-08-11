// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_intake.dart';

class MedicationIntakeMapper extends ClassMapperBase<MedicationIntake> {
  MedicationIntakeMapper._();

  static MedicationIntakeMapper? _instance;
  static MedicationIntakeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationIntakeMapper._());
      MapperContainer.globals.useAll([
        EsterNameMapper(),
        DecimalStringMapper(),
        TimeOfDayMapper(),
      ]);
      MoleculeMapper.ensureInitialized();
      AdministrationRouteMapper.ensureInitialized();
      PlacementMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationIntake';

  static int _$id(MedicationIntake v) => v.id;
  static const Field<MedicationIntake, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static TimeOfDay? _$scheduledTime(MedicationIntake v) => v.scheduledTime;
  static const Field<MedicationIntake, TimeOfDay> _f$scheduledTime = Field(
    'scheduledTime',
    _$scheduledTime,
    opt: true,
  );
  static Decimal _$takenDose(MedicationIntake v) => v.takenDose;
  static const Field<MedicationIntake, Decimal> _f$takenDose = Field(
    'takenDose',
    _$takenDose,
  );
  static Decimal? _$wastedAmount(MedicationIntake v) => v.wastedAmount;
  static const Field<MedicationIntake, Decimal> _f$wastedAmount = Field(
    'wastedAmount',
    _$wastedAmount,
    opt: true,
  );
  static Decimal? _$deadSpace(MedicationIntake v) => v.deadSpace;
  static const Field<MedicationIntake, Decimal> _f$deadSpace = Field(
    'deadSpace',
    _$deadSpace,
    opt: true,
  );
  static DateTime? _$takenDateTime(MedicationIntake v) => v.takenDateTime;
  static const Field<MedicationIntake, DateTime> _f$takenDateTime = Field(
    'takenDateTime',
    _$takenDateTime,
    opt: true,
  );
  static String? _$takenTimeZone(MedicationIntake v) => v.takenTimeZone;
  static const Field<MedicationIntake, String> _f$takenTimeZone = Field(
    'takenTimeZone',
    _$takenTimeZone,
    opt: true,
  );
  static int? _$scheduleId(MedicationIntake v) => v.scheduleId;
  static const Field<MedicationIntake, int> _f$scheduleId = Field(
    'scheduleId',
    _$scheduleId,
    opt: true,
  );
  static Molecule _$molecule(MedicationIntake v) => v.molecule;
  static const Field<MedicationIntake, Molecule> _f$molecule = Field(
    'molecule',
    _$molecule,
    hook: JsonStringHook(),
  );
  static AdministrationRoute _$administrationRoute(MedicationIntake v) =>
      v.administrationRoute;
  static const Field<MedicationIntake, AdministrationRoute>
      _f$administrationRoute =
      Field('administrationRoute', _$administrationRoute);
  static Ester? _$ester(MedicationIntake v) => v.ester;
  static const Field<MedicationIntake, Ester> _f$ester = Field(
    'ester',
    _$ester,
    opt: true,
  );
  static int? _$medicationSupplyItemId(MedicationIntake v) =>
      v.medicationSupplyItemId;
  static const Field<MedicationIntake, int> _f$medicationSupplyItemId = Field(
    'medicationSupplyItemId',
    _$medicationSupplyItemId,
    opt: true,
  );
  static List<int> _$genericSupplyItemIds(MedicationIntake v) =>
      v.genericSupplyItemIds;
  static const Field<MedicationIntake, List<int>> _f$genericSupplyItemIds =
      Field(
    'genericSupplyItemIds',
    _$genericSupplyItemIds,
    opt: true,
    def: const [],
    hook: JsonStringHook(),
  );
  static String? _$notes(MedicationIntake v) => v.notes;
  static const Field<MedicationIntake, String> _f$notes = Field(
    'notes',
    _$notes,
    opt: true,
  );
  static List<Placement> _$placements(MedicationIntake v) => v.placements;
  static const Field<MedicationIntake, List<Placement>> _f$placements = Field(
    'placements',
    _$placements,
    opt: true,
    def: const [],
    hook: JsonStringHook(),
  );

  @override
  final MappableFields<MedicationIntake> fields = const {
    #id: _f$id,
    #scheduledTime: _f$scheduledTime,
    #takenDose: _f$takenDose,
    #wastedAmount: _f$wastedAmount,
    #deadSpace: _f$deadSpace,
    #takenDateTime: _f$takenDateTime,
    #takenTimeZone: _f$takenTimeZone,
    #scheduleId: _f$scheduleId,
    #molecule: _f$molecule,
    #administrationRoute: _f$administrationRoute,
    #ester: _f$ester,
    #medicationSupplyItemId: _f$medicationSupplyItemId,
    #genericSupplyItemIds: _f$genericSupplyItemIds,
    #notes: _f$notes,
    #placements: _f$placements,
  };

  static MedicationIntake _instantiate(DecodingData data) {
    return MedicationIntake(
      id: data.dec(_f$id),
      scheduledTime: data.dec(_f$scheduledTime),
      takenDose: data.dec(_f$takenDose),
      wastedAmount: data.dec(_f$wastedAmount),
      deadSpace: data.dec(_f$deadSpace),
      takenDateTime: data.dec(_f$takenDateTime),
      takenTimeZone: data.dec(_f$takenTimeZone),
      scheduleId: data.dec(_f$scheduleId),
      molecule: data.dec(_f$molecule),
      administrationRoute: data.dec(_f$administrationRoute),
      ester: data.dec(_f$ester),
      medicationSupplyItemId: data.dec(_f$medicationSupplyItemId),
      genericSupplyItemIds: data.dec(_f$genericSupplyItemIds),
      notes: data.dec(_f$notes),
      placements: data.dec(_f$placements),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationIntake fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationIntake>(map);
  }

  static MedicationIntake fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationIntake>(json);
  }
}

mixin MedicationIntakeMappable {
  String toJson() {
    return MedicationIntakeMapper.ensureInitialized()
        .encodeJson<MedicationIntake>(this as MedicationIntake);
  }

  Map<String, dynamic> toMap() {
    return MedicationIntakeMapper.ensureInitialized()
        .encodeMap<MedicationIntake>(this as MedicationIntake);
  }

  MedicationIntakeCopyWith<MedicationIntake, MedicationIntake, MedicationIntake>
      get copyWith =>
          _MedicationIntakeCopyWithImpl<MedicationIntake, MedicationIntake>(
            this as MedicationIntake,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return MedicationIntakeMapper.ensureInitialized().stringifyValue(
      this as MedicationIntake,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationIntakeMapper.ensureInitialized().equalsValue(
      this as MedicationIntake,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationIntakeMapper.ensureInitialized().hashValue(
      this as MedicationIntake,
    );
  }
}

extension MedicationIntakeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationIntake, $Out> {
  MedicationIntakeCopyWith<$R, MedicationIntake, $Out>
      get $asMedicationIntake => $base
          .as((v, t, t2) => _MedicationIntakeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MedicationIntakeCopyWith<$R, $In extends MedicationIntake, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MoleculeCopyWith<$R, Molecule, Molecule> get molecule;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get genericSupplyItemIds;
  ListCopyWith<$R, Placement, PlacementCopyWith<$R, Placement, Placement>>
      get placements;
  $R call({
    int? id,
    TimeOfDay? scheduledTime,
    Decimal? takenDose,
    Decimal? wastedAmount,
    Decimal? deadSpace,
    DateTime? takenDateTime,
    String? takenTimeZone,
    int? scheduleId,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Ester? ester,
    int? medicationSupplyItemId,
    List<int>? genericSupplyItemIds,
    String? notes,
    List<Placement>? placements,
  });
  MedicationIntakeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationIntakeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationIntake, $Out>
    implements MedicationIntakeCopyWith<$R, MedicationIntake, $Out> {
  _MedicationIntakeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationIntake> $mapper =
      MedicationIntakeMapper.ensureInitialized();
  @override
  MoleculeCopyWith<$R, Molecule, Molecule> get molecule =>
      $value.molecule.copyWith.$chain((v) => call(molecule: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>>
      get genericSupplyItemIds => ListCopyWith(
            $value.genericSupplyItemIds,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(genericSupplyItemIds: v),
          );
  @override
  ListCopyWith<$R, Placement, PlacementCopyWith<$R, Placement, Placement>>
      get placements => ListCopyWith(
            $value.placements,
            (v, t) => v.copyWith.$chain(t),
            (v) => call(placements: v),
          );
  @override
  $R call({
    Object? id = $none,
    Object? scheduledTime = $none,
    Decimal? takenDose,
    Object? wastedAmount = $none,
    Object? deadSpace = $none,
    Object? takenDateTime = $none,
    Object? takenTimeZone = $none,
    Object? scheduleId = $none,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Object? ester = $none,
    Object? medicationSupplyItemId = $none,
    List<int>? genericSupplyItemIds,
    Object? notes = $none,
    List<Placement>? placements,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != $none) #id: id,
          if (scheduledTime != $none) #scheduledTime: scheduledTime,
          if (takenDose != null) #takenDose: takenDose,
          if (wastedAmount != $none) #wastedAmount: wastedAmount,
          if (deadSpace != $none) #deadSpace: deadSpace,
          if (takenDateTime != $none) #takenDateTime: takenDateTime,
          if (takenTimeZone != $none) #takenTimeZone: takenTimeZone,
          if (scheduleId != $none) #scheduleId: scheduleId,
          if (molecule != null) #molecule: molecule,
          if (administrationRoute != null)
            #administrationRoute: administrationRoute,
          if (ester != $none) #ester: ester,
          if (medicationSupplyItemId != $none)
            #medicationSupplyItemId: medicationSupplyItemId,
          if (genericSupplyItemIds != null)
            #genericSupplyItemIds: genericSupplyItemIds,
          if (notes != $none) #notes: notes,
          if (placements != null) #placements: placements,
        }),
      );
  @override
  MedicationIntake $make(CopyWithData data) => MedicationIntake(
        id: data.get(#id, or: $value.id),
        scheduledTime: data.get(#scheduledTime, or: $value.scheduledTime),
        takenDose: data.get(#takenDose, or: $value.takenDose),
        wastedAmount: data.get(#wastedAmount, or: $value.wastedAmount),
        deadSpace: data.get(#deadSpace, or: $value.deadSpace),
        takenDateTime: data.get(#takenDateTime, or: $value.takenDateTime),
        takenTimeZone: data.get(#takenTimeZone, or: $value.takenTimeZone),
        scheduleId: data.get(#scheduleId, or: $value.scheduleId),
        molecule: data.get(#molecule, or: $value.molecule),
        administrationRoute: data.get(
          #administrationRoute,
          or: $value.administrationRoute,
        ),
        ester: data.get(#ester, or: $value.ester),
        medicationSupplyItemId: data.get(
          #medicationSupplyItemId,
          or: $value.medicationSupplyItemId,
        ),
        genericSupplyItemIds: data.get(
          #genericSupplyItemIds,
          or: $value.genericSupplyItemIds,
        ),
        notes: data.get(#notes, or: $value.notes),
        placements: data.get(#placements, or: $value.placements),
      );

  @override
  MedicationIntakeCopyWith<$R2, MedicationIntake, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _MedicationIntakeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
