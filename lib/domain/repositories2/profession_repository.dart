import 'package:stepper/data/model2/profession.dart';

abstract class ProfessionRepository {
  Future<List<Profession>> getAllProfessions();
}
