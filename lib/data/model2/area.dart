import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
@CopyWith()
class Area {
  String id;
  String name;
  String type;
  String description;

  @JsonKey(name: 'band_id')
  String bandId;

  Area(
      {required this.id,
      required this.name,
      required this.type,
      required this.description,
      required this.bandId});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
@CopyWith()
class UserUpdatedArea extends Area {
  @JsonKey(name: 'number_of_posts')
  int? numberOfPosts = 0;
  int? rating = 0;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  UserUpdatedArea(
      {id,
      name,
      type,
      description,
      bandId,
      this.numberOfPosts,
      this.rating,
      this.updatedAt})
      : super(
            id: id,
            name: name,
            type: type,
            description: description,
            bandId: bandId);
  factory UserUpdatedArea.fromJson(Map<String, dynamic> json) =>
      _$UserUpdatedAreaFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdatedAreaToJson(this);
}
