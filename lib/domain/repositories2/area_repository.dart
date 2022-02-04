import 'package:stepper/data/model2/area.dart';

abstract class AreaRepository {
  Future<List<Area>> getAllAreas();

  Future<List<Area>> getAreasByAreaTypeAndBandId(
      {required String areaType, required String bandId});
}
