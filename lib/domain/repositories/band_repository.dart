import 'package:stepper/data/model/band/band_model.dart';

abstract class BandRepository {
  Future<BandModel> getBands();
}
