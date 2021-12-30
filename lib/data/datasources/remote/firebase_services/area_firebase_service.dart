import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model/area.dart';
import 'package:stepper/presentation/utils.dart';

class AreaFirebaseService {
  final FirebaseFirestore firestore;

  AreaFirebaseService({required this.firestore});

  // update area to Firestore
  Future<void> updateArea(
      String areaName, Map<String, dynamic> updatedFields) async {
    final userDoc = await firestore.userDocument();
    userDoc.areaCollection
        .doc(areaName)
        .set(updatedFields, SetOptions(merge: true));
  }

  // get area by name
  Future<Area> getAreaByAreaName(String areaName) async {
    final commonAreaDoc = await firestore.commonAreaDocument(areaName);
    final commonAreaSnapshot = await commonAreaDoc.get();
    final areaSnapshot = await _getUserAreaSnapshot(areaName);
    final area =
        Area.fromJson(commonAreaSnapshot.data() as Map<String, dynamic>);
    if (areaSnapshot != null && areaSnapshot.data() != null) {
      final areaJson = areaSnapshot.data() as Map<String, dynamic>;
      return area.copyWith(
        numberOfUpdate: areaJson['numberOfUpdate'],
        rating: areaJson['rating'],
      );
    } else {
      return area;
    }
  }

  Future<DocumentSnapshot?> _getUserAreaSnapshot(String areaName) async {
    final userDoc = await firestore.userDocument();
    try {
      return await userDoc.areaCollection.doc(areaName).get();
    } catch (e) {
      return null;
    }
  }

  // get all areas
  Future<List<Area>> getAllAreas() async {
    final userDoc = await firestore.userDocument();
    final areaSnapshot = await userDoc.areaCollection.get();
    final commonAreasSnapshot =
        await FirebaseFirestore.instance.collection('commonAreas').get();
    var listOfAreas = commonAreasSnapshot.docs
        .map((doc) => Area.fromJson(doc.data()))
        .toList();
    if (areaSnapshot.docs.isNotEmpty) {
      for (var area in areaSnapshot.docs) {
        final areaJson = area.data() as Map<String, dynamic>;
        listOfAreas = listOfAreas.map((commonArea) {
          if (commonArea.areaName == area.id) {
            return commonArea.copyWith(
              numberOfUpdate: areaJson['numberOfUpdate'],
              rating: areaJson['rating'],
              updatedTime: parseTime(areaJson['updatedTime']),
            );
          }
          return commonArea;
        }).toList();
      }
    }
    return listOfAreas;
  }
}
