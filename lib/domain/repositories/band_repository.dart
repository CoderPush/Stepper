import 'package:stepper/data/model/models.dart';

abstract class BandRepository {
  Future<List<BandItemModel>> getBandsWithProfession(
      ProfessionItemModel professionItemModel);

  Future<BandItemModel?> getSelectedBand();

  Future<List<String>> getBandWithChildBand();

  Future<List<String>> getAllAreasOfABand();

  Future<void> saveSelectedBand(BandItemModel band);

  Future<BandItemModel> getBandByAreaName(String areaName);
}
