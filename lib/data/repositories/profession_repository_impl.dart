import 'package:stepper/data/model/profession/profession_model.dart';
import 'package:stepper/data/datasources/remote/profession_service.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';

class ProfessionRepositoryImpl implements ProfessionRepository {
  final ProfessionService professionService;

  ProfessionRepositoryImpl({required this.professionService});

  @override
  Future<ProfessionModel> getProfessions() {
    return professionService.getProfessions();
  }
}
