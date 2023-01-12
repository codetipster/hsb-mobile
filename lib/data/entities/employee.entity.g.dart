// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeEntity _$$_EmployeeEntityFromJson(Map<String, dynamic> json) =>
    _$_EmployeeEntity(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      company: json['company'] as String,
      name: json['name'] as String,
      firstName: json['firstName'] as String,
      birthName: json['birthName'] as String,
      birthDate: json['birthDate'] as String,
      birthPlace: json['birthPlace'] as String,
      nationality: json['nationality'] as String,
      homeNumber: json['homeNumber'] as String,
      postalCode: json['postalCode'] as String,
      jobTitle: json['jobTitle'] as String,
      healthInsurance: json['healthInsurance'] as String,
      bankName: json['bankName'] as String,
      iban: json['iban'] as String,
      salary: json['salary'] as String,
      employmentType: json['employmentType'] as String,
      beginning: json['beginning'] as String,
      taxNumber: json['taxNumber'] as String,
      socialNumber: json['socialNumber'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_EmployeeEntityToJson(_$_EmployeeEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'clientId': instance.clientId,
    'company': instance.company,
    'name': instance.name,
    'firstName': instance.firstName,
    'birthName': instance.birthName,
    'birthDate': instance.birthDate,
    'birthPlace': instance.birthPlace,
    'nationality': instance.nationality,
    'homeNumber': instance.homeNumber,
    'postalCode': instance.postalCode,
    'jobTitle': instance.jobTitle,
    'healthInsurance': instance.healthInsurance,
    'bankName': instance.bankName,
    'iban': instance.iban,
    'salary': instance.salary,
    'employmentType': instance.employmentType,
    'beginning': instance.beginning,
    'taxNumber': instance.taxNumber,
    'socialNumber': instance.socialNumber,
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
