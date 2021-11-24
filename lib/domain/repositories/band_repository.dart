import 'package:stepper/data/model/models.dart';

abstract class BandRepository {
  Future<List<BandItemModel>> getBandsWithProfession(
      ProfessionItemModel professionItemModel);

  Future<BandItemModel?> getSelectedBand();

  Future<void> saveSelectedBand(BandItemModel band);
}
