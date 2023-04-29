// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_device_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MedicalDeviceOrder _$MedicalDeviceOrderFromJson(Map<String, dynamic> json) {
  return _MedicalDeviceOrder.fromJson(json);
}

/// @nodoc
mixin _$MedicalDeviceOrder {
  String get deviceName => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicalDeviceOrderCopyWith<MedicalDeviceOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalDeviceOrderCopyWith<$Res> {
  factory $MedicalDeviceOrderCopyWith(
          MedicalDeviceOrder value, $Res Function(MedicalDeviceOrder) then) =
      _$MedicalDeviceOrderCopyWithImpl<$Res, MedicalDeviceOrder>;
  @useResult
  $Res call({String deviceName, String frequency});
}

/// @nodoc
class _$MedicalDeviceOrderCopyWithImpl<$Res, $Val extends MedicalDeviceOrder>
    implements $MedicalDeviceOrderCopyWith<$Res> {
  _$MedicalDeviceOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? frequency = null,
  }) {
    return _then(_value.copyWith(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MedicalDeviceOrderCopyWith<$Res>
    implements $MedicalDeviceOrderCopyWith<$Res> {
  factory _$$_MedicalDeviceOrderCopyWith(_$_MedicalDeviceOrder value,
          $Res Function(_$_MedicalDeviceOrder) then) =
      __$$_MedicalDeviceOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceName, String frequency});
}

/// @nodoc
class __$$_MedicalDeviceOrderCopyWithImpl<$Res>
    extends _$MedicalDeviceOrderCopyWithImpl<$Res, _$_MedicalDeviceOrder>
    implements _$$_MedicalDeviceOrderCopyWith<$Res> {
  __$$_MedicalDeviceOrderCopyWithImpl(
      _$_MedicalDeviceOrder _value, $Res Function(_$_MedicalDeviceOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? frequency = null,
  }) {
    return _then(_$_MedicalDeviceOrder(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
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
class _$_MedicalDeviceOrder implements _MedicalDeviceOrder {
  _$_MedicalDeviceOrder({required this.deviceName, required this.frequency});

  factory _$_MedicalDeviceOrder.fromJson(Map<String, dynamic> json) =>
      _$$_MedicalDeviceOrderFromJson(json);

  @override
  final String deviceName;
  @override
  final String frequency;

  @override
  String toString() {
    return 'MedicalDeviceOrder(deviceName: $deviceName, frequency: $frequency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicalDeviceOrder &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceName, frequency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MedicalDeviceOrderCopyWith<_$_MedicalDeviceOrder> get copyWith =>
      __$$_MedicalDeviceOrderCopyWithImpl<_$_MedicalDeviceOrder>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicalDeviceOrderToJson(
      this,
    );
  }
}

abstract class _MedicalDeviceOrder implements MedicalDeviceOrder {
  factory _MedicalDeviceOrder(
      {required final String deviceName,
      required final String frequency}) = _$_MedicalDeviceOrder;

  factory _MedicalDeviceOrder.fromJson(Map<String, dynamic> json) =
      _$_MedicalDeviceOrder.fromJson;

  @override
  String get deviceName;
  @override
  String get frequency;
  @override
  @JsonKey(ignore: true)
  _$$_MedicalDeviceOrderCopyWith<_$_MedicalDeviceOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
