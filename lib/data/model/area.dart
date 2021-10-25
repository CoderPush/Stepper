import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';

class Area {
  final String areaName;
  final int numberOfUpdate;
  final int rating;
  final AreaType areaType;
  final String areaDescription;

  Area({
    required this.areaName,
    required this.numberOfUpdate,
    required this.rating,
    required this.areaType,
    required this.areaDescription,
  });

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

enum AreaType {
  scope,
  expertise,
  mindset,
}
