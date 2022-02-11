import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stepper/data/helpers/firestore_helpers.dart';
import 'package:stepper/data/model2/user.dart';

class UserFirebaseService {
  FirebaseFirestore firestore;
  FirebaseStorage firebaseStorage;

  UserFirebaseService({required this.firestore, required this.firebaseStorage});

  Future<User> getUser() async {
    var userDocSnap = await firestore.userDocument();
    var userDoc = await userDocSnap.get();
    return User.fromJson(userDoc.data() as Map<String, dynamic>);
  }

  Stream<User> subscribeUser() async* {
    var userDocSnap = await firestore.userDocument();
    var userStream = userDocSnap.snapshots();
    yield* userStream
        .map((change) => User.fromJson(change.data() as Map<String, dynamic>));
  }

  Future<void> createUser(Map<String, dynamic> dataJson) async {
    var userDocSnap = await firestore.userDocument();
    await userDocSnap.set(
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

  Future<String?> uploadFile(
      {required File file, Function(String url)? onUploadSuccess}) async {
    try {
      final fileName = basename(file.path);
      final ref = firebaseStorage.ref('users_files/$fileName');
      await ref.putFile(file);
      String url = await ref.getDownloadURL();
      return url;
    } catch (error) {
      return null;
    }
  }
}
