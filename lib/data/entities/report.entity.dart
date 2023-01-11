// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'report.entity.freezed.dart';
part 'report.entity.g.dart';

@freezed
abstract class ReportEntity with _$ReportEntity {
  // @JsonSerializable(fieldRename: FieldRename.)
  factory ReportEntity({
    required String id,
    required String clientId,
    required String name,
    required String file,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
  }) = _ReportEntity;

  factory ReportEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportEntityFromJson(json);
}
