// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfessionCWProxy {
  Profession bandIds(List<String> bandIds);

  Profession id(String id);

  Profession name(String name);

  Profession type(ProfessionType type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Profession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Profession(...).copyWith(id: 12, name: "My name")
  /// ````
  Profession call({
    List<String>? bandIds,
    String? id,
    String? name,
    ProfessionType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfession.copyWith.fieldName(...)`
class _$ProfessionCWProxyImpl implements _$ProfessionCWProxy {
  final Profession _value;

  const _$ProfessionCWProxyImpl(this._value);

  @override
  Profession bandIds(List<String> bandIds) => this(bandIds: bandIds);

  @override
  Profession id(String id) => this(id: id);

  @override
  Profession name(String name) => this(name: name);

  @override
  Profession type(ProfessionType type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Profession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Profession(...).copyWith(id: 12, name: "My name")
  /// ````
  Profession call({
    Object? bandIds = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return Profession(
      bandIds: bandIds == const $CopyWithPlaceholder() || bandIds == null
          ? _value.bandIds
          // ignore: cast_nullable_to_non_nullable
          : bandIds as List<String>,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ProfessionType,
    );
  }
}

extension $ProfessionCopyWith on Profession {
  /// Returns a callable class that can be used as follows: `instanceOfclass Profession.name.copyWith(...)` or like so:`instanceOfclass Profession.name.copyWith.fieldName(...)`.
  _$ProfessionCWProxy get copyWith => _$ProfessionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profession _$ProfessionFromJson(Map<String, dynamic> json) => Profession(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ProfessionTypeEnumMap, json['type']),
      bandIds:
          (json['band_ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProfessionToJson(Profession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ProfessionTypeEnumMap[instance.type],
      'band_ids': instance.bandIds,
    };

const _$ProfessionTypeEnumMap = {
  ProfessionType.engineer: 'engineer',
  ProfessionType.qa: 'qa',
  ProfessionType.techLead: 'tech_lead',
};
