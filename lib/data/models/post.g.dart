// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostCWProxy {
  Post area(Area area);

  Post createdAt(DateTime? createdAt);

  Post description(String description);

  Post id(String? id);

  Post imgUrl(String? imgUrl);

  Post status(PostStatus status);

  Post updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Post(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Post(...).copyWith(id: 12, name: "My name")
  /// ````
  Post call({
    Area? area,
    DateTime? createdAt,
    String? description,
    String? id,
    String? imgUrl,
    PostStatus? status,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPost.copyWith.fieldName(...)`
class _$PostCWProxyImpl implements _$PostCWProxy {
  final Post _value;

  const _$PostCWProxyImpl(this._value);

  @override
  Post area(Area area) => this(area: area);

  @override
  Post createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Post description(String description) => this(description: description);

  @override
  Post id(String? id) => this(id: id);

  @override
  Post imgUrl(String? imgUrl) => this(imgUrl: imgUrl);

  @override
  Post status(PostStatus status) => this(status: status);

  @override
  Post updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Post(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Post(...).copyWith(id: 12, name: "My name")
  /// ````
  Post call({
    Object? area = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? imgUrl = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Post(
      area: area == const $CopyWithPlaceholder() || area == null
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as Area,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      imgUrl: imgUrl == const $CopyWithPlaceholder()
          ? _value.imgUrl
          // ignore: cast_nullable_to_non_nullable
          : imgUrl as String?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PostStatus,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
    );
  }
}

extension $PostCopyWith on Post {
  /// Returns a callable class that can be used as follows: `instanceOfclass Post.name.copyWith(...)` or like so:`instanceOfclass Post.name.copyWith.fieldName(...)`.
  _$PostCWProxy get copyWith => _$PostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String?,
      status: $enumDecode(_$PostStatusEnumMap, json['status']),
      description: json['description'] as String,
      area: Area.fromJson(json['area'] as Map<String, dynamic>),
      imgUrl: json['img_url'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['created_at'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updated_at'] as Timestamp?),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'status': _$PostStatusEnumMap[instance.status],
      'description': instance.description,
      'area': instance.area.toJson(),
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'img_url': instance.imgUrl,
    };

const _$PostStatusEnumMap = {
  PostStatus.published: 'published',
  PostStatus.draft: 'draft',
};
