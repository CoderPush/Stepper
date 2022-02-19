import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signUp({required String email, required String password});

  Future<void> signIn({required String email, required String password});

  Future<UserCredential> signInWithCredential(AuthCredential credential);

  Future<UserCredential> signInWithPopup(GoogleAuthProvider authProvider);

  Future<void> signOut();

  User? get authUser;

  Stream<User?> subscribeAuthenticatedUser();
}
