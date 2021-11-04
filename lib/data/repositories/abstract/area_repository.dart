import 'package:stepper/data/model/area.dart';

abstract class AreaRepository {
  Future<List<Area>> fetchAreas(AreaType areaType);

  Future<List<Area>> fetchRecentlyUpdatedAreas();
}
