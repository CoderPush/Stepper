// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BandItemModel _$BandItemModelFromJson(Map<String, dynamic> json) =>
    BandItemModel(
      bandId: json['bandId'] as String,
      bandName: json['bandName'] as String,
      areaNames:
          (json['areaNames'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BandItemModelToJson(BandItemModel instance) =>
    <String, dynamic>{
      'bandId': instance.bandId,
      'bandName': instance.bandName,
      'areaNames': instance.areaNames,
    };
