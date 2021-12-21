import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class AreaRepositoryImpl extends AreaRepository {
  final PostFirebaseService postFirebaseService;
  final AreaFirebaseService areaFirebaseService;
  final SettingFirebaseService settingFirebaseService;
  final BandService bandService;

  AreaRepositoryImpl({
    required this.postFirebaseService,
    required this.areaFirebaseService,
    required this.settingFirebaseService,
    required this.bandService,
  });

  @override
  Future<List<Area>> fetchAreasByType(AreaType areaType) async {
    final areaNamesList =
        (await settingFirebaseService.getSelectedBand()).areaNames;
    return (await areaFirebaseService.getAllAreas())
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
        await settingFirebaseService.getParentAndChildrenAreaNames();
    final updatedAreaList = (await areaFirebaseService.getAllAreas())
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
    return await areaFirebaseService.getAreaByAreaName(areaName);
  }

  @override
  Future<List<Area>> fetchAreasWithBandAndType(
    String bandName,
    AreaType areaType,
  ) async {
    final areasWithType = (await areaFirebaseService.getAllAreas())
        .where((area) => area.areaType == areaType)
        .toList();
    final areaNames = (await bandService.getBandByName(bandName)).areaNames;
    return areasWithType
        .where((area) => areaNames.contains(area.areaName))
        .toList();
  }
}

class NetworkException implements Exception {}
