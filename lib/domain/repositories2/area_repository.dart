import 'package:stepper/data/model2/area.dart';

abstract class AreaRepository {
  Stream<List<Area>> subscribeAreas();

  Future<List<Area>> getAllAreas();

  Future<List<Area>> getAreasByAreaTypeAndBandId(
      {AreaType? areaType = AreaType.scope, required String bandId});

  Future<List<Area>> getUserAreasByTypeAndBandId(
      {AreaType? areaType = AreaType.scope, required String bandId});

  Future<Area> updateUserArea({required String areaId, required Area area});
}
