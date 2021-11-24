import 'dart:convert';

import 'package:stepper/data/model/models.dart';
import 'package:flutter/services.dart';

class AreaService {

  AreaType _getAreaType(String areaType) {
    if (areaType == 'scope') {
      return AreaType.scope;
    } else if (areaType == 'expertise') {
      return AreaType.expertise;
    } else {
      return AreaType.mindset;
    }
  }

  Future<List<Area>> getAllAreas() async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(data);
    return (jsonData['areas'] as List<dynamic>)
        .map((areaJson) => Area(
              areaName: areaJson['areaName'],
              numberOfUpdate: areaJson['numberOfUpdate'],
              rating: areaJson['rating'],
              areaType: _getAreaType(areaJson['areaType']),
              areaDescription: areaJson['areaDescription'],
            ))
        .toList();
  }
}
