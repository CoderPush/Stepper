import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/model2/helpers/timestamp_converter.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class Post {
  String id;
  String status;
  String description;
  @JsonKey(name: 'area_id')
  String areaId;
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @TimestampConverter()
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'img_url')
  String? imgUrl;

  Post({
    required this.id,
    required this.status,
    required this.description,
    required this.areaId,
    this.imgUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
