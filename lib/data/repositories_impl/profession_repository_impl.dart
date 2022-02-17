import 'package:stepper/data/datasources/firebase_service/profession_firebase_service.dart';
import 'package:stepper/data/models/profession.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';

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
