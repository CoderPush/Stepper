import 'package:hive/hive.dart';
import 'package:stepper/data/model/band/band_item_model.dart';

class BandDatabase {
  final _boxName = 'BandItemModel';
  final _bandModelItem = 'bandItemModel';

  // open a box
  Future<Box<BandItemModel>> bandBox() async {
    var box = await Hive.openBox<BandItemModel>(_boxName);
    return box;
  }

  // get band id
  Future<BandItemModel?> getBandItemModel() async {
    final box = await bandBox();
    return box.get(_bandModelItem);
  }

// save band id
  Future<void> saveBandItemModel(BandItemModel bandItemModel) async {
    final box = await bandBox();
    await box.put(_bandModelItem, bandItemModel);
  }
}
