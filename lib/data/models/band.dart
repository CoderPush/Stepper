import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stepper/data/models/models.dart';

part 'band.g.dart';

@JsonSerializable()
@CopyWith()
class Band {
  String id;
  String name;
  @JsonKey(name: "type")
  ProfessionType professionType;
  int level;

  static final empty =
      Band(id: '', name: '', professionType: ProfessionType.engineer, level: 0);

  Band(
      {required this.id,
      required this.name,
      required this.professionType,
      required this.level});

  factory Band.fromJson(Map<String, dynamic> json) => _$BandFromJson(json);

  Map<String, dynamic> toJson() => _$BandToJson(this);
}
