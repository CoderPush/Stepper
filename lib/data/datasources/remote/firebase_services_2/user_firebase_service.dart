import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model2/user.dart';

class UserFirebaseService {
  FirebaseFirestore firestore;

  UserFirebaseService({required this.firestore});

  Future<User> getUser() async {
    var userDocSnap = await firestore.userDocument();
    var userDoc = await userDocSnap.get();
    return User.fromJson(userDoc.data() as Map<String, dynamic>);
  }

  Future<void> createUser(Map<String, dynamic> dataJson) async {
    var userDocSnap = await firestore.userDocument();
    var userDoc = await userDocSnap.set(
      {
        ...dataJson,
        "created_at": FieldValue.serverTimestamp(),
        "updated_at": FieldValue.serverTimestamp()
      },
    );
  }

  Future<void> updateUser(Map<String, dynamic> dataJson) async {
    var userDocSnap = await firestore.userDocument();
    await userDocSnap.set(
        {...dataJson, "updated_at": FieldValue.serverTimestamp()},
        SetOptions(merge: true));
  }
}
