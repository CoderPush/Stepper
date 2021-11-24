import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/data/model/band/band_item_model.dart';

class SettingDatabase {
  final _boxName = "Setting";
  final professionKey = "profession";
  final bandKey = "band";

  // open a box
  Future<Box<dynamic>> settingBox() async {
    var box = await Hive.openBox<dynamic>(_boxName);
    return box;
  }

  // get selected profession
  Future<String?> getSelectedProfession() async {
    final box = await settingBox();
    return box.get(professionKey);
  }

  // save selected profession
  Future<void> saveSelectedProfession(String professionName) async {
    final box = await settingBox();
    box.put(professionKey, professionName);
  }

  // get selected band
  Future<BandItemModel?> getSelectedBand() async {
    final box = await settingBox();
    return box.get(bandKey);
  }

  // save selected band
  Future<void> saveSelectedBand(BandItemModel band) async {
    final box = await settingBox();
    box.put(bandKey, band);
  }
}
