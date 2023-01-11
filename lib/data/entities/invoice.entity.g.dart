// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvoiceEntity _$$_InvoiceEntityFromJson(Map<String, dynamic> json) =>
    _$_InvoiceEntity(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_InvoiceEntityToJson(_$_InvoiceEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'clientId': instance.clientId,
    'name': instance.name,
    'image': instance.image,
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
