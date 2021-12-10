import 'package:hive/hive.dart';
import 'package:stepper/presentation/utils.dart';

part 'area.g.dart';

@HiveType(typeId: 3)
class Area {
  @HiveField(0)
  final String areaName;
  @HiveField(1)
  final int numberOfUpdate;
  @HiveField(2)
  final int rating;
  @HiveField(3)
  final AreaType areaType;
  @HiveField(4)
  final String areaDescription;
  @HiveField(5)
  final DateTime? updatedTime;

  Area({
    required this.areaName,
    required this.numberOfUpdate,
    required this.rating,
    required this.areaType,
    required this.areaDescription,
    this.updatedTime,
  });

  Area copyWith({
    String? areaName,
    int? numberOfUpdate,
    int? rating,
    AreaType? areaType,
    String? areaDescription,
    DateTime? updatedTime,
  }) {
    return Area(
      areaName: areaName ?? this.areaName,
      numberOfUpdate: numberOfUpdate ?? this.numberOfUpdate,
      rating: rating ?? this.rating,
      areaType: areaType ?? this.areaType,
      areaDescription: areaDescription ?? this.areaDescription,
      updatedTime: updatedTime ?? this.updatedTime,
    );
  }

  Map<String, dynamic> toJson() => _areaToJson(this);

  Map<String, dynamic> _areaToJson(Area area) => <String, dynamic>{
        'areaName': area.areaName,
        'numberOfUpdate': area.numberOfUpdate,
        'rating': area.rating,
        'areaType': area.areaType.toString(),
        'areaDescription': area.areaDescription,
        'updatedTime': area.updatedTime,
      };

  factory Area.fromJson(Map<String, dynamic> commonAreaJson) => Area(
        areaName: commonAreaJson['areaName'],
        numberOfUpdate: 0,
        rating: 0,
        areaType: convertAreaTypeString(commonAreaJson['areaType']),
        areaDescription: commonAreaJson['areaDescription'],
      );
}

@HiveType(typeId: 4)
enum AreaType {
  @HiveField(0)
  scope,
  @HiveField(1)
  expertise,
  @HiveField(2)
  mindset,
}
