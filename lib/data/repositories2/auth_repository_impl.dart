import 'package:firebase_auth/firebase_auth.dart';
import 'package:stepper/data/datasources/remote/firebase_services_2/auth_firebase_service.dart';
import 'package:stepper/domain/repositories2/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthFirebaseService authFirebaseService;
  AuthRepositoryImpl({required this.authFirebaseService});

  @override
  Future<void> signUp({required String email, required String password}) async {
    await authFirebaseService.signUp(email: email, password: password);
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await authFirebaseService.signIn(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await authFirebaseService.signOut();
  }

  @override
  User? get authUser => authFirebaseService.authUser;

  @override
  Stream<User?> subscribeAuthenticatedUser() {
    return authFirebaseService.subscribeAuthenticatedUser();
  }
}
