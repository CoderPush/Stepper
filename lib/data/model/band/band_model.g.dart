// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BandModel _$BandModelFromJson(Map<String, dynamic> json) => BandModel(
      bands: (json['bands'] as List<dynamic>)
          .map((e) => BandItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BandModelToJson(BandModel instance) => <String, dynamic>{
      'bands': instance.bands,
    };
