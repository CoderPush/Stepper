import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/area_service.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/domain/repositories/area_repository.dart';

class FakeAreaRepositoryImpl extends AreaRepository {
  final AreaDatabase areaDatabase;
  final AreaService areaService;

  FakeAreaRepositoryImpl({
    required this.areaDatabase,
    required this.areaService,
  });

  @override
  Future<List<Area>> fetchAreasByType(AreaType areaType) async {
    // TODO: replace this with current band from settings
    final areaNamesList =
        await areaService.getAreaNamesWithBandId('Engineer_Band1');
    return (await areaDatabase.getAllAreas())
        .where(
          (area) =>
              areaNamesList.contains(area.areaName) &&
              area.areaType == areaType,
        )
        .toList();
  }

  @override
  Future<List<Area>> fetchRecentlyUpdatedAreas() async {
    final areaNamesList =
        await areaService.getAreaNamesWithBandId('Engineer_Band1');
    final updatedAreaList = (await areaDatabase.getAllAreas())
        .where((area) => areaNamesList.contains(area.areaName))
        .where((area) => area.updatedTime != null)
        .toList();
    return updatedAreaList
      ..sort((first, next) => first.updatedTime!.compareTo(next.updatedTime!));
  }

  @override
  Future<void> updateAreaWhenAddNewPost(String areaName) async {
    final area = await areaDatabase.getAreaByName(areaName);
    await areaDatabase.updateArea(area.copyWith(
      updatedTime: DateTime.now(),
      numberOfUpdate: area.numberOfUpdate + 1,
    ));
  }
}

class NetworkException implements Exception {}
