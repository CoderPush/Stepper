import 'package:stepper/data/model/profession/profession_model.dart';

abstract class ProfessionRepository {
  Future<ProfessionModel> getProfessions();
}
