// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  // @JsonSerializable(fieldRename: FieldRename.)
  factory UserEntity({
    required String id,
    required String accountantId,
    required String email,
    required String firstName,
    required String lastName,
    required String image,
    required String user,
    required String legalNumber,
    required String homeNumber,
    required String city,
    required String zipCode,
    required String jobType,
    required String companyType,
    required String bankName,
    required String iban,
    required String mobileNumber,
    required String status,
    @JsonKey(includeIfNull: false) String? taxId,
    @JsonKey(includeIfNull: false) String? notes,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
