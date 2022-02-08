import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/model2/models2.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';

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

  Future<List<Area>> getUserAreas() async {
    final userDocSnap = await firestore.userDocument();
    final areasSnap = await userDocSnap.areaCollection.get();
    return areasSnap.docs
        .map((doc) => Area.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<List<Area>> getUserAreasByAreaTypeAndBandId(
      {required String areaType, required String bandId}) async {
    final userDocSnap = await firestore.userDocument();
    final areasSnap = await userDocSnap.areaCollection
        .where("type", isEqualTo: areaType)
        .where("band_id", isEqualTo: bandId)
        .get();
    return areasSnap.docs
        .map((doc) => Area.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Stream<List<Area>> subscribeAreas() async* {
    final userDocSnap = await firestore.userDocument();
    final areaStream = userDocSnap.areaCollection.snapshots();
    yield* areaStream.map((snapshot) => snapshot.docs
        .map((doc) => Area.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
