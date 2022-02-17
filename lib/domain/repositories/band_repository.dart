import 'package:stepper/data/models/band.dart';
import 'package:stepper/data/models/profession.dart';

abstract class BandRepository {
  Future<List<Band>> getAllBands();

  Future<List<Band>> getBandsByProfessionType(
      {required ProfessionType professionType});

  Future<Band?> getBandById({required String bandId});
}
