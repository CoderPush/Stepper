import 'package:stepper/data/datasources/remote/firebase_services_2/profession_firebase_service.dart';
import 'package:stepper/data/model2/profession.dart';
import 'package:stepper/domain/repositories2/profession_repository.dart';

class ProfessionRepositoryImpl implements ProfessionRepository {
  ProfessionFirebaseService professionFirebaseService;

  ProfessionRepositoryImpl({required this.professionFirebaseService});

  @override
  Future<List<Profession>> getAllProfessions() async {
    return await professionFirebaseService.getAllProfessions();
  }

  @override
  Future<Profession?> getProfessionById({required String professionId}) async {
    return await professionFirebaseService.getProfessionById(
        professionId: professionId);
  }
}
