import 'package:hive/hive.dart';
import 'package:stepper/data/model/models.dart';

class AreaDatabase {
  final _boxName = "Area";

  // open a box
  Future<Box<Area>> areaBox() async {
    var box = await Hive.openBox<Area>(_boxName);
    return box;
  }

  // to add area in box
  Future<void> addArea(Area area) async {
    final box = await areaBox();
    await box.put(area.areaName, area);
  }

  Future<List<Area>> getAllAreas() async {
    final box = await areaBox();
    return box.values.toList();
  }

  // update area
  Future<void> updateArea(Area area) async {
    final box = await areaBox();
    await box.put(area.areaName, area);
  }

  Future<Area> getAreaByName(String areaName) async {
    final box = await areaBox();
    return box.get(areaName)!;
  }
}
