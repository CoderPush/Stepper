import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/models/helpers/timestamp_converter.dart';
import 'package:stepper/data/models/models.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
@CopyWith()
class User {
  String id;
  String email;
  String name;
  @JsonKey(name: 'current_profession')
  Profession currentProfession;
  @JsonKey(name: 'current_band')
  Band currentBand;
  @TimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @TimestampConverter()
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.currentProfession,
      required this.currentBand,
      this.createdAt,
      this.updatedAt});

  static final empty = User(
    id: '',
    email: '',
    name: '',
    currentProfession: Profession.empty,
    currentBand: Band.empty,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
