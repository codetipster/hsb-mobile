// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportEntity _$$_ReportEntityFromJson(Map<String, dynamic> json) =>
    _$_ReportEntity(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      name: json['name'] as String,
      file: json['file'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ReportEntityToJson(_$_ReportEntity instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'clientId': instance.clientId,
    'name': instance.name,
    'file': instance.file,
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
