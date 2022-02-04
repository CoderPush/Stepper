import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/model2/model.dart';

part 'profession.g.dart';

@JsonSerializable()
@CopyWith()
class Profession {
  String id;
  String name;
  String type;

  @JsonKey(name: 'band_ids')
  List<Band> bandIds = [];

  Profession(
      {required this.id,
      required this.name,
      required this.type,
      required this.bandIds});

  factory Profession.fromJson(Map<String, dynamic> json) =>
      _$ProfessionFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionToJson(this);
}
