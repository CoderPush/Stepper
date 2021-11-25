import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'band_item_model.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class BandItemModel {
  @HiveField(0)
  @JsonKey(name: "bandId")
  final String bandId;

  @HiveField(1)
  @JsonKey(name: "bandName")
  final String bandName;

  @HiveField(2)
  @JsonKey(name: "areaNames")
  final List<String> areaNames;

  @HiveField(3)
  @JsonKey(name: "childBands")
  final List<String> childBands;

  const BandItemModel({
    required this.bandId,
    required this.bandName,
    required this.areaNames,
    required this.childBands,
  });

  factory BandItemModel.fromJson(Map<String, dynamic> json) =>
      _$BandItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$BandItemModelToJson(this);
}
