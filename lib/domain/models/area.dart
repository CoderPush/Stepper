import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';

class Area {
  final String areaName;
  final int numberOfUpdate;
  final int rating;
  final AreaType areaType;

  Area({
    required this.areaName,
    required this.numberOfUpdate,
    required this.rating,
    required this.areaType,
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
