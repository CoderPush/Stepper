import 'package:hive/hive.dart';
import 'package:stepper/data/model/band/band_item_model.dart';

class BandDatabase {
  final _boxBandName = 'BandItemModel';
  final _boxStorageAboutNumberName = 'StorageAboutNumber';
  final _currentIndexOfBands = 'currentIndexOfBands';
  final _bandModelItem = 'bandItemModel';

  // Open Band Box
  Future<Box<BandItemModel>> _bandBox() async {
    final box = await Hive.openBox<BandItemModel>(_boxBandName);
    return box;
  }

  // Open Storage About Number Box
  Box _storageAboutNumberBox() {
    final _box = Hive.box(_boxStorageAboutNumberName);
    return _box;
  }

  // Get Band Item Model
  Future<BandItemModel?> getBandItemModel() async {
    final box = await _bandBox();
    return box.get(_bandModelItem);
  }

  // Save Band Item Model
  Future<void> saveBandItemModel(BandItemModel bandItemModel) async {
    final box = await _bandBox();
    await box.put(_bandModelItem, bandItemModel);
  }

  // Get Current Index Of Bands
  int getCurrentIndexOfBands() {
    final box = _storageAboutNumberBox();
    return box.get(_currentIndexOfBands) ?? 0;
  }

  // Save Current Index Of Bands
  Future<void> saveCurrentIndexOfBands(int currentIndexOfBands) async {
    final box = _storageAboutNumberBox();
    await box.put(_currentIndexOfBands, currentIndexOfBands);
  }
}
