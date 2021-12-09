import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<void> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });

  Future<void> signOut();

  Future<bool> isSignedIn();

  User? getSignedInUser();
}
