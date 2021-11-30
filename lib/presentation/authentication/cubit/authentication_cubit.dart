import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/domain/exceptions/exceptions.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationCubit({required this.userRepository})
      : super(AuthenticationInitial()) {
    startApp();
  }

  Future<void> startApp() async {
    try {
      final isSignedIn = await userRepository.isSignedIn();
      if (isSignedIn) {
        emit(AuthenticatedState());
      } else {
        emit(UnauthenticatedState());
      }
    } catch (error) {
      emit(UnauthenticatedState());
    }
  }

  Future<void> signInWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      await userRepository.signInWithEmailAndPassword(
          emailAddress: emailAddress, password: password);
      emit(AuthenticatedState());
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> registerWithEmailAndPassword(
      String emailAddress, String password) async {
    try {
      await userRepository.registerWithEmailAndPassword(
          emailAddress: emailAddress, password: password);
      emit(AuthenticatedState());
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }
}
