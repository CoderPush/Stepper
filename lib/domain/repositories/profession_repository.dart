import 'package:stepper/data/models/profession.dart';

abstract class ProfessionRepository {
  Future<List<Profession>> getAllProfessions();
  Future<Profession?> getProfessionById({required String professionId});
}
