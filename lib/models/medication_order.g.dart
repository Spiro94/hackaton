// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicationOrder _$$_MedicationOrderFromJson(Map<String, dynamic> json) =>
    _$_MedicationOrder(
      medication: json['medication'] as String,
      dose: json['dose'] as int,
      dosageUnit: json['dosageUnit'] as String,
      frequency: json['frequency'] as String,
    );

Map<String, dynamic> _$$_MedicationOrderToJson(_$_MedicationOrder instance) =>
    <String, dynamic>{
      'medication': instance.medication,
      'dose': instance.dose,
      'dosageUnit': instance.dosageUnit,
      'frequency': instance.frequency,
    };
