import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/config/extensions/string_extensions.dart';
import 'package:stepper/domain/exceptions/exceptions.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  AuthenticationCubit({
    required this.authRepository,
    required this.userRepository,
  }) : super(AuthenticationInitial()) {
    startApp();
  }

  Future<void> startApp() async {
    try {
      final isSignedIn = authRepository.authUser != null;
      if (isSignedIn) {
        var email = authRepository.authUser?.email;
        emit(AuthenticatedState(
          userEmail: email!,
          userName: email.split('@')[0].capitalizeFirstLetter(),
        ));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (error) {
      emit(UnauthenticatedState());
    }
  }

  bool isUserSignedIn() => authRepository.authUser != null;

  Future<void> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      await authRepository.signIn(email: emailAddress, password: password);
      emit(AuthenticatedState(
        userEmail: emailAddress,
        userName: emailAddress.split('@')[0].capitalizeFirstLetter(),
      ));
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> registerWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      await authRepository.signUp(email: emailAddress, password: password);
      await _createInitialUserData();
      emit(AuthenticatedState(
        userEmail: emailAddress,
        userName: emailAddress.split('@')[0].capitalizeFirstLetter(),
      ));
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  _createInitialUserData() async {
    await userRepository.createUser();
  }

  Future<void> onUserSignOut() async {
    try {
      emit(AuthenticationInitial());
      await Future.delayed(const Duration(seconds: 1));
      await authRepository.signOut();
      emit(UnauthenticatedState());
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }
}
