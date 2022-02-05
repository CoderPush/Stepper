import 'package:stepper/data/datasources/remote/firebase_services_2/band_firebase_service.dart';
import 'package:stepper/data/model2/band.dart';
import 'package:stepper/domain/repositories2/band_repository.dart';

class BandRepositoryImpl implements BandRepository {
  BandFirebaseService bandFirebaseService;

  BandRepositoryImpl({required this.bandFirebaseService});

  @override
  Future<List<Band>> getBandsByProfessionType(
      {required String professionType}) async {
    return await bandFirebaseService.getBandsByProfessionType(
        professionType: professionType);
  }

  @override
  Future<Band?> getBandById({required String bandId}) async {
    return await bandFirebaseService.getBandById(bandId: bandId);
  }
}
