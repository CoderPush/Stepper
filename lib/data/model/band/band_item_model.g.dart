// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'band_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BandItemModelAdapter extends TypeAdapter<BandItemModel> {
  @override
  final int typeId = 5;

  @override
  BandItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BandItemModel(
      bandId: fields[0] as String,
      bandName: fields[1] as String,
      areaNames: (fields[2] as List).cast<String>(),
      childBands: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BandItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.bandId)
      ..writeByte(1)
      ..write(obj.bandName)
      ..writeByte(2)
      ..write(obj.areaNames)
      ..writeByte(3)
      ..write(obj.childBands);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BandItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BandItemModel _$BandItemModelFromJson(Map<String, dynamic> json) =>
    BandItemModel(
      bandId: json['bandId'] as String,
      bandName: json['bandName'] as String,
      areaNames:
          (json['areaNames'] as List<dynamic>).map((e) => e as String).toList(),
      childBands: (json['childBands'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BandItemModelToJson(BandItemModel instance) =>
    <String, dynamic>{
      'bandId': instance.bandId,
      'bandName': instance.bandName,
      'areaNames': instance.areaNames,
      'childBands': instance.childBands,
    };
