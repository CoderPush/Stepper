import 'package:stepper/data/datasources/remote/firebase_services_2/firebase_services.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/domain/repositories2/area_repository.dart';

class AreaRepositoryImpl implements AreaRepository {
  AreaFirebaseService2 areaFirebaseService;

  AreaRepositoryImpl({required this.areaFirebaseService});

  @override
  Future<List<Area>> getAllAreas() async {
    return await areaFirebaseService.getAllAreas();
  }

  @override
  Future<List<Area>> getAreasByAreaTypeAndBandId(
      {required AreaType areaType, required String bandId}) async {
    return areaFirebaseService.getAreasByAreaTypeAndBandId(
        areaType: areaType.name, bandId: bandId);
  }
}
