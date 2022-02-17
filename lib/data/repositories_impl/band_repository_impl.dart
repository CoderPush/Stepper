import 'package:stepper/data/datasources/firebase_services/band_firebase_service.dart';
import 'package:stepper/data/models/band.dart';
import 'package:stepper/data/models/profession.dart';
import 'package:stepper/domain/repositories/band_repository.dart';

class BandRepositoryImpl implements BandRepository {
  BandFirebaseService bandFirebaseService;

  BandRepositoryImpl({required this.bandFirebaseService});

  @override
  Future<List<Band>> getAllBands() {
    return bandFirebaseService.getAllBands();
  }

  @override
  Future<List<Band>> getBandsByProfessionType(
      {required ProfessionType professionType}) async {
    return await bandFirebaseService.getBandsByProfessionType(
        professionType: Profession.enumMap[professionType]);
  }

  @override
  Future<Band?> getBandById({required String bandId}) async {
    return await bandFirebaseService.getBandById(bandId: bandId);
  }
}
