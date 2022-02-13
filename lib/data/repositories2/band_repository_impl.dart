import 'package:stepper/data/datasources/remote/firebase_services_2/band_firebase_service.dart';
import 'package:stepper/data/model2/band.dart';
import 'package:stepper/data/model2/profession.dart';
import 'package:stepper/domain/repositories2/band_repository.dart';

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
