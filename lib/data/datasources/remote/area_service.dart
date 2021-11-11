import 'dart:convert';

import 'package:stepper/data/model/models.dart';
import 'package:flutter/services.dart';

class AreaService {
  Future<List<Area>> getAreaWithBandId(String bandId) async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(data);
    final areaNameList = (jsonData['bands'] as List<dynamic>)
            .firstWhere((band) => band['bandId'] == bandId)['areaNames']
        as List<dynamic>;
    List<Area> areaList = [];
    for (var areaName in areaNameList) {
      final areaJson = (jsonData['areas'] as List<dynamic>)
          .firstWhere((area) => area['areaName'] == areaName);
      areaList.add(Area(
        areaName: areaName,
        numberOfUpdate: areaJson['numberOfUpdate'],
        rating: areaJson['rating'],
        areaType: _getAreaType(areaJson['areaType']),
        areaDescription: areaJson['areaDescription'],
      ));
    }
    return areaList;
  }

  AreaType _getAreaType(String areaType) {
    if (areaType == 'scope') {
      return AreaType.scope;
    } else if (areaType == 'expertise') {
      return AreaType.expertise;
    } else {
      return AreaType.mindset;
    }
  }
}
