// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee.entity.freezed.dart';
part 'employee.entity.g.dart';

@freezed
abstract class EmployeeEntity with _$EmployeeEntity {
  // @JsonSerializable(fieldRename: FieldRename.)
  factory EmployeeEntity({
    required String id,
    required String clientId,
    required String company,
    required String name,
    required String firstName,
    required String birthName,
    required String birthDate,
    required String birthPlace,
    required String nationality,
    required String homeNumber,
    required String postalCode,
    required String jobTitle,
    required String healthInsurance,
    required String bankName,
    required String iban,
    required String salary,
    required String employmentType,
    required String beginning,
    required String taxNumber,
    required String socialNumber,
    required String status,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
  }) = _EmployeeEntity;

  factory EmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEntityFromJson(json);
}
