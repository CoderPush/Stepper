import 'package:stepper/data/model/band/band_model.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/data/datasources/remote/band_service.dart';

class BandRepositoryImpl implements BandRepository {
  final BandService bandService;

  BandRepositoryImpl({required this.bandService});

  @override
  Future<BandModel> getBands() {
    return bandService.getBands();
  }
}
