import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/data/datasources/remote/band_service.dart';

class BandRepositoryImpl implements BandRepository {
  final BandService bandService;
  final SettingDatabase settingDatabase;

  BandRepositoryImpl({
    required this.bandService,
    required this.settingDatabase,
  });

  @override
  Future<List<BandItemModel>> getBandsWithProfession(
      ProfessionItemModel professionItemModel) async {
    return await bandService.getBandsWithProfession(professionItemModel);
  }

  @override
  Future<BandItemModel?> getSelectedBand() async {
    return await settingDatabase.getSelectedBand();
  }

  @override
  Future<void> saveSelectedBand(BandItemModel band) async {
    await settingDatabase.saveSelectedBand(band);
  }
}
