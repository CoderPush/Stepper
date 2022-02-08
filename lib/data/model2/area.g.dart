// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AreaCWProxy {
  Area bandId(String bandId);

  Area description(String description);

  Area id(String id);

  Area name(String name);

  Area numberOfPosts(int? numberOfPosts);

  Area rating(int? rating);

  Area type(AreaType type);

  Area updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Area(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Area(...).copyWith(id: 12, name: "My name")
  /// ````
  Area call({
    String? bandId,
    String? description,
    String? id,
    String? name,
    int? numberOfPosts,
    int? rating,
    AreaType? type,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArea.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArea.copyWith.fieldName(...)`
class _$AreaCWProxyImpl implements _$AreaCWProxy {
  final Area _value;

  const _$AreaCWProxyImpl(this._value);

  @override
  Area bandId(String bandId) => this(bandId: bandId);

  @override
  Area description(String description) => this(description: description);

  @override
  Area id(String id) => this(id: id);

  @override
  Area name(String name) => this(name: name);

  @override
  Area numberOfPosts(int? numberOfPosts) => this(numberOfPosts: numberOfPosts);

  @override
  Area rating(int? rating) => this(rating: rating);

  @override
  Area type(AreaType type) => this(type: type);

  @override
  Area updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Area(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Area(...).copyWith(id: 12, name: "My name")
  /// ````
  Area call({
    Object? bandId = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? numberOfPosts = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Area(
      bandId: bandId == const $CopyWithPlaceholder() || bandId == null
          ? _value.bandId
          // ignore: cast_nullable_to_non_nullable
          : bandId as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      numberOfPosts: numberOfPosts == const $CopyWithPlaceholder()
          ? _value.numberOfPosts
          // ignore: cast_nullable_to_non_nullable
          : numberOfPosts as int?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AreaType,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
    );
  }
}

extension $AreaCopyWith on Area {
  /// Returns a callable class that can be used as follows: `instanceOfclass Area.name.copyWith(...)` or like so:`instanceOfclass Area.name.copyWith.fieldName(...)`.
  _$AreaCWProxy get copyWith => _$AreaCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AreaTypeEnumMap, json['type']),
      description: json['description'] as String,
      bandId: json['band_id'] as String,
      numberOfPosts: json['number_of_posts'] as int?,
      rating: json['rating'] as int?,
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AreaTypeEnumMap[instance.type],
      'description': instance.description,
      'band_id': instance.bandId,
      'number_of_posts': instance.numberOfPosts,
      'rating': instance.rating,
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };

const _$AreaTypeEnumMap = {
  AreaType.scope: 'scope',
  AreaType.expertise: 'expertise',
  AreaType.mindset: 'mindset',
};
