import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stepper/common/palette.dart';

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

  List<Color> getAreaTheme() {
    switch (areaType) {
      case AreaType.scope:
        return scopeScheme;
      case AreaType.expertise:
        return expertiseScheme;
      case AreaType.mindset:
        return mindsetScheme;
    }
  }
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
