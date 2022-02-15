import 'package:stepper/data/model2/band.dart';
import 'package:stepper/data/model2/profession.dart';

abstract class BandRepository {
  Future<List<Band>> getAllBands();

  Future<List<Band>> getBandsByProfessionType(
      {required ProfessionType professionType});

  Future<Band?> getBandById({required String bandId});
}
