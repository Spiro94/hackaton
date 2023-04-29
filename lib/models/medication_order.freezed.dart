// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicationOrder _$MedicationOrderFromJson(Map<String, dynamic> json) {
  return _MedicationOrder.fromJson(json);
}

/// @nodoc
mixin _$MedicationOrder {
  String get medication => throw _privateConstructorUsedError;
  int get dose => throw _privateConstructorUsedError;
  String get dosageUnit => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationOrderCopyWith<MedicationOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationOrderCopyWith<$Res> {
  factory $MedicationOrderCopyWith(
          MedicationOrder value, $Res Function(MedicationOrder) then) =
      _$MedicationOrderCopyWithImpl<$Res, MedicationOrder>;
  @useResult
  $Res call({String medication, int dose, String dosageUnit, String frequency});
}

/// @nodoc
class _$MedicationOrderCopyWithImpl<$Res, $Val extends MedicationOrder>
    implements $MedicationOrderCopyWith<$Res> {
  _$MedicationOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medication = null,
    Object? dose = null,
    Object? dosageUnit = null,
    Object? frequency = null,
  }) {
    return _then(_value.copyWith(
      medication: null == medication
          ? _value.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as String,
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicationOrderCopyWith<$Res>
    implements $MedicationOrderCopyWith<$Res> {
  factory _$$_MedicationOrderCopyWith(
          _$_MedicationOrder value, $Res Function(_$_MedicationOrder) then) =
      __$$_MedicationOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String medication, int dose, String dosageUnit, String frequency});
}

/// @nodoc
class __$$_MedicationOrderCopyWithImpl<$Res>
    extends _$MedicationOrderCopyWithImpl<$Res, _$_MedicationOrder>
    implements _$$_MedicationOrderCopyWith<$Res> {
  __$$_MedicationOrderCopyWithImpl(
      _$_MedicationOrder _value, $Res Function(_$_MedicationOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medication = null,
    Object? dose = null,
    Object? dosageUnit = null,
    Object? frequency = null,
  }) {
    return _then(_$_MedicationOrder(
      medication: null == medication
          ? _value.medication
          : medication // ignore: cast_nullable_to_non_nullable
              as String,
      dose: null == dose
          ? _value.dose
          : dose // ignore: cast_nullable_to_non_nullable
              as int,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicationOrder implements _MedicationOrder {
  _$_MedicationOrder(
      {required this.medication,
      required this.dose,
      required this.dosageUnit,
      required this.frequency});

  factory _$_MedicationOrder.fromJson(Map<String, dynamic> json) =>
      _$$_MedicationOrderFromJson(json);

  @override
  final String medication;
  @override
  final int dose;
  @override
  final String dosageUnit;
  @override
  final String frequency;

  @override
  String toString() {
    return 'MedicationOrder(medication: $medication, dose: $dose, dosageUnit: $dosageUnit, frequency: $frequency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicationOrder &&
            (identical(other.medication, medication) ||
                other.medication == medication) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.dosageUnit, dosageUnit) ||
                other.dosageUnit == dosageUnit) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, medication, dose, dosageUnit, frequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicationOrderCopyWith<_$_MedicationOrder> get copyWith =>
      __$$_MedicationOrderCopyWithImpl<_$_MedicationOrder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicationOrderToJson(
      this,
    );
  }
}

abstract class _MedicationOrder implements MedicationOrder {
  factory _MedicationOrder(
      {required final String medication,
      required final int dose,
      required final String dosageUnit,
      required final String frequency}) = _$_MedicationOrder;

  factory _MedicationOrder.fromJson(Map<String, dynamic> json) =
      _$_MedicationOrder.fromJson;

  @override
  String get medication;
  @override
  int get dose;
  @override
  String get dosageUnit;
  @override
  String get frequency;
  @override
  @JsonKey(ignore: true)
  _$$_MedicationOrderCopyWith<_$_MedicationOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
