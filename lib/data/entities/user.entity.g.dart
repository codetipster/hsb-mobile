// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['id'] as String,
      accountantId: json['accountantId'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      image: json['image'] as String,
      user: json['user'] as String,
      legalNumber: json['legalNumber'] as String,
      homeNumber: json['homeNumber'] as String,
      city: json['city'] as String,
      zipCode: json['zipCode'] as String,
      jobType: json['jobType'] as String,
      companyType: json['companyType'] as String,
      bankName: json['bankName'] as String,
      iban: json['iban'] as String,
      mobileNumber: json['mobileNumber'] as String,
      status: json['status'] as String,
      taxId: json['taxId'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'accountantId': instance.accountantId,
    'email': instance.email,
    'firstName': instance.firstName,
    'lastName': instance.lastName,
    'image': instance.image,
    'user': instance.user,
    'legalNumber': instance.legalNumber,
    'homeNumber': instance.homeNumber,
    'city': instance.city,
    'zipCode': instance.zipCode,
    'jobType': instance.jobType,
    'companyType': instance.companyType,
    'bankName': instance.bankName,
    'iban': instance.iban,
    'mobileNumber': instance.mobileNumber,
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('taxId', instance.taxId);
  writeNotNull('notes', instance.notes);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
