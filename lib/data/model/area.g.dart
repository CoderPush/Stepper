// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AreaAdapter extends TypeAdapter<Area> {
  @override
  final int typeId = 3;

  @override
  Area read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Area(
      areaName: fields[0] as String,
      numberOfUpdate: fields[1] as int,
      rating: fields[2] as int,
      areaType: fields[3] as AreaType,
      areaDescription: fields[4] as String,
      updatedTime: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Area obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.areaName)
      ..writeByte(1)
      ..write(obj.numberOfUpdate)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.areaType)
      ..writeByte(4)
      ..write(obj.areaDescription)
      ..writeByte(5)
      ..write(obj.updatedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AreaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AreaTypeAdapter extends TypeAdapter<AreaType> {
  @override
  final int typeId = 4;

  @override
  AreaType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AreaType.scope;
      case 1:
        return AreaType.expertise;
      case 2:
        return AreaType.mindset;
      default:
        return AreaType.scope;
    }
  }

  @override
  void write(BinaryWriter writer, AreaType obj) {
    switch (obj) {
      case AreaType.scope:
        writer.writeByte(0);
        break;
      case AreaType.expertise:
        writer.writeByte(1);
        break;
      case AreaType.mindset:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AreaTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
