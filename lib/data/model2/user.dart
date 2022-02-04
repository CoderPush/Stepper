import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/model2/model.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
class User {
  String id;
  String email;
  String name;
  @JsonKey(name: 'current_profession')
  Profession currentProfession;
  @JsonKey(name: 'current_band')
  Band currentBand;
  @JsonKey(name: 'updated_areas')
  List<UserUpdatedArea>? updatedAreas = [];
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.currentProfession,
      required this.currentBand,
      this.updatedAreas,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
