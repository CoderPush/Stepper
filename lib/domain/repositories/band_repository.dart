import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/data/model/band/band_model.dart';

abstract class BandRepository {
  Future<BandModel> getBands();

  Future<BandItemModel?> getBandItemModel();

  Future<void> saveBandItemModel(BandItemModel bandItemModel);

  int getCurrentIndexOfBands();

  Future<void> saveCurrentIndexOfBands(int currentIndexOfBands);
}
