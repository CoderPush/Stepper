import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/data/model/band/band_model.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/data/datasources/local/band_database.dart';
import 'package:stepper/data/datasources/remote/band_service.dart';

class BandRepositoryImpl implements BandRepository {
  final BandService bandService;
  final BandDatabase bandDatabase;

  BandRepositoryImpl({required this.bandService, required this.bandDatabase});

  @override
  Future<BandModel> getBands() {
    return bandService.getBands();
  }

  // Local Methods
  @override
  Future<BandItemModel?> getBandItemModel() async {
    return await bandDatabase.getBandItemModel();
  }

  @override
  Future<void> saveBandItemModel(BandItemModel bandItemModel) async {
    await bandDatabase.saveBandItemModel(bandItemModel);
  }

  @override
  int getCurrentIndexOfBands() {
    return bandDatabase.getCurrentIndexOfBands();
  }

  @override
  Future<void> saveCurrentIndexOfBands(int currentIndexOfBands) async {
    await bandDatabase.saveCurrentIndexOfBands(currentIndexOfBands);
  }
}
