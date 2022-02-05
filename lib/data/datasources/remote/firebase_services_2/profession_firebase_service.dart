import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/model2/models2.dart';

class ProfessionFirebaseService {
  final FirebaseFirestore firestore;

  ProfessionFirebaseService({required this.firestore});

  Future<List<Profession>> getAllProfessions() async {
    final querySnapshot = await firestore.collection('professions').get();
    final professions = querySnapshot.docs.map((doc) {
      return Profession.fromJson(doc.data());
    }).toList();

    return professions;
  }

  Future<Profession?> getProfessionById({required String professionId}) async {
    try {
      final querySnapshot =
          await firestore.collection('professions').doc(professionId).get();
      if (querySnapshot.exists) {
        return Profession.fromJson(querySnapshot.data()!);
      }
      return null;
    } catch (error) {}
  }
}
