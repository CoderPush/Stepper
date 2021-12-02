import 'package:firebase_auth/firebase_auth.dart';
import 'package:stepper/domain/exceptions/exceptions.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseAuth firebaseAuth;

  UserRepositoryImpl({required this.firebaseAuth});

  @override
  Future<void> registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      String authError = "";
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        authError = 'Email already in use';
      } else {
        authError = 'Network error';
      }
      throw AuthException(authError);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      String authError = "";
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        authError = 'Invalid email or password';
      } else {
        authError = 'Network error';
      }
      throw AuthException(authError);
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<bool> isSignedIn() async {
    return firebaseAuth.currentUser != null;
  }

  @override
  User? getSignedInUser() {
    return firebaseAuth.currentUser;
  }
}
