// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_intake.dart';

class InjectionSideMapper extends EnumMapper<InjectionSide> {
  InjectionSideMapper._();

  static InjectionSideMapper? _instance;
  static InjectionSideMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InjectionSideMapper._());
    }
    return _instance!;
  }

  static InjectionSide fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  InjectionSide decode(dynamic value) {
    switch (value) {
      case r'left':
        return InjectionSide.left;
      case r'right':
        return InjectionSide.right;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(InjectionSide self) {
    switch (self) {
      case InjectionSide.left:
        return r'left';
      case InjectionSide.right:
        return r'right';
    }
  }
}

extension InjectionSideMapperExtension on InjectionSide {
  String toValue() {
    InjectionSideMapper.ensureInitialized();
    return MapperContainer.globals.toValue<InjectionSide>(this) as String;
  }
}

class MedicationIntakeMapper extends ClassMapperBase<MedicationIntake> {
  MedicationIntakeMapper._();

  static MedicationIntakeMapper? _instance;
  static MedicationIntakeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationIntakeMapper._());
      MapperContainer.globals.useAll([
        MoleculeJsonMapper(),
        AdministrationRouteNameMapper(),
        EsterNameMapper(),
        DecimalStringMapper(),
        TimeOfDayMapper(),
      ]);
      InjectionSideMapper.ensureInitialized();
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
  static InjectionSide? _$side(MedicationIntake v) => v.side;
  static const Field<MedicationIntake, InjectionSide> _f$side = Field(
    'side',
    _$side,
    opt: true,
  );
  static Molecule _$molecule(MedicationIntake v) => v.molecule;
  static const Field<MedicationIntake, Molecule> _f$molecule = Field(
    'molecule',
    _$molecule,
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
  static int? _$supplyItemId(MedicationIntake v) => v.supplyItemId;
  static const Field<MedicationIntake, int> _f$supplyItemId = Field(
    'supplyItemId',
    _$supplyItemId,
    opt: true,
  );
  static String? _$notes(MedicationIntake v) => v.notes;
  static const Field<MedicationIntake, String> _f$notes = Field(
    'notes',
    _$notes,
    opt: true,
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
    #side: _f$side,
    #molecule: _f$molecule,
    #administrationRoute: _f$administrationRoute,
    #ester: _f$ester,
    #supplyItemId: _f$supplyItemId,
    #notes: _f$notes,
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
      side: data.dec(_f$side),
      molecule: data.dec(_f$molecule),
      administrationRoute: data.dec(_f$administrationRoute),
      ester: data.dec(_f$ester),
      supplyItemId: data.dec(_f$supplyItemId),
      notes: data.dec(_f$notes),
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
  $R call({
    int? id,
    TimeOfDay? scheduledTime,
    Decimal? takenDose,
    Decimal? wastedAmount,
    Decimal? deadSpace,
    DateTime? takenDateTime,
    String? takenTimeZone,
    int? scheduleId,
    InjectionSide? side,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Ester? ester,
    int? supplyItemId,
    String? notes,
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
  $R call({
    Object? id = $none,
    Object? scheduledTime = $none,
    Decimal? takenDose,
    Object? wastedAmount = $none,
    Object? deadSpace = $none,
    Object? takenDateTime = $none,
    Object? takenTimeZone = $none,
    Object? scheduleId = $none,
    Object? side = $none,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Object? ester = $none,
    Object? supplyItemId = $none,
    Object? notes = $none,
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
          if (side != $none) #side: side,
          if (molecule != null) #molecule: molecule,
          if (administrationRoute != null)
            #administrationRoute: administrationRoute,
          if (ester != $none) #ester: ester,
          if (supplyItemId != $none) #supplyItemId: supplyItemId,
          if (notes != $none) #notes: notes,
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
        side: data.get(#side, or: $value.side),
        molecule: data.get(#molecule, or: $value.molecule),
        administrationRoute: data.get(
          #administrationRoute,
          or: $value.administrationRoute,
        ),
        ester: data.get(#ester, or: $value.ester),
        supplyItemId: data.get(#supplyItemId, or: $value.supplyItemId),
        notes: data.get(#notes, or: $value.notes),
      );

  @override
  MedicationIntakeCopyWith<$R2, MedicationIntake, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _MedicationIntakeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
