// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvoiceEntity _$InvoiceEntityFromJson(Map<String, dynamic> json) {
  return _InvoiceEntity.fromJson(json);
}

/// @nodoc
mixin _$InvoiceEntity {
  String get id => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceEntityCopyWith<InvoiceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceEntityCopyWith<$Res> {
  factory $InvoiceEntityCopyWith(
          InvoiceEntity value, $Res Function(InvoiceEntity) then) =
      _$InvoiceEntityCopyWithImpl<$Res, InvoiceEntity>;
  @useResult
  $Res call(
      {String id,
      String clientId,
      String name,
      String image,
      String status,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt});
}

/// @nodoc
class _$InvoiceEntityCopyWithImpl<$Res, $Val extends InvoiceEntity>
    implements $InvoiceEntityCopyWith<$Res> {
  _$InvoiceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? name = null,
    Object? image = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_InvoiceEntityCopyWith<$Res>
    implements $InvoiceEntityCopyWith<$Res> {
  factory _$$_InvoiceEntityCopyWith(
          _$_InvoiceEntity value, $Res Function(_$_InvoiceEntity) then) =
      __$$_InvoiceEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String clientId,
      String name,
      String image,
      String status,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt});
}

/// @nodoc
class __$$_InvoiceEntityCopyWithImpl<$Res>
    extends _$InvoiceEntityCopyWithImpl<$Res, _$_InvoiceEntity>
    implements _$$_InvoiceEntityCopyWith<$Res> {
  __$$_InvoiceEntityCopyWithImpl(
      _$_InvoiceEntity _value, $Res Function(_$_InvoiceEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? name = null,
    Object? image = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_InvoiceEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_InvoiceEntity implements _InvoiceEntity {
  _$_InvoiceEntity(
      {required this.id,
      required this.clientId,
      required this.name,
      required this.image,
      required this.status,
      @JsonKey(includeIfNull: false) this.createdAt,
      @JsonKey(includeIfNull: false) this.updatedAt});

  factory _$_InvoiceEntity.fromJson(Map<String, dynamic> json) =>
      _$$_InvoiceEntityFromJson(json);

  @override
  final String id;
  @override
  final String clientId;
  @override
  final String name;
  @override
  final String image;
  @override
  final String status;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'InvoiceEntity(id: $id, clientId: $clientId, name: $name, image: $image, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvoiceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, clientId, name, image, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvoiceEntityCopyWith<_$_InvoiceEntity> get copyWith =>
      __$$_InvoiceEntityCopyWithImpl<_$_InvoiceEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvoiceEntityToJson(
      this,
    );
  }
}

abstract class _InvoiceEntity implements InvoiceEntity {
  factory _InvoiceEntity(
          {required final String id,
          required final String clientId,
          required final String name,
          required final String image,
          required final String status,
          @JsonKey(includeIfNull: false) final DateTime? createdAt,
          @JsonKey(includeIfNull: false) final DateTime? updatedAt}) =
      _$_InvoiceEntity;

  factory _InvoiceEntity.fromJson(Map<String, dynamic> json) =
      _$_InvoiceEntity.fromJson;

  @override
  String get id;
  @override
  String get clientId;
  @override
  String get name;
  @override
  String get image;
  @override
  String get status;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt;
  @override
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_InvoiceEntityCopyWith<_$_InvoiceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
