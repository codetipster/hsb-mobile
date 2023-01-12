// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'invoice.entity.freezed.dart';
part 'invoice.entity.g.dart';

@freezed
abstract class InvoiceEntity with _$InvoiceEntity {
  // @JsonSerializable(fieldRename: FieldRename.)
  factory InvoiceEntity({
    required String id,
    required String clientId,
    required String name,
    required String image,
    required String status,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
  }) = _InvoiceEntity;

  factory InvoiceEntity.fromJson(Map<String, dynamic> json) =>
      _$InvoiceEntityFromJson(json);
}
