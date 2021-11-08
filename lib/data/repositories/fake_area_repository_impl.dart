import 'package:stepper/data/model/area.dart';
import 'package:stepper/domain/repositories/area_repository.dart';
import 'package:stepper/dummy_data.dart';

class FakeAreaRepositoryImpl extends AreaRepository {
  @override
  Future<List<Area>> fetchAreasByType(AreaType areaType) {
    return Future.delayed(const Duration(seconds: 1), () {
      // Return "fetched" areas
      if (areaType == AreaType.scope) {
        return scopeAreaList;
      } else if (areaType == AreaType.expertise) {
        return expertiseAreaList;
      } else {
        return mindsetAreaList;
      }
    });
  }

  @override
  Future<List<Area>> fetchRecentlyUpdatedAreas() {
    return Future.delayed(const Duration(seconds: 1), () {
      // Return "recently updated" areas
      return [
        scopeAreaList[0],
        scopeAreaList[1],
        expertiseAreaList[1],
        expertiseAreaList[2],
      ];
    });
  }
}

class NetworkException implements Exception {}
