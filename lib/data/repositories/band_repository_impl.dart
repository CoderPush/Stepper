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
    final areas = await getAllAreasOfABand();
    await settingDatabase.saveParentAndChildrenAreaNames(areas);
  }

  @override
  Future<List<String>> getBandWithChildBand() async {
    final selectedBand = await getSelectedBand();
    final List<String> bandList = [];
    for (var i = 0; i < selectedBand!.childBands.length; i++) {
      final band = await bandService.getBandById(selectedBand.childBands[i]);
      bandList.add(band.bandName);
    }
    return bandList..add(selectedBand.bandName);
  }

  @override
  Future<List<String>> getAllAreasOfABand() async {
    final selectedBand = await getSelectedBand();
    final List<String> areaList = [];
    for (var i = 0; i < selectedBand!.childBands.length; i++) {
      final band = await bandService.getBandById(selectedBand.childBands[i]);
      areaList.addAll(band.areaNames);
    }
    return areaList..addAll(selectedBand.areaNames);
  }

  @override
  Future<BandItemModel> getBandByAreaName(String areaName) async {
    return await bandService.getBandByAreaName(areaName);
  }
}
