import 'package:stepper/data/model/models.dart';

abstract class ProfessionRepository {
  Future<ProfessionModel> getProfessions();

  Future<ProfessionItemModel> getProfessionByName(String professionName);

  Future<String> getSelectedProfession();

  Future<void> saveSelectedProfession(String professionName);
}
