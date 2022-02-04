import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/model2/model.dart';

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
    } catch (error) {}
  }

  Future<List<Band>> getBandsByType({required String bandType}) async {
    try {
      final querySnapshot = await firestore
          .collection('bands')
          .where('type', isEqualTo: bandType)
          .get();

      return querySnapshot.docs
          .map((doc) => Band.fromJson(doc.data()))
          .toList();
    } catch (error) {
      return [];
    }
  }
}
