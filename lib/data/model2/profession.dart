import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profession.g.dart';

@JsonSerializable()
@CopyWith()
class Profession {
  String id;
  String name;
  ProfessionType type;

  @JsonKey(name: 'band_ids')
  List<String> bandIds = [];

  static get enumMap => _$ProfessionTypeEnumMap;

  Profession(
      {required this.id,
      required this.name,
      required this.type,
      required this.bandIds});

  static final empty =
      Profession(id: '', name: '', type: ProfessionType.engineer, bandIds: []);

  factory Profession.fromJson(Map<String, dynamic> json) =>
      _$ProfessionFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionToJson(this);
}

enum ProfessionType {
  @JsonValue("engineer")
  engineer,
  @JsonValue("qa")
  qa,
  @JsonValue("tech_lead")
  techLead
}
