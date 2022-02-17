import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/models/helpers/timestamp_converter.dart';

part 'area.g.dart';

@JsonSerializable()
@CopyWith()
class Area {
  String id;
  String name;
  AreaType type;
  String description;
  @JsonKey(name: 'band_id')
  String bandId;
  @JsonKey(name: 'number_of_posts')
  int numberOfPosts;
  int rating;
  @TimestampConverter()
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  static final empty =
      Area(id: '', name: '', type: AreaType.scope, description: '', bandId: '');

  static get enumMap => _$AreaTypeEnumMap;

  Area(
      {required this.id,
      required this.name,
      required this.type,
      required this.description,
      required this.bandId,
      this.numberOfPosts = 0,
      this.rating = 0,
      this.updatedAt});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

enum AreaType {
  @JsonValue("scope")
  scope,
  @JsonValue("expertise")
  expertise,
  @JsonValue("mindset")
  mindset
}
