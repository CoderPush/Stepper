import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stepper/data/model/models.dart';

class BandService {
  Future<List<BandItemModel>> getBandsWithProfession(
      ProfessionItemModel professionItemModel) async {
    final bandModel = await _getBandModel();
    return bandModel.bands
        .where((band) => professionItemModel.bandIds.contains(band.bandId))
        .toList();
  }

  Future<BandItemModel> getBandById(String bandId) async {
    final bandModel = await _getBandModel();
    return bandModel.bands.firstWhere((band) => band.bandId == bandId);
  }

  Future<BandItemModel> getBandByName(String bandId) async {
    final bandModel = await _getBandModel();
    return bandModel.bands.firstWhere((band) => band.bandName == bandId);
  }

  Future<BandItemModel> getBandByAreaName(String areaName) async {
    final bandModel = await _getBandModel();
    return bandModel.bands
        .firstWhere((band) => band.areaNames.contains(areaName));
  }

  Future<BandModel> _getBandModel() async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(data);
    return BandModel.fromJson(jsonData);
  }
}
