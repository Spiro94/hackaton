// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Treatment _$TreatmentFromJson(Map<String, dynamic> json) {
  return _Treatment.fromJson(json);
}

/// @nodoc
mixin _$Treatment {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<MedicationOrder> get medicationOrders =>
      throw _privateConstructorUsedError;
  List<MedicalDeviceOrder> get medicalDeviceOrders =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreatmentCopyWith<Treatment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentCopyWith<$Res> {
  factory $TreatmentCopyWith(Treatment value, $Res Function(Treatment) then) =
      _$TreatmentCopyWithImpl<$Res, Treatment>;
  @useResult
  $Res call(
      {String id,
      String? name,
      List<MedicationOrder> medicationOrders,
      List<MedicalDeviceOrder> medicalDeviceOrders});
}

/// @nodoc
class _$TreatmentCopyWithImpl<$Res, $Val extends Treatment>
    implements $TreatmentCopyWith<$Res> {
  _$TreatmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? medicationOrders = null,
    Object? medicalDeviceOrders = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      medicationOrders: null == medicationOrders
          ? _value.medicationOrders
          : medicationOrders // ignore: cast_nullable_to_non_nullable
              as List<MedicationOrder>,
      medicalDeviceOrders: null == medicalDeviceOrders
          ? _value.medicalDeviceOrders
          : medicalDeviceOrders // ignore: cast_nullable_to_non_nullable
              as List<MedicalDeviceOrder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TreatmentCopyWith<$Res> implements $TreatmentCopyWith<$Res> {
  factory _$$_TreatmentCopyWith(
          _$_Treatment value, $Res Function(_$_Treatment) then) =
      __$$_TreatmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      List<MedicationOrder> medicationOrders,
      List<MedicalDeviceOrder> medicalDeviceOrders});
}

/// @nodoc
class __$$_TreatmentCopyWithImpl<$Res>
    extends _$TreatmentCopyWithImpl<$Res, _$_Treatment>
    implements _$$_TreatmentCopyWith<$Res> {
  __$$_TreatmentCopyWithImpl(
      _$_Treatment _value, $Res Function(_$_Treatment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? medicationOrders = null,
    Object? medicalDeviceOrders = null,
  }) {
    return _then(_$_Treatment(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      medicationOrders: null == medicationOrders
          ? _value._medicationOrders
          : medicationOrders // ignore: cast_nullable_to_non_nullable
              as List<MedicationOrder>,
      medicalDeviceOrders: null == medicalDeviceOrders
          ? _value._medicalDeviceOrders
          : medicalDeviceOrders // ignore: cast_nullable_to_non_nullable
              as List<MedicalDeviceOrder>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Treatment implements _Treatment {
  _$_Treatment(
      {required this.id,
      this.name,
      required final List<MedicationOrder> medicationOrders,
      final List<MedicalDeviceOrder> medicalDeviceOrders = const []})
      : _medicationOrders = medicationOrders,
        _medicalDeviceOrders = medicalDeviceOrders;

  factory _$_Treatment.fromJson(Map<String, dynamic> json) =>
      _$$_TreatmentFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  final List<MedicationOrder> _medicationOrders;
  @override
  List<MedicationOrder> get medicationOrders {
    if (_medicationOrders is EqualUnmodifiableListView)
      return _medicationOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicationOrders);
  }

  final List<MedicalDeviceOrder> _medicalDeviceOrders;
  @override
  @JsonKey()
  List<MedicalDeviceOrder> get medicalDeviceOrders {
    if (_medicalDeviceOrders is EqualUnmodifiableListView)
      return _medicalDeviceOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalDeviceOrders);
  }

  @override
  String toString() {
    return 'Treatment(id: $id, name: $name, medicationOrders: $medicationOrders, medicalDeviceOrders: $medicalDeviceOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Treatment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._medicationOrders, _medicationOrders) &&
            const DeepCollectionEquality()
                .equals(other._medicalDeviceOrders, _medicalDeviceOrders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_medicationOrders),
      const DeepCollectionEquality().hash(_medicalDeviceOrders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreatmentCopyWith<_$_Treatment> get copyWith =>
      __$$_TreatmentCopyWithImpl<_$_Treatment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreatmentToJson(
      this,
    );
  }
}

abstract class _Treatment implements Treatment {
  factory _Treatment(
      {required final String id,
      final String? name,
      required final List<MedicationOrder> medicationOrders,
      final List<MedicalDeviceOrder> medicalDeviceOrders}) = _$_Treatment;

  factory _Treatment.fromJson(Map<String, dynamic> json) =
      _$_Treatment.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  List<MedicationOrder> get medicationOrders;
  @override
  List<MedicalDeviceOrder> get medicalDeviceOrders;
  @override
  @JsonKey(ignore: true)
  _$$_TreatmentCopyWith<_$_Treatment> get copyWith =>
      throw _privateConstructorUsedError;
}
