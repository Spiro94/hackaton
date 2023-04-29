import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_device_order.freezed.dart';
part 'medical_device_order.g.dart';

@freezed
class MedicalDeviceOrder with _$MedicalDeviceOrder {
  factory MedicalDeviceOrder({
    required String deviceName,
    required String frequency,
  }) = _MedicalDeviceOrder;

  factory MedicalDeviceOrder.fromJson(Map<String, dynamic> json) =>
      _$MedicalDeviceOrderFromJson(json);
}
