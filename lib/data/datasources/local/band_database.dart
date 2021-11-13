import 'package:hive/hive.dart';
import 'package:stepper/data/model/band/band_item_model.dart';

class BandDatabase {
  final _boxBandName = 'BandItemModel';
  final _boxStorageAboutNumberName = 'StorageAboutNumber';
  final _currentIndexOfBands = 'currentIndexOfBands';
  final _bandModelItem = 'bandItemModel';

  // open a box
  Future<Box<BandItemModel>> _bandBox() async {
    final box = await Hive.openBox<BandItemModel>(_boxBandName);
    return box;
  }

  Future<Box<int>> _storageAboutNumberBox() async {
    final box = await Hive.openBox<int>(_boxStorageAboutNumberName);
    return box;
  }

  // get band item model
  Future<BandItemModel?> getBandItemModel() async {
    final box = await _bandBox();
    return box.get(_bandModelItem);
  }

  // save band item model
  Future<void> saveBandItemModel(BandItemModel bandItemModel) async {
    final box = await _bandBox();
    await box.put(_bandModelItem, bandItemModel);
  }

  // get current index of bands
  Future<int> getCurrentIndexOfBands() async {
    final box = await _storageAboutNumberBox();
    return box.get(_currentIndexOfBands) ?? 0;
  }

  // save current index of bands
  Future<void> saveCurrentIndexOfBands(int currentIndexOfBands) async {
    final box = await _storageAboutNumberBox();
    await box.put(_currentIndexOfBands, currentIndexOfBands);
  }
}
