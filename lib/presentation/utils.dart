import 'package:flutter/material.dart';
import 'package:stepper/common/palette.dart';
import 'package:stepper/data/model/models.dart';

List<Color> getAreaTheme(AreaType areaType) {
  switch (areaType) {
    case AreaType.scope:
      return scopeScheme;
    case AreaType.expertise:
      return expertiseScheme;
    case AreaType.mindset:
      return mindsetScheme;
  }
}

// Temporary function to get AreaType from AreaName
AreaType getAreaType(String areaName) {
  if (areaName.startsWith('S')) {
    return AreaType.scope;
  } else if (areaName.startsWith('E')) {
    return AreaType.expertise;
  } else {
    return AreaType.mindset;
  }
}
