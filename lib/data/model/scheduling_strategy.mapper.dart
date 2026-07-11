// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scheduling_strategy.dart';

class SchedulingStrategyMapper extends ClassMapperBase<SchedulingStrategy> {
  SchedulingStrategyMapper._();

  static SchedulingStrategyMapper? _instance;
  static SchedulingStrategyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SchedulingStrategyMapper._());
      IntervalDaysScheduleMapper.ensureInitialized();
      DailyScheduleMapper.ensureInitialized();
      WeeklyScheduleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SchedulingStrategy';

  @override
  final MappableFields<SchedulingStrategy> fields = const {};

  static SchedulingStrategy _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'SchedulingStrategy',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SchedulingStrategy fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SchedulingStrategy>(map);
  }

  static SchedulingStrategy fromJson(String json) {
    return ensureInitialized().decodeJson<SchedulingStrategy>(json);
  }
}

mixin SchedulingStrategyMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SchedulingStrategyCopyWith<SchedulingStrategy, SchedulingStrategy,
      SchedulingStrategy> get copyWith;
}

abstract class SchedulingStrategyCopyWith<$R, $In extends SchedulingStrategy,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SchedulingStrategyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class IntervalDaysScheduleMapper
    extends SubClassMapperBase<IntervalDaysSchedule> {
  IntervalDaysScheduleMapper._();

  static IntervalDaysScheduleMapper? _instance;
  static IntervalDaysScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntervalDaysScheduleMapper._());
      SchedulingStrategyMapper.ensureInitialized().addSubMapper(_instance!);
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'IntervalDaysSchedule';

  static int _$intervalDays(IntervalDaysSchedule v) => v.intervalDays;
  static const Field<IntervalDaysSchedule, int> _f$intervalDays = Field(
    'intervalDays',
    _$intervalDays,
  );
  static List<TimeOfDay> _$notificationTimes(IntervalDaysSchedule v) =>
      v.notificationTimes;
  static const Field<IntervalDaysSchedule, List<TimeOfDay>>
      _f$notificationTimes = Field(
    'notificationTimes',
    _$notificationTimes,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<IntervalDaysSchedule> fields = const {
    #intervalDays: _f$intervalDays,
    #notificationTimes: _f$notificationTimes,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'intervalDays';
  @override
  late final ClassMapperBase superMapper =
      SchedulingStrategyMapper.ensureInitialized();

  static IntervalDaysSchedule _instantiate(DecodingData data) {
    return IntervalDaysSchedule(
      intervalDays: data.dec(_f$intervalDays),
      notificationTimes: data.dec(_f$notificationTimes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static IntervalDaysSchedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntervalDaysSchedule>(map);
  }

  static IntervalDaysSchedule fromJson(String json) {
    return ensureInitialized().decodeJson<IntervalDaysSchedule>(json);
  }
}

mixin IntervalDaysScheduleMappable {
  String toJson() {
    return IntervalDaysScheduleMapper.ensureInitialized()
        .encodeJson<IntervalDaysSchedule>(this as IntervalDaysSchedule);
  }

  Map<String, dynamic> toMap() {
    return IntervalDaysScheduleMapper.ensureInitialized()
        .encodeMap<IntervalDaysSchedule>(this as IntervalDaysSchedule);
  }

  IntervalDaysScheduleCopyWith<IntervalDaysSchedule, IntervalDaysSchedule,
      IntervalDaysSchedule> get copyWith => _IntervalDaysScheduleCopyWithImpl<
          IntervalDaysSchedule, IntervalDaysSchedule>(
      this as IntervalDaysSchedule, $identity, $identity);
  @override
  String toString() {
    return IntervalDaysScheduleMapper.ensureInitialized().stringifyValue(
      this as IntervalDaysSchedule,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntervalDaysScheduleMapper.ensureInitialized().equalsValue(
      this as IntervalDaysSchedule,
      other,
    );
  }

  @override
  int get hashCode {
    return IntervalDaysScheduleMapper.ensureInitialized().hashValue(
      this as IntervalDaysSchedule,
    );
  }
}

extension IntervalDaysScheduleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntervalDaysSchedule, $Out> {
  IntervalDaysScheduleCopyWith<$R, IntervalDaysSchedule, $Out>
      get $asIntervalDaysSchedule => $base.as(
            (v, t, t2) => _IntervalDaysScheduleCopyWithImpl<$R, $Out>(v, t, t2),
          );
}

abstract class IntervalDaysScheduleCopyWith<
    $R,
    $In extends IntervalDaysSchedule,
    $Out> implements SchedulingStrategyCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationTimes;
  @override
  $R call({int? intervalDays, List<TimeOfDay>? notificationTimes});
  IntervalDaysScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _IntervalDaysScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntervalDaysSchedule, $Out>
    implements IntervalDaysScheduleCopyWith<$R, IntervalDaysSchedule, $Out> {
  _IntervalDaysScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntervalDaysSchedule> $mapper =
      IntervalDaysScheduleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationTimes => ListCopyWith(
            $value.notificationTimes,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(notificationTimes: v),
          );
  @override
  $R call({int? intervalDays, List<TimeOfDay>? notificationTimes}) => $apply(
        FieldCopyWithData({
          if (intervalDays != null) #intervalDays: intervalDays,
          if (notificationTimes != null) #notificationTimes: notificationTimes,
        }),
      );
  @override
  IntervalDaysSchedule $make(CopyWithData data) => IntervalDaysSchedule(
        intervalDays: data.get(#intervalDays, or: $value.intervalDays),
        notificationTimes: data.get(
          #notificationTimes,
          or: $value.notificationTimes,
        ),
      );

  @override
  IntervalDaysScheduleCopyWith<$R2, IntervalDaysSchedule, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IntervalDaysScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DailyScheduleMapper extends SubClassMapperBase<DailySchedule> {
  DailyScheduleMapper._();

  static DailyScheduleMapper? _instance;
  static DailyScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DailyScheduleMapper._());
      SchedulingStrategyMapper.ensureInitialized().addSubMapper(_instance!);
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'DailySchedule';

  static List<TimeOfDay> _$intakeTimes(DailySchedule v) => v.intakeTimes;
  static const Field<DailySchedule, List<TimeOfDay>> _f$intakeTimes = Field(
    'intakeTimes',
    _$intakeTimes,
  );
  static bool _$notify(DailySchedule v) => v.notify;
  static const Field<DailySchedule, bool> _f$notify = Field(
    'notify',
    _$notify,
    opt: true,
    def: true,
  );

  @override
  final MappableFields<DailySchedule> fields = const {
    #intakeTimes: _f$intakeTimes,
    #notify: _f$notify,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'daily';
  @override
  late final ClassMapperBase superMapper =
      SchedulingStrategyMapper.ensureInitialized();

  static DailySchedule _instantiate(DecodingData data) {
    return DailySchedule(
      intakeTimes: data.dec(_f$intakeTimes),
      notify: data.dec(_f$notify),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static DailySchedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DailySchedule>(map);
  }

  static DailySchedule fromJson(String json) {
    return ensureInitialized().decodeJson<DailySchedule>(json);
  }
}

mixin DailyScheduleMappable {
  String toJson() {
    return DailyScheduleMapper.ensureInitialized().encodeJson<DailySchedule>(
      this as DailySchedule,
    );
  }

  Map<String, dynamic> toMap() {
    return DailyScheduleMapper.ensureInitialized().encodeMap<DailySchedule>(
      this as DailySchedule,
    );
  }

  DailyScheduleCopyWith<DailySchedule, DailySchedule, DailySchedule>
      get copyWith => _DailyScheduleCopyWithImpl<DailySchedule, DailySchedule>(
            this as DailySchedule,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return DailyScheduleMapper.ensureInitialized().stringifyValue(
      this as DailySchedule,
    );
  }

  @override
  bool operator ==(Object other) {
    return DailyScheduleMapper.ensureInitialized().equalsValue(
      this as DailySchedule,
      other,
    );
  }

  @override
  int get hashCode {
    return DailyScheduleMapper.ensureInitialized().hashValue(
      this as DailySchedule,
    );
  }
}

extension DailyScheduleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DailySchedule, $Out> {
  DailyScheduleCopyWith<$R, DailySchedule, $Out> get $asDailySchedule =>
      $base.as((v, t, t2) => _DailyScheduleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DailyScheduleCopyWith<$R, $In extends DailySchedule, $Out>
    implements SchedulingStrategyCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get intakeTimes;
  @override
  $R call({List<TimeOfDay>? intakeTimes, bool? notify});
  DailyScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DailyScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DailySchedule, $Out>
    implements DailyScheduleCopyWith<$R, DailySchedule, $Out> {
  _DailyScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DailySchedule> $mapper =
      DailyScheduleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get intakeTimes => ListCopyWith(
            $value.intakeTimes,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(intakeTimes: v),
          );
  @override
  $R call({List<TimeOfDay>? intakeTimes, bool? notify}) => $apply(
        FieldCopyWithData({
          if (intakeTimes != null) #intakeTimes: intakeTimes,
          if (notify != null) #notify: notify,
        }),
      );
  @override
  DailySchedule $make(CopyWithData data) => DailySchedule(
        intakeTimes: data.get(#intakeTimes, or: $value.intakeTimes),
        notify: data.get(#notify, or: $value.notify),
      );

  @override
  DailyScheduleCopyWith<$R2, DailySchedule, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _DailyScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WeeklyScheduleMapper extends SubClassMapperBase<WeeklySchedule> {
  WeeklyScheduleMapper._();

  static WeeklyScheduleMapper? _instance;
  static WeeklyScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeeklyScheduleMapper._());
      SchedulingStrategyMapper.ensureInitialized().addSubMapper(_instance!);
      MapperContainer.globals.useAll([TimeOfDayMapper()]);
    }
    return _instance!;
  }

  @override
  final String id = 'WeeklySchedule';

  static List<int> _$daysOfWeek(WeeklySchedule v) => v.daysOfWeek;
  static const Field<WeeklySchedule, List<int>> _f$daysOfWeek = Field(
    'daysOfWeek',
    _$daysOfWeek,
  );
  static List<TimeOfDay> _$notificationTimes(WeeklySchedule v) =>
      v.notificationTimes;
  static const Field<WeeklySchedule, List<TimeOfDay>> _f$notificationTimes =
      Field('notificationTimes', _$notificationTimes, opt: true, def: const []);

  @override
  final MappableFields<WeeklySchedule> fields = const {
    #daysOfWeek: _f$daysOfWeek,
    #notificationTimes: _f$notificationTimes,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'weekly';
  @override
  late final ClassMapperBase superMapper =
      SchedulingStrategyMapper.ensureInitialized();

  static WeeklySchedule _instantiate(DecodingData data) {
    return WeeklySchedule(
      daysOfWeek: data.dec(_f$daysOfWeek),
      notificationTimes: data.dec(_f$notificationTimes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WeeklySchedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WeeklySchedule>(map);
  }

  static WeeklySchedule fromJson(String json) {
    return ensureInitialized().decodeJson<WeeklySchedule>(json);
  }
}

mixin WeeklyScheduleMappable {
  String toJson() {
    return WeeklyScheduleMapper.ensureInitialized().encodeJson<WeeklySchedule>(
      this as WeeklySchedule,
    );
  }

  Map<String, dynamic> toMap() {
    return WeeklyScheduleMapper.ensureInitialized().encodeMap<WeeklySchedule>(
      this as WeeklySchedule,
    );
  }

  WeeklyScheduleCopyWith<WeeklySchedule, WeeklySchedule, WeeklySchedule>
      get copyWith =>
          _WeeklyScheduleCopyWithImpl<WeeklySchedule, WeeklySchedule>(
            this as WeeklySchedule,
            $identity,
            $identity,
          );
  @override
  String toString() {
    return WeeklyScheduleMapper.ensureInitialized().stringifyValue(
      this as WeeklySchedule,
    );
  }

  @override
  bool operator ==(Object other) {
    return WeeklyScheduleMapper.ensureInitialized().equalsValue(
      this as WeeklySchedule,
      other,
    );
  }

  @override
  int get hashCode {
    return WeeklyScheduleMapper.ensureInitialized().hashValue(
      this as WeeklySchedule,
    );
  }
}

extension WeeklyScheduleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WeeklySchedule, $Out> {
  WeeklyScheduleCopyWith<$R, WeeklySchedule, $Out> get $asWeeklySchedule =>
      $base.as((v, t, t2) => _WeeklyScheduleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WeeklyScheduleCopyWith<$R, $In extends WeeklySchedule, $Out>
    implements SchedulingStrategyCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get daysOfWeek;
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationTimes;
  @override
  $R call({List<int>? daysOfWeek, List<TimeOfDay>? notificationTimes});
  WeeklyScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _WeeklyScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WeeklySchedule, $Out>
    implements WeeklyScheduleCopyWith<$R, WeeklySchedule, $Out> {
  _WeeklyScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WeeklySchedule> $mapper =
      WeeklyScheduleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get daysOfWeek =>
      ListCopyWith(
        $value.daysOfWeek,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(daysOfWeek: v),
      );
  @override
  ListCopyWith<$R, TimeOfDay, ObjectCopyWith<$R, TimeOfDay, TimeOfDay>>
      get notificationTimes => ListCopyWith(
            $value.notificationTimes,
            (v, t) => ObjectCopyWith(v, $identity, t),
            (v) => call(notificationTimes: v),
          );
  @override
  $R call({List<int>? daysOfWeek, List<TimeOfDay>? notificationTimes}) =>
      $apply(
        FieldCopyWithData({
          if (daysOfWeek != null) #daysOfWeek: daysOfWeek,
          if (notificationTimes != null) #notificationTimes: notificationTimes,
        }),
      );
  @override
  WeeklySchedule $make(CopyWithData data) => WeeklySchedule(
        daysOfWeek: data.get(#daysOfWeek, or: $value.daysOfWeek),
        notificationTimes: data.get(
          #notificationTimes,
          or: $value.notificationTimes,
        ),
      );

  @override
  WeeklyScheduleCopyWith<$R2, WeeklySchedule, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _WeeklyScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
