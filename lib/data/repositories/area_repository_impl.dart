import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class AreaRepositoryImpl extends AreaRepository {
  final AreaDatabase areaDatabase;
  final PostFirebaseService postFirebaseService;
  final AreaFirebaseService areaFirebaseService;
  final SettingDatabase settingDatabase;
  final AreaService areaService;
  final BandService bandService;

  AreaRepositoryImpl({
    required this.areaDatabase,
    required this.postFirebaseService,
    required this.areaFirebaseService,
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
    final posts = await postFirebaseService.getPostsByAreaName(areaName);
    final updatedFields = {
      'updatedTime': DateTime.now(),
      'numberOfUpdate': posts.length,
    };
    await areaFirebaseService.updateArea(areaName, updatedFields);
  }

  @override
  Future<void> rateArea(String areaName, int rating) async {
    final updatedFields = {
      'updatedTime': DateTime.now(),
      'rating': rating,
    };
    await areaFirebaseService.updateArea(areaName, updatedFields);
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
