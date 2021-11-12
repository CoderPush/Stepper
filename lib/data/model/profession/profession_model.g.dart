// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfessionModel _$ProfessionModelFromJson(Map<String, dynamic> json) =>
    ProfessionModel(
      professions: (json['professions'] as List<dynamic>)
          .map((e) => ProfessionItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfessionModelToJson(ProfessionModel instance) =>
    <String, dynamic>{
      'professions': instance.professions,
    };
