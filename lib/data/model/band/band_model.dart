import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/model/band/band_item_model.dart';

part 'band_model.g.dart';

@JsonSerializable()
class BandModel {
  @JsonKey(name: "bands")
  final List<BandItemModel> bands;

  BandModel({required this.bands});

  factory BandModel.fromJson(Map<String, dynamic> json) => _$BandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BandModelToJson(this);
}
