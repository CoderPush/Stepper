import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/model/profession/profession_model.dart';

abstract class ProfessionRepository {
  Future<ProfessionModel> getProfessions();

  Future<ProfessionItemModel> getProfessionByName(String professionName);

  Future<String?> getSelectedProfession();

  Future<void> saveSelectedProfession(String professionName);
}
