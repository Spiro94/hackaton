// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Treatment _$$_TreatmentFromJson(Map<String, dynamic> json) => _$_Treatment(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      name: json['name'] as String?,
      medicationOrders: (json['medicationOrders'] as List<dynamic>)
          .map((e) => MedicationOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalDeviceOrders: (json['medicalDeviceOrders'] as List<dynamic>?)
              ?.map(
                  (e) => MedicalDeviceOrder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TreatmentToJson(_$_Treatment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'name': instance.name,
      'medicationOrders': instance.medicationOrders,
      'medicalDeviceOrders': instance.medicalDeviceOrders,
    };
