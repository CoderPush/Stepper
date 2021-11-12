import 'package:json_annotation/json_annotation.dart';

part 'band_item_model.g.dart';

@JsonSerializable()
class BandItemModel {
  @JsonKey(name: "bandId")
  final String bandId;

  @JsonKey(name: "bandName")
  final String bandName;

  @JsonKey(name: "areaNames")
  final List<String> areaNames;

  BandItemModel({
    required this.bandId,
    required this.bandName,
    required this.areaNames,
  });

  factory BandItemModel.fromJson(Map<String, dynamic> json) => _$BandItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$BandItemModelToJson(this);
}
