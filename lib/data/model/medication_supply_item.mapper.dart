// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'medication_supply_item.dart';

class MedicationSupplyItemMapper
    extends SubClassMapperBase<MedicationSupplyItem> {
  MedicationSupplyItemMapper._();

  static MedicationSupplyItemMapper? _instance;
  static MedicationSupplyItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MedicationSupplyItemMapper._());
      SupplyItemMapper.ensureInitialized().addSubMapper(_instance!);
      MapperContainer.globals.useAll([
        DateStringMapper(),
        DecimalStringMapper(),
        EsterNameMapper(),
      ]);
      MoleculeMapper.ensureInitialized();
      AdministrationRouteMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MedicationSupplyItem';

  static int _$id(MedicationSupplyItem v) => v.id;
  static const Field<MedicationSupplyItem, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String _$name(MedicationSupplyItem v) => v.name;
  static const Field<MedicationSupplyItem, String> _f$name = Field(
    'name',
    _$name,
  );
  static Decimal _$totalDose(MedicationSupplyItem v) => v.totalDose;
  static const Field<MedicationSupplyItem, Decimal> _f$totalDose = Field(
    'totalDose',
    _$totalDose,
  );
  static Decimal _$concentration(MedicationSupplyItem v) => v.concentration;
  static const Field<MedicationSupplyItem, Decimal> _f$concentration = Field(
    'concentration',
    _$concentration,
  );
  static Decimal _$usedDose(MedicationSupplyItem v) => v.usedDose;
  static const Field<MedicationSupplyItem, Decimal> _f$usedDose = Field(
    'usedDose',
    _$usedDose,
    opt: true,
  );
  static Molecule _$molecule(MedicationSupplyItem v) => v.molecule;
  static const Field<MedicationSupplyItem, Molecule> _f$molecule = Field(
    'molecule',
    _$molecule,
    hook: JsonStringHook(),
  );
  static AdministrationRoute _$administrationRoute(MedicationSupplyItem v) =>
      v.administrationRoute;
  static const Field<MedicationSupplyItem, AdministrationRoute>
      _f$administrationRoute =
      Field('administrationRoute', _$administrationRoute);
  static Ester? _$ester(MedicationSupplyItem v) => v.ester;
  static const Field<MedicationSupplyItem, Ester> _f$ester = Field(
    'ester',
    _$ester,
    opt: true,
  );

  @override
  final MappableFields<MedicationSupplyItem> fields = const {
    #id: _f$id,
    #name: _f$name,
    #totalDose: _f$totalDose,
    #concentration: _f$concentration,
    #usedDose: _f$usedDose,
    #molecule: _f$molecule,
    #administrationRoute: _f$administrationRoute,
    #ester: _f$ester,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'medication';
  @override
  late final ClassMapperBase superMapper = SupplyItemMapper.ensureInitialized();

  static MedicationSupplyItem _instantiate(DecodingData data) {
    return MedicationSupplyItem(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      totalDose: data.dec(_f$totalDose),
      concentration: data.dec(_f$concentration),
      usedDose: data.dec(_f$usedDose),
      molecule: data.dec(_f$molecule),
      administrationRoute: data.dec(_f$administrationRoute),
      ester: data.dec(_f$ester),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MedicationSupplyItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MedicationSupplyItem>(map);
  }

  static MedicationSupplyItem fromJson(String json) {
    return ensureInitialized().decodeJson<MedicationSupplyItem>(json);
  }
}

mixin MedicationSupplyItemMappable {
  String toJson() {
    return MedicationSupplyItemMapper.ensureInitialized()
        .encodeJson<MedicationSupplyItem>(this as MedicationSupplyItem);
  }

  Map<String, dynamic> toMap() {
    return MedicationSupplyItemMapper.ensureInitialized()
        .encodeMap<MedicationSupplyItem>(this as MedicationSupplyItem);
  }

  MedicationSupplyItemCopyWith<MedicationSupplyItem, MedicationSupplyItem,
      MedicationSupplyItem> get copyWith => _MedicationSupplyItemCopyWithImpl<
          MedicationSupplyItem, MedicationSupplyItem>(
      this as MedicationSupplyItem, $identity, $identity);
  @override
  String toString() {
    return MedicationSupplyItemMapper.ensureInitialized().stringifyValue(
      this as MedicationSupplyItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return MedicationSupplyItemMapper.ensureInitialized().equalsValue(
      this as MedicationSupplyItem,
      other,
    );
  }

  @override
  int get hashCode {
    return MedicationSupplyItemMapper.ensureInitialized().hashValue(
      this as MedicationSupplyItem,
    );
  }
}

extension MedicationSupplyItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MedicationSupplyItem, $Out> {
  MedicationSupplyItemCopyWith<$R, MedicationSupplyItem, $Out>
      get $asMedicationSupplyItem => $base.as(
            (v, t, t2) => _MedicationSupplyItemCopyWithImpl<$R, $Out>(v, t, t2),
          );
}

abstract class MedicationSupplyItemCopyWith<
    $R,
    $In extends MedicationSupplyItem,
    $Out> implements SupplyItemCopyWith<$R, $In, $Out> {
  MoleculeCopyWith<$R, Molecule, Molecule> get molecule;
  @override
  $R call({
    int? id,
    String? name,
    Decimal? totalDose,
    Decimal? concentration,
    Decimal? usedDose,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Ester? ester,
  });
  MedicationSupplyItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _MedicationSupplyItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MedicationSupplyItem, $Out>
    implements MedicationSupplyItemCopyWith<$R, MedicationSupplyItem, $Out> {
  _MedicationSupplyItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MedicationSupplyItem> $mapper =
      MedicationSupplyItemMapper.ensureInitialized();
  @override
  MoleculeCopyWith<$R, Molecule, Molecule> get molecule =>
      $value.molecule.copyWith.$chain((v) => call(molecule: v));
  @override
  $R call({
    Object? id = $none,
    String? name,
    Decimal? totalDose,
    Decimal? concentration,
    Object? usedDose = $none,
    Molecule? molecule,
    AdministrationRoute? administrationRoute,
    Object? ester = $none,
  }) =>
      $apply(
        FieldCopyWithData({
          if (id != $none) #id: id,
          if (name != null) #name: name,
          if (totalDose != null) #totalDose: totalDose,
          if (concentration != null) #concentration: concentration,
          if (usedDose != $none) #usedDose: usedDose,
          if (molecule != null) #molecule: molecule,
          if (administrationRoute != null)
            #administrationRoute: administrationRoute,
          if (ester != $none) #ester: ester,
        }),
      );
  @override
  MedicationSupplyItem $make(CopyWithData data) => MedicationSupplyItem(
        id: data.get(#id, or: $value.id),
        name: data.get(#name, or: $value.name),
        totalDose: data.get(#totalDose, or: $value.totalDose),
        concentration: data.get(#concentration, or: $value.concentration),
        usedDose: data.get(#usedDose, or: $value.usedDose),
        molecule: data.get(#molecule, or: $value.molecule),
        administrationRoute: data.get(
          #administrationRoute,
          or: $value.administrationRoute,
        ),
        ester: data.get(#ester, or: $value.ester),
      );

  @override
  MedicationSupplyItemCopyWith<$R2, MedicationSupplyItem, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _MedicationSupplyItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
