// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      id: json['id'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      birthday: json['birthday'] as String,
      email: json['email'] as String,
      document: json['document'] as String,
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastName': instance.lastName,
      'birthday': instance.birthday,
      'email': instance.email,
      'document': instance.document,
    };
