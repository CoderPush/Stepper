import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'band.g.dart';

@JsonSerializable()
@CopyWith()
class Band {
  String id;
  String name;
  String type;
  int level;

  static final empty = Band(id: '', name: '', type: '', level: 0);

  Band(
      {required this.id,
      required this.name,
      required this.type,
      required this.level});

  factory Band.fromJson(Map<String, dynamic> json) => _$BandFromJson(json);

  Map<String, dynamic> toJson() => _$BandToJson(this);
}
