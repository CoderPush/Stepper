import 'package:stepper/data/datasources/firebase_service/firebase_services.dart';
import 'package:stepper/data/models/models.dart';
import 'package:stepper/domain/repositories/area_repository.dart';

class AreaRepositoryImpl implements AreaRepository {
  AreaFirebaseService areaFirebaseService;

  AreaRepositoryImpl({required this.areaFirebaseService});

  Future<List<Area>> _importAreasToUserAreas(
      {required AreaType areaType, required String bandId}) async {
    final areas =
        await getAreasByAreaTypeAndBandId(areaType: areaType, bandId: bandId);
    areaFirebaseService.importAreasToUserAreas(areas);

    return areas;
  }

  @override
  Stream<List<Area>> subscribeUserAreas() {
    return areaFirebaseService.subscribeUserAreas();
  }

  @override
  Future<List<Area>> getAllAreas() async {
    return await areaFirebaseService.getAllAreas();
  }

  @override
  Future<List<Area>> getAreasByAreaTypeAndBandId(
      {AreaType? areaType = AreaType.scope, required String bandId}) async {
    return areaFirebaseService.getAreasByAreaTypeAndBandId(
        areaType: areaType!.name, bandId: bandId);
  }

  @override
  Future<List<Area>> getUserAreasByAreaTypeAndBandId(
      {AreaType? areaType = AreaType.scope, required String bandId}) async {
    final userAreas = await areaFirebaseService.getUserAreasByAreaTypeAndBandId(
        areaType: areaType!.name, bandId: bandId);

    if (userAreas.isEmpty) {
      return _importAreasToUserAreas(areaType: areaType, bandId: bandId);
    }

    return userAreas;
  }

  @override
  Future<Area?> updateUserArea({required String areaId, required Area area}) {
    return areaFirebaseService.updateUserArea(
        areaId: areaId, data: area.toJson());
  }
}
