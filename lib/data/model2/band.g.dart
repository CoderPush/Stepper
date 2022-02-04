// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BandCWProxy {
  Band id(String id);

  Band level(int level);

  Band name(String name);

  Band type(String type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Band(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Band(...).copyWith(id: 12, name: "My name")
  /// ````
  Band call({
    String? id,
    int? level,
    String? name,
    String? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBand.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBand.copyWith.fieldName(...)`
class _$BandCWProxyImpl implements _$BandCWProxy {
  final Band _value;

  const _$BandCWProxyImpl(this._value);

  @override
  Band id(String id) => this(id: id);

  @override
  Band level(int level) => this(level: level);

  @override
  Band name(String name) => this(name: name);

  @override
  Band type(String type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Band(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Band(...).copyWith(id: 12, name: "My name")
  /// ````
  Band call({
    Object? id = const $CopyWithPlaceholder(),
    Object? level = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Band(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      level: level == const $CopyWithPlaceholder() || level == null
          ? _value.level
          // ignore: cast_nullable_to_non_nullable
          : level as int,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String,
    );
  }
}

extension $BandCopyWith on Band {
  /// Returns a callable class that can be used as follows: `instanceOfclass Band.name.copyWith(...)` or like so:`instanceOfclass Band.name.copyWith.fieldName(...)`.
  _$BandCWProxy get copyWith => _$BandCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Band _$BandFromJson(Map<String, dynamic> json) => Band(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      level: json['level'] as int,
    );

Map<String, dynamic> _$BandToJson(Band instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'level': instance.level,
    };
