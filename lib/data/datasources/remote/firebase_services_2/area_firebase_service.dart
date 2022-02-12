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
    } catch (error) {
      return null;
    }
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

  Stream<List<Area>> subscribeUserAreas() async* {
    final userDoc = await firestore.userDocument();
    final areaStream = userDoc.userAreaCollection
        .where("updated_at", isNull: false)
        .orderBy("updated_at", descending: true)
        .limit(6)
        .snapshots();
    yield* areaStream.map((snapshot) => snapshot.docs
        .map((doc) => Area.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<Area> updateUserArea(
      {required String areaId, required Map<String, dynamic> data}) async {
    final userDoc = await firestore.userDocument();
    final modifiedData = {...data, "updated_at": FieldValue.serverTimestamp()};
    await userDoc.areaCollection
        .doc(areaId)
        .set(modifiedData, SetOptions(merge: true));
    final updatedAreaSnap = await userDoc.areaCollection.doc(areaId).get();
    return Area.fromJson(updatedAreaSnap.data() as Map<String, dynamic>);
  }

  Future importAreasToUserAreas(List<Area> areas) async {
    final userDoc = await firestore.userDocument();
    final batch = firestore.batch();
    for (var area in areas) {
      final userAreaDoc = userDoc.userAreaCollection.doc(area.id);
      batch.set(userAreaDoc, area.toJson(), SetOptions(merge: true));
    }
    await batch.commit();
  }
}
