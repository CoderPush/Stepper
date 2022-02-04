// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostCWProxy {
  Post areaId(String areaId);

  Post createdAt(DateTime? createdAt);

  Post description(String description);

  Post id(String id);

  Post imgUrl(String? imgUrl);

  Post status(String status);

  Post updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Post(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Post(...).copyWith(id: 12, name: "My name")
  /// ````
  Post call({
    String? areaId,
    DateTime? createdAt,
    String? description,
    String? id,
    String? imgUrl,
    String? status,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPost.copyWith.fieldName(...)`
class _$PostCWProxyImpl implements _$PostCWProxy {
  final Post _value;

  const _$PostCWProxyImpl(this._value);

  @override
  Post areaId(String areaId) => this(areaId: areaId);

  @override
  Post createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Post description(String description) => this(description: description);

  @override
  Post id(String id) => this(id: id);

  @override
  Post imgUrl(String? imgUrl) => this(imgUrl: imgUrl);

  @override
  Post status(String status) => this(status: status);

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
    Object? areaId = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? imgUrl = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Post(
      areaId: areaId == const $CopyWithPlaceholder() || areaId == null
          ? _value.areaId
          // ignore: cast_nullable_to_non_nullable
          : areaId as String,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      imgUrl: imgUrl == const $CopyWithPlaceholder()
          ? _value.imgUrl
          // ignore: cast_nullable_to_non_nullable
          : imgUrl as String?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
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
      id: json['id'] as String,
      status: json['status'] as String,
      description: json['description'] as String,
      areaId: json['area_id'] as String,
      imgUrl: json['img_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'description': instance.description,
      'area_id': instance.areaId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'img_url': instance.imgUrl,
    };
