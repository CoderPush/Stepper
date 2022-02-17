import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/models/models.dart';

class BandFirebaseService {
  final FirebaseFirestore firestore;

  BandFirebaseService({required this.firestore});

  Future<List<Band>> getAllBands() async {
    final querySnapshot = await firestore.collection('bands').get();
    final bands = querySnapshot.docs.map((doc) {
      return Band.fromJson(doc.data());
    }).toList();

    return bands;
  }

  Future<Band?> getBandById({required String bandId}) async {
    try {
      final querySnapshot =
          await firestore.collection('bands').doc(bandId).get();
      if (querySnapshot.exists) {
        return Band.fromJson(querySnapshot.data()!);
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  Future<List<Band>> getBandsByProfessionType(
      {required String professionType}) async {
    try {
      final querySnapshot = await firestore
          .collection('bands')
          .where('type', isEqualTo: professionType)
          .get();

      return querySnapshot.docs
          .map((doc) => Band.fromJson(doc.data()))
          .toList();
    } catch (error) {
      return [];
    }
  }
}
