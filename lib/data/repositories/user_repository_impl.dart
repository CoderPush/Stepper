import 'package:firebase_auth/firebase_auth.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/helpers/errors.dart';
import 'package:stepper/domain/exceptions/exceptions.dart';
import 'package:stepper/domain/repositories/repositories.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseAuth firebaseAuth;
  final AreaService areaService;
  final AreaFirebaseService areaFirebaseService;

  UserRepositoryImpl({
    required this.firebaseAuth,
    required this.areaService,
    required this.areaFirebaseService,
  });

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
      if (e.code == ErrorCodes.ERROR_CODE_EMAIL_ALREADY_IN_USE) {
        authError = ErrorMessages.ERROR_EMAIL_ALREADY_IN_USE;
      } else {
        authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
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
      if (e.code == ErrorCodes.ERROR_USER_NOT_FOUND ||
          e.code == ErrorCodes.ERROR_CODE_WRONG_PASSWORD) {
        authError = ErrorMessages.ERROR_INVALID_EMAIL_OR_PASSWORD;
      } else {
        authError = ErrorMessages.ERROR_C0DE_NETWORK_ERROR;
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
