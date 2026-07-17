// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'molecule.dart';

class MoleculeMapper extends ClassMapperBase<Molecule> {
  MoleculeMapper._();

  static MoleculeMapper? _instance;
  static MoleculeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MoleculeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Molecule';

  static String _$name(Molecule v) => v.name;
  static const Field<Molecule, String> _f$name = Field('name', _$name);
  static String _$unit(Molecule v) => v.unit;
  static const Field<Molecule, String> _f$unit = Field('unit', _$unit);

  @override
  final MappableFields<Molecule> fields = const {
    #name: _f$name,
    #unit: _f$unit,
  };

  static Molecule _instantiate(DecodingData data) {
    return Molecule(name: data.dec(_f$name), unit: data.dec(_f$unit));
  }

  @override
  final Function instantiate = _instantiate;

  static Molecule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Molecule>(map);
  }

  static Molecule fromJson(String json) {
    return ensureInitialized().decodeJson<Molecule>(json);
  }
}

mixin MoleculeMappable {
  String toJson() {
    return MoleculeMapper.ensureInitialized().encodeJson<Molecule>(
      this as Molecule,
    );
  }

  Map<String, dynamic> toMap() {
    return MoleculeMapper.ensureInitialized().encodeMap<Molecule>(
      this as Molecule,
    );
  }

  MoleculeCopyWith<Molecule, Molecule, Molecule> get copyWith =>
      _MoleculeCopyWithImpl<Molecule, Molecule>(
        this as Molecule,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MoleculeMapper.ensureInitialized().stringifyValue(this as Molecule);
  }

  @override
  bool operator ==(Object other) {
    return MoleculeMapper.ensureInitialized().equalsValue(
      this as Molecule,
      other,
    );
  }

  @override
  int get hashCode {
    return MoleculeMapper.ensureInitialized().hashValue(this as Molecule);
  }
}

extension MoleculeValueCopy<$R, $Out> on ObjectCopyWith<$R, Molecule, $Out> {
  MoleculeCopyWith<$R, Molecule, $Out> get $asMolecule =>
      $base.as((v, t, t2) => _MoleculeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MoleculeCopyWith<$R, $In extends Molecule, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? unit});
  MoleculeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MoleculeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Molecule, $Out>
    implements MoleculeCopyWith<$R, Molecule, $Out> {
  _MoleculeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Molecule> $mapper =
      MoleculeMapper.ensureInitialized();
  @override
  $R call({String? name, String? unit}) => $apply(
        FieldCopyWithData({
          if (name != null) #name: name,
          if (unit != null) #unit: unit,
        }),
      );
  @override
  Molecule $make(CopyWithData data) => Molecule(
        name: data.get(#name, or: $value.name),
        unit: data.get(#unit, or: $value.unit),
      );

  @override
  MoleculeCopyWith<$R2, Molecule, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) =>
      _MoleculeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
