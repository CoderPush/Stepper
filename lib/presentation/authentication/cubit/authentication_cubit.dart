import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stepper/config/extensions/string_extensions.dart';
import 'package:stepper/domain/exceptions/exceptions.dart';
import 'package:stepper/domain/repositories/repositories.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository userRepository;
  final ProfessionRepository professionRepository;
  final BandRepository bandRepository;

  AuthenticationCubit({
    required this.userRepository,
    required this.professionRepository,
    required this.bandRepository,
  }) : super(AuthenticationInitial()) {
    startApp();
  }

  Future<void> startApp() async {
    try {
      final isSignedIn = await userRepository.isSignedIn();
      if (isSignedIn) {
        emit(AuthenticatedState(
          userEmail: userRepository.getSignedInUser()!.email!,
          userName: userRepository.getSignedInUser()!.email!.split('@')[0].capitalizeFirstLetter(),
        ));
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
      await userRepository.registerWithEmailAndPassword(
          emailAddress: emailAddress, password: password);
      await _setupUserSettings();
      emit(AuthenticatedState(
        userEmail: emailAddress,
        userName: emailAddress.split('@')[0].capitalizeFirstLetter(),
      ));
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> onUserSignOut() async {
    try {
      emit(AuthenticationInitial());
      await Future.delayed(const Duration(seconds: 1));
      await userRepository.signOut();
      emit(UnauthenticatedState());
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  Future<void> _setupUserSettings() async {
    final professionList =
        (await professionRepository.getProfessions()).professions;

    // save selected profession
    await professionRepository
        .saveSelectedProfession(professionList[0].professionName);

    final bandList = await bandRepository.getBandsWithProfession(
        professionList.firstWhere((profession) =>
            profession.professionName == professionList[0].professionName));

    // save selectedBand
    await bandRepository.saveSelectedBand(bandList[0]);
  }
}
