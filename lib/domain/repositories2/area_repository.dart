import 'package:stepper/data/model2/area.dart';

abstract class AreaRepository {
  Future<List<Area>> getAllAreas();

  Future<List<Area>> getAreasByAreaTypeAndBandId(
      {AreaType? areaType = AreaType.scope, required String bandId});

  Stream<List<Area>> subscribeAreas();

  Future<List<Area>> getUserAreasByTypeAndBandId(
      {AreaType? areaType = AreaType.scope, required String bandId});
}
