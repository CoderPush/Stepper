import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stepper/data/model/band/band_model.dart';

class BandService {
  Future<BandModel> getBands() async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(data);
    final bands = BandModel.fromJson(jsonData);
    return bands;
  }
}
