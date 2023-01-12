// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get accountantId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get legalNumber => throw _privateConstructorUsedError;
  String get homeNumber => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String get jobType => throw _privateConstructorUsedError;
  String get companyType => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String get iban => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get taxId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {String id,
      String accountantId,
      String email,
      String firstName,
      String lastName,
      String image,
      String user,
      String legalNumber,
      String homeNumber,
      String city,
      String zipCode,
      String jobType,
      String companyType,
      String bankName,
      String iban,
      String mobileNumber,
      String status,
      @JsonKey(includeIfNull: false) String? taxId,
      @JsonKey(includeIfNull: false) String? notes,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountantId = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = null,
    Object? user = null,
    Object? legalNumber = null,
    Object? homeNumber = null,
    Object? city = null,
    Object? zipCode = null,
    Object? jobType = null,
    Object? companyType = null,
    Object? bankName = null,
    Object? iban = null,
    Object? mobileNumber = null,
    Object? status = null,
    Object? taxId = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountantId: null == accountantId
          ? _value.accountantId
          : accountantId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      legalNumber: null == legalNumber
          ? _value.legalNumber
          : legalNumber // ignore: cast_nullable_to_non_nullable
              as String,
      homeNumber: null == homeNumber
          ? _value.homeNumber
          : homeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
      companyType: null == companyType
          ? _value.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserEntityCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$_UserEntityCopyWith(
          _$_UserEntity value, $Res Function(_$_UserEntity) then) =
      __$$_UserEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String accountantId,
      String email,
      String firstName,
      String lastName,
      String image,
      String user,
      String legalNumber,
      String homeNumber,
      String city,
      String zipCode,
      String jobType,
      String companyType,
      String bankName,
      String iban,
      String mobileNumber,
      String status,
      @JsonKey(includeIfNull: false) String? taxId,
      @JsonKey(includeIfNull: false) String? notes,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt});
}

/// @nodoc
class __$$_UserEntityCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$_UserEntity>
    implements _$$_UserEntityCopyWith<$Res> {
  __$$_UserEntityCopyWithImpl(
      _$_UserEntity _value, $Res Function(_$_UserEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? accountantId = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? image = null,
    Object? user = null,
    Object? legalNumber = null,
    Object? homeNumber = null,
    Object? city = null,
    Object? zipCode = null,
    Object? jobType = null,
    Object? companyType = null,
    Object? bankName = null,
    Object? iban = null,
    Object? mobileNumber = null,
    Object? status = null,
    Object? taxId = freezed,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_UserEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      accountantId: null == accountantId
          ? _value.accountantId
          : accountantId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      legalNumber: null == legalNumber
          ? _value.legalNumber
          : legalNumber // ignore: cast_nullable_to_non_nullable
              as String,
      homeNumber: null == homeNumber
          ? _value.homeNumber
          : homeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
      companyType: null == companyType
          ? _value.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEntity implements _UserEntity {
  _$_UserEntity(
      {required this.id,
      required this.accountantId,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.image,
      required this.user,
      required this.legalNumber,
      required this.homeNumber,
      required this.city,
      required this.zipCode,
      required this.jobType,
      required this.companyType,
      required this.bankName,
      required this.iban,
      required this.mobileNumber,
      required this.status,
      @JsonKey(includeIfNull: false) this.taxId,
      @JsonKey(includeIfNull: false) this.notes,
      @JsonKey(includeIfNull: false) this.createdAt,
      @JsonKey(includeIfNull: false) this.updatedAt});

  factory _$_UserEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserEntityFromJson(json);

  @override
  final String id;
  @override
  final String accountantId;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String image;
  @override
  final String user;
  @override
  final String legalNumber;
  @override
  final String homeNumber;
  @override
  final String city;
  @override
  final String zipCode;
  @override
  final String jobType;
  @override
  final String companyType;
  @override
  final String bankName;
  @override
  final String iban;
  @override
  final String mobileNumber;
  @override
  final String status;
  @override
  @JsonKey(includeIfNull: false)
  final String? taxId;
  @override
  @JsonKey(includeIfNull: false)
  final String? notes;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserEntity(id: $id, accountantId: $accountantId, email: $email, firstName: $firstName, lastName: $lastName, image: $image, user: $user, legalNumber: $legalNumber, homeNumber: $homeNumber, city: $city, zipCode: $zipCode, jobType: $jobType, companyType: $companyType, bankName: $bankName, iban: $iban, mobileNumber: $mobileNumber, status: $status, taxId: $taxId, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.accountantId, accountantId) ||
                other.accountantId == accountantId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.legalNumber, legalNumber) ||
                other.legalNumber == legalNumber) &&
            (identical(other.homeNumber, homeNumber) ||
                other.homeNumber == homeNumber) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        accountantId,
        email,
        firstName,
        lastName,
        image,
        user,
        legalNumber,
        homeNumber,
        city,
        zipCode,
        jobType,
        companyType,
        bankName,
        iban,
        mobileNumber,
        status,
        taxId,
        notes,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      __$$_UserEntityCopyWithImpl<_$_UserEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEntityToJson(
      this,
    );
  }
}

abstract class _UserEntity implements UserEntity {
  factory _UserEntity(
          {required final String id,
          required final String accountantId,
          required final String email,
          required final String firstName,
          required final String lastName,
          required final String image,
          required final String user,
          required final String legalNumber,
          required final String homeNumber,
          required final String city,
          required final String zipCode,
          required final String jobType,
          required final String companyType,
          required final String bankName,
          required final String iban,
          required final String mobileNumber,
          required final String status,
          @JsonKey(includeIfNull: false) final String? taxId,
          @JsonKey(includeIfNull: false) final String? notes,
          @JsonKey(includeIfNull: false) final DateTime? createdAt,
          @JsonKey(includeIfNull: false) final DateTime? updatedAt}) =
      _$_UserEntity;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$_UserEntity.fromJson;

  @override
  String get id;
  @override
  String get accountantId;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get image;
  @override
  String get user;
  @override
  String get legalNumber;
  @override
  String get homeNumber;
  @override
  String get city;
  @override
  String get zipCode;
  @override
  String get jobType;
  @override
  String get companyType;
  @override
  String get bankName;
  @override
  String get iban;
  @override
  String get mobileNumber;
  @override
  String get status;
  @override
  @JsonKey(includeIfNull: false)
  String? get taxId;
  @override
  @JsonKey(includeIfNull: false)
  String? get notes;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityCopyWith<_$_UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
