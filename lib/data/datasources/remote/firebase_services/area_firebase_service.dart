import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';

class AreaFirebaseService {
  final FirebaseFirestore firestore;

  AreaFirebaseService({required this.firestore});

  // update area to Firestore
  Future<void> updateArea(
      String areaName, Map<String, dynamic> updatedFields) async {
    final userDoc = await firestore.userDocument();
    await userDoc.areaCollection
        .doc(areaName)
        .set(updatedFields, SetOptions(merge: true));
  }
}
