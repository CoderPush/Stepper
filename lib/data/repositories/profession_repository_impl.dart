import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/model/profession/profession_item_model.dart';
import 'package:stepper/data/model/profession/profession_model.dart';
import 'package:stepper/data/datasources/remote/profession_service.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';

class ProfessionRepositoryImpl implements ProfessionRepository {
  final ProfessionService professionService;
  final SettingDatabase settingDatabase;

  ProfessionRepositoryImpl({
    required this.professionService,
    required this.settingDatabase,
  });

  @override
  Future<ProfessionModel> getProfessions() async {
    return await professionService.getProfessions();
  }

  @override
  Future<String?> getSelectedProfession() async {
    return await settingDatabase.getSelectedProfession();
  }

  @override
  Future<ProfessionItemModel> getProfessionByName(String professionName) async {
    return await professionService.getProfessionByName(professionName);
  }

  @override
  Future<void> saveSelectedProfession(String professionName) async {
    await settingDatabase.saveSelectedProfession(professionName);
  }
}
