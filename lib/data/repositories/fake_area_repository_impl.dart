import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class FakeAreaRepositoryImpl extends AreaRepository {
  final AreaDatabase areaDatabase;
  final PostDatabase postDatabase;
  final SettingDatabase settingDatabase;
  final AreaService areaService;
  final BandService bandService;

  FakeAreaRepositoryImpl({
    required this.areaDatabase,
    required this.postDatabase,
    required this.settingDatabase,
    required this.areaService,
    required this.bandService,
  });

  @override
  Future<List<Area>> fetchAreasByType(AreaType areaType) async {
    final areaNamesList = (await settingDatabase.getSelectedBand())!.areaNames;
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
    final areaNamesList = await settingDatabase.getParentAndChildrenAreaNames();
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
    final posts = await postDatabase.getPostsByAreaName(areaName);
    final area = await areaDatabase.getAreaByName(areaName);
    await areaDatabase.updateArea(area.copyWith(
      updatedTime: DateTime.now(),
      numberOfUpdate: posts.length,
    ));
  }

  @override
  Future<void> rateArea(String areaName, int rating) async {
    final area = await areaDatabase.getAreaByName(areaName);
    await areaDatabase.updateArea(area.copyWith(
      updatedTime: DateTime.now(),
      rating: rating,
    ));
  }

  @override
  Future<Area> fetchAreaByAreaName(String areaName) async {
    final area = await areaDatabase.getAreaByName(areaName);
    return area;
  }

  @override
  Future<List<Area>> fetchAreasWithBandAndType(
    String bandName,
    AreaType areaType,
  ) async {
    final areasWithType = (await areaDatabase.getAllAreas())
        .where((area) => area.areaType == areaType)
        .toList();
    final areaNames = (await bandService.getBandByName(bandName)).areaNames;
    return areasWithType
        .where((area) => areaNames.contains(area.areaName))
        .toList();
  }
}

class NetworkException implements Exception {}
