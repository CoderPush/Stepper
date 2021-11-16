import 'package:stepper/data/model/area.dart';

abstract class AreaRepository {
  Future<List<Area>> fetchAreasByType(AreaType areaType);

  Future<List<Area>> fetchRecentlyUpdatedAreas();

  Future<Area> fetchAreaByAreaName(String areaName);

  Future<void> updateAreaWhenAddNewPost(String areaName);

  Future<void> rateArea(String areaName, int rating);
}
