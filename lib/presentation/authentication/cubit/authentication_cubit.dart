import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stepper/config/extensions/string_extensions.dart';
import 'package:stepper/domain/exceptions/exceptions.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../services/apple_sign_in_service.dart';

part 'authentication_state.dart';

enum SignInPlatform {
  web,
  android,
  ios,
}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ["email", "https://www.googleapis.com/auth/userinfo.profile"]);

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

  Future<UserCredential> signInGoogleWeb() async {
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    authProvider.setCustomParameters({"prompt": "select_account"});
    final userCredential = await authRepository.signInWithPopup(authProvider);
    return userCredential;
  }

  Future<UserCredential?> signInGoogleMobile() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential =
        await authRepository.signInWithCredential(credential);
    return userCredential;
  }

  Future<void> signInApple() async {
    try {
      var appleSignInService = AppleSignInService();

      final rawNonce = appleSignInService.generateNonce();
      final nonce = appleSignInService.sha256ofString(rawNonce);

      AuthorizationCredentialAppleID appleCredential =
      await appleSignInService(nonce);

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      final userCredential =
      await authRepository.signInWithCredential(oauthCredential);

      final isUserProfileCreated = await _checkUserProfileCreated();
      if (!isUserProfileCreated) {
        await _createInitialUserProfile();
      }

      final email = userCredential.user!.email;
      final name = userCredential.user!.displayName;
      emit(
        AuthenticatedState(
          userEmail: email ?? '',
          userName: email != null && email.isNotEmpty
              ? email.split('@')[0].capitalizeFirstLetter()
              : name ?? userCredential.user!.uid,
        ),
      );
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  bool isUserSignedIn() => authRepository.authUser != null;

  Future<void> signIn() async {
    late UserCredential? userCredential;
    try {
      if (kIsWeb) {
        userCredential = await signInGoogleWeb();
      } else {
        userCredential = await signInGoogleMobile();
      }

      if (userCredential == null) return;

      final isUserProfileCreated = await _checkUserProfileCreated();
      if (!isUserProfileCreated) {
        await _createInitialUserProfile();
      }

      final email = userCredential.user!.email!;
      emit(
        AuthenticatedState(
          userEmail: email,
          userName: email.split('@')[0].capitalizeFirstLetter(),
        ),
      );
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  _createInitialUserProfile() async {
    await userRepository.createUser();
  }

  Future<bool> _checkUserProfileCreated() async {
    final userProfile = await userRepository.getUser();
    return userProfile != null;
  }

  Future<void> onUserSignOut() async {
    try {
      emit(AuthenticationInitial());
      if (!kIsWeb) {
        await _googleSignIn.signOut();
      }

      await authRepository.signOut();
    } on AuthException catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }
}
