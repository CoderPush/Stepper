// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User createdAt(String? createdAt);

  User currentBand(Band currentBand);

  User currentProfession(Profession currentProfession);

  User email(String email);

  User id(String id);

  User name(String name);

  User updatedAreas(List<UserUpdatedArea>? updatedAreas);

  User updatedAt(String? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    String? createdAt,
    Band? currentBand,
    Profession? currentProfession,
    String? email,
    String? id,
    String? name,
    List<UserUpdatedArea>? updatedAreas,
    String? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User createdAt(String? createdAt) => this(createdAt: createdAt);

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
  User updatedAreas(List<UserUpdatedArea>? updatedAreas) =>
      this(updatedAreas: updatedAreas);

  @override
  User updatedAt(String? updatedAt) => this(updatedAt: updatedAt);

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
    Object? updatedAreas = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return User(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
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
      updatedAreas: updatedAreas == const $CopyWithPlaceholder()
          ? _value.updatedAreas
          // ignore: cast_nullable_to_non_nullable
          : updatedAreas as List<UserUpdatedArea>?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as String?,
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
      updatedAreas: (json['updated_areas'] as List<dynamic>?)
          ?.map((e) => UserUpdatedArea.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'current_profession': instance.currentProfession,
      'current_band': instance.currentBand,
      'updated_areas': instance.updatedAreas,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
