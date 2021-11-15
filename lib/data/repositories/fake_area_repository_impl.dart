import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/area_service.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/domain/repositories/area_repository.dart';

class FakeAreaRepositoryImpl extends AreaRepository {
  final AreaDatabase areaDatabase;
  final BandDatabase bandDatabase;
  final AreaService areaService;

  FakeAreaRepositoryImpl({
    required this.areaDatabase,
    required this.bandDatabase,
    required this.areaService,
  });

  @override
  Future<List<Area>> fetchAreasByType(AreaType areaType) async {
    final currentBandId = (await bandDatabase.getBandItemModel())!.bandId;
    final areaNamesList =
        await areaService.getAreaNamesWithBandId(currentBandId);
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
    final currentBandId = (await bandDatabase.getBandItemModel())!.bandId;
    final areaNamesList =
        await areaService.getAreaNamesWithBandId(currentBandId);
    final updatedAreaList = (await areaDatabase.getAllAreas())
        .where((area) => areaNamesList.contains(area.areaName))
        .where((area) => area.updatedTime != null)
        .toList()
      ..sort((first, next) => next.updatedTime!.compareTo(first.updatedTime!));
    if (updatedAreaList.length >= 6) {
      return updatedAreaList.sublist(0, 6);
    } else {
      return updatedAreaList;
    }
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
