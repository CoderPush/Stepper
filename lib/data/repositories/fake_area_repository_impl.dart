import 'package:stepper/data/datasources/remote/area_service.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/domain/repositories/area_repository.dart';
import 'package:stepper/dummy_data.dart';

class FakeAreaRepositoryImpl extends AreaRepository {
  final AreaService areaService;

  FakeAreaRepositoryImpl({required this.areaService});

  @override
  Future<List<Area>> fetchAreasByType(AreaType areaType) async {
    // TODO: replace this with current band from settings
    final areaList = await areaService.getAreaWithBandId('Engineer_Band1');
    return areaList.where((area) => area.areaType == areaType).toList();
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
