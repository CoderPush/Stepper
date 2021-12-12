import 'package:stepper/data/datasources/remote/firebase_services/setting_firebase_service.dart';
import 'package:stepper/data/model/profession/profession_item_model.dart';
import 'package:stepper/data/model/profession/profession_model.dart';
import 'package:stepper/data/datasources/remote/profession_service.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';

class ProfessionRepositoryImpl implements ProfessionRepository {
  final ProfessionService professionService;
  final SettingFirebaseService settingFirebaseService;

  ProfessionRepositoryImpl({
    required this.professionService,
    required this.settingFirebaseService,
  });

  @override
  Future<ProfessionModel> getProfessions() async {
    return await professionService.getProfessions();
  }

  @override
  Future<String> getSelectedProfession() async {
    return await settingFirebaseService.getSelectedProfession();
  }

  @override
  Future<ProfessionItemModel> getProfessionByName(String professionName) async {
    return await professionService.getProfessionByName(professionName);
  }

  @override
  Future<void> saveSelectedProfession(String professionName) async {
    await settingFirebaseService.saveSelectedProfession(professionName);
  }
}
