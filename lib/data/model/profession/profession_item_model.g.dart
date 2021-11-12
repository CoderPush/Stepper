// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionItemModel _$ProfessionItemModelFromJson(Map<String, dynamic> json) =>
    ProfessionItemModel(
      professionName: json['profession_name'] as String,
      bandIds: json['bandIds'] as String,
    );

Map<String, dynamic> _$ProfessionItemModelToJson(
        ProfessionItemModel instance) =>
    <String, dynamic>{
      'profession_name': instance.professionName,
      'bandIds': instance.bandIds,
    };
