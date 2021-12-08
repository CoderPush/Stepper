import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepper/domain/exceptions/auth_exception.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/injection_container.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final user = sl<UserRepository>().getSignedInUser();
    if (user == null) {
      throw const AuthException('Not authenticated');
    }
    return FirebaseFirestore.instance.collection('users').doc(user.uid);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get postCollection => collection('posts');

  CollectionReference get areaCollection => collection('areas');
}
