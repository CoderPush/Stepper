import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:stepper/data/model/profession/profession_model.dart';

class ProfessionService {
  Future<ProfessionModel> getProfessions() async {
    final data = await rootBundle.loadString('assets/data.json');
    final jsonData = json.decode(data);
    final professions = ProfessionModel.fromJson(jsonData);
    return professions;
  }
}
