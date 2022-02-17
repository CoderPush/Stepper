import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/domain/exceptions/auth_exception.dart';
import 'package:stepper/data/datasources/firebase_services/firebase_services.dart';
import 'package:stepper/injection_container.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final user = sl<AuthFirebaseService>().authUser;

    if (user == null) {
      throw const AuthException('Not authenticated');
    }
    return FirebaseFirestore.instance.collection('users').doc(user.email);
  }

  CollectionReference get areaCollection => collection('areas');

  Future<DocumentReference> commonAreaDocument(String areaName) async {
    return FirebaseFirestore.instance.collection('commonAreas').doc(areaName);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get postCollection => collection('posts');

  CollectionReference get areaCollection => collection('areas');

  CollectionReference get userAreaCollection => collection('user_areas');

  CollectionReference get settingCollection => collection('settings');
}
