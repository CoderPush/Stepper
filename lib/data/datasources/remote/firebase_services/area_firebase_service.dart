import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model/models.dart';

class AreaFirebaseService {
  final FirebaseFirestore firestore;

  AreaFirebaseService({required this.firestore});

  // update area to Firestore
  Future<void> updateArea(
      String areaName, Map<String, dynamic> updatedFields) async {
    final userDoc = await firestore.userDocument();
    await userDoc.areaCollection.doc(areaName).update(updatedFields);
  }

  // add area to Firebase
  Future<void> addArea(Area area) async {
    final userDoc = await firestore.userDocument();
    await userDoc.areaCollection
        .doc(area.areaName)
        .set(area.toJson(), SetOptions(merge: true));
  }
}
