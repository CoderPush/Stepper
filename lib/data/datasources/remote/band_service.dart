import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stepper/data/model/models.dart';

class BandService {
  Future<List<BandItemModel>> getBandsWithProfession(
      ProfessionItemModel professionItemModel) async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(data);
    final bandModel = BandModel.fromJson(jsonData);
    return bandModel.bands
        .where((band) => professionItemModel.bandIds.contains(band.bandId))
        .toList();
  }
}
