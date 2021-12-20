import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model/models.dart';

class SettingFirebaseService {
  final FirebaseFirestore firestore;

  SettingFirebaseService({required this.firestore});

  Future<String> getSelectedProfession() async {
    final userDoc = await firestore.userDocument();
    final userSnapshot = await userDoc.get();
    return (userSnapshot.data() as Map<String, dynamic>)['currentProfession'];
  }

  Future<void> saveSelectedProfession(String professionName) async {
    final userDoc = await firestore.userDocument();
    userDoc.set(
      {'currentProfession': professionName},
      SetOptions(merge: true),
    );
  }

  Future<BandItemModel> getSelectedBand() async {
    final userDoc = await firestore.userDocument();
    final bandSnapshot = await userDoc.settingCollection.doc('band').get();
    return BandItemModel.fromJson(bandSnapshot.data() as Map<String, dynamic>);
  }

  Future<void> saveSelectedBand(BandItemModel band) async {
    final userDoc = await firestore.userDocument();
    userDoc.settingCollection.doc('band').set(band.toJson());
    // Save bandName for CMS table display
    userDoc.set({'bandName': band.bandName}, SetOptions(merge: true));
  }

  Future<void> saveParentAndChildrenAreaNames(List<String> areas) async {
    final userDoc = await firestore.userDocument();
    userDoc.settingCollection.doc('areas').set({'areas': areas});
  }

  Future<List<String>> getParentAndChildrenAreaNames() async {
    final userDoc = await firestore.userDocument();
    final areaSnapshot = await userDoc.settingCollection.doc('areas').get();
    final areaList = (areaSnapshot.data() as Map<String, dynamic>)['areas'];
    return (areaList as List<dynamic>).map((area) => area.toString()).toList();
  }

  Future<void> saveEmailFieldForCMS(String userEmail) async {
    final userDoc = await firestore.userDocument();
    await userDoc.set({'name': userEmail}, SetOptions(merge: true));
  }
}
