import 'package:stepper/data/model/area.dart';

abstract class AreaRepository {
  Future<List<Area>> fetchAreasByType(AreaType areaType);

  Future<List<Area>> fetchRecentlyUpdatedAreas();
}
