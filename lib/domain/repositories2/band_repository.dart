import 'package:stepper/data/model2/band.dart';

abstract class BandRepository {
  Future<List<Band>> getBandsByProfessionType({required String professionType});
  Future<Band?> getBandById({required String bandId});
}
