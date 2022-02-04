import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/model2/model.dart';

class AreaFirebaseService2 {
  final FirebaseFirestore firestore;

  AreaFirebaseService2({required this.firestore});

  Future<List<Area>> getAllAreas() async {
    final querySnapshot = await firestore.collection('areas').get();
    final areas = querySnapshot.docs.map((doc) {
      return Area.fromJson(doc.data());
    }).toList();

    return areas;
  }

  Future<Area?> getAreaById({required String areaId}) async {
    try {
      final querySnapshot =
          await firestore.collection('areas').doc(areaId).get();
      if (querySnapshot.exists) {
        return Area.fromJson(querySnapshot.data()!);
      }
      return null;
    } catch (error) {}
  }

  Future<List<Area>> getAreasByAreaTypeAndBandId(
      {required String areaType, required String bandId}) async {
    try {
      final querySnapshot = await firestore
          .collection('areas')
          .where("type", isEqualTo: areaType)
          .where("band_id", isEqualTo: bandId)
          .get();
      final filteredAreas =
          querySnapshot.docs.map((doc) => Area.fromJson(doc.data())).toList();
      return filteredAreas;
    } catch (error) {
      return [];
    }
  }
}
