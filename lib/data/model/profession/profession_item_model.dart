import 'package:json_annotation/json_annotation.dart';

part 'profession_item_model.g.dart';

@JsonSerializable()
class ProfessionItemModel {
  @JsonKey(name: "profession_name")
  final String professionName;

  @JsonKey(name: "bandIds")
  final List<String> bandIds;

  ProfessionItemModel({
    required this.professionName,
    required this.bandIds,
  });

  factory ProfessionItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionItemModelToJson(this);
}
