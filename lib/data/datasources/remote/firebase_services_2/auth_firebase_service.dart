import 'package:firebase_auth/firebase_auth.dart';
import 'package:stepper/data/helpers/errors.dart';
import 'package:stepper/domain/exceptions/auth_exception.dart';

class AuthFirebaseService {
  final FirebaseAuth firebaseAuth;

  AuthFirebaseService({required this.firebaseAuth});

  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String authError = "";
      if (e.code == ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE) {
        authError = ErrorMessages.ERROR_EMAIL_ALREADY_IN_USE;
      } else {
        authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
      }
      throw AuthException(authError);
    }
  }

  signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String authError = "";
      if (e.code == ErrorCodes.ERROR_USER_NOT_FOUND ||
          e.code == ErrorCodes.ERROR_CODE_WRONG_PASSWORD) {
        authError = ErrorMessages.ERROR_INVALID_EMAIL_OR_PASSWORD;
      } else {
        authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
      }
      throw AuthException(authError);
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  User? get authUser => firebaseAuth.currentUser;

  Stream<User?> subscribeAuthenticatedUser() {
    return firebaseAuth.authStateChanges();
  }
}
