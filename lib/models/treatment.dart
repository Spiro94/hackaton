import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackaton/models/medical_device_order.dart';
import 'package:hackaton/models/medication_order.dart';

part 'treatment.freezed.dart';
part 'treatment.g.dart';

@freezed
class Treatment with _$Treatment {
  factory Treatment({
    required String id,
    String? name,
    required List<MedicationOrder> medicationOrders,
    @Default([]) List<MedicalDeviceOrder> medicalDeviceOrders,
  }) = _Treatment;

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);
}
