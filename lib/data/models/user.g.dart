// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User createdAt(DateTime? createdAt);

  User currentBand(Band currentBand);

  User currentProfession(Profession currentProfession);

  User email(String email);

  User id(String id);

  User name(String name);

  User updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    DateTime? createdAt,
    Band? currentBand,
    Profession? currentProfession,
    String? email,
    String? id,
    String? name,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  User currentBand(Band currentBand) => this(currentBand: currentBand);

  @override
  User currentProfession(Profession currentProfession) =>
      this(currentProfession: currentProfession);

  @override
  User email(String email) => this(email: email);

  @override
  User id(String id) => this(id: id);

  @override
  User name(String name) => this(name: name);

  @override
  User updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? currentBand = const $CopyWithPlaceholder(),
    Object? currentProfession = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return User(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      currentBand:
          currentBand == const $CopyWithPlaceholder() || currentBand == null
              ? _value.currentBand
              // ignore: cast_nullable_to_non_nullable
              : currentBand as Band,
      currentProfession: currentProfession == const $CopyWithPlaceholder() ||
              currentProfession == null
          ? _value.currentProfession
          // ignore: cast_nullable_to_non_nullable
          : currentProfession as Profession,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
    );
  }
}

extension $UserCopyWith on User {
  /// Returns a callable class that can be used as follows: `instanceOfclass User.name.copyWith(...)` or like so:`instanceOfclass User.name.copyWith.fieldName(...)`.
  _$UserCWProxy get copyWith => _$UserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      currentProfession: Profession.fromJson(
          json['current_profession'] as Map<String, dynamic>),
      currentBand: Band.fromJson(json['current_band'] as Map<String, dynamic>),
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'current_profession': instance.currentProfession.toJson(),
      'current_band': instance.currentBand.toJson(),
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
