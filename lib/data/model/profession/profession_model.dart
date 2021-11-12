import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/model/profession/profession_item_model.dart';

part 'profession_model.g.dart';

@JsonSerializable()
class ProfessionModel {
  @JsonKey(name: "professions")
  final List<ProfessionItemModel> professions;

  ProfessionModel({required this.professions});

  factory ProfessionModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionModelToJson(this);
}
