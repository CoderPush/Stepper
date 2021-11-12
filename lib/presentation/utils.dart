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
