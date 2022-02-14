import 'dart:async';
import 'dart:developer';

import 'package:stepper/data/datasources/remote/firebase_services_2/firebase_services.dart';

class PreCacheFirestoreHandler {
  AuthFirebaseService authFirebaseService;
  UserFirebaseService userFirebaseService;
  ProfessionFirebaseService professionFirebaseService;
  BandFirebaseService bandFirebaseService;
  AreaFirebaseService2 areaFirebaseService;

  StreamSubscription? _authenticatedUserSubscription;

  PreCacheFirestoreHandler(
      {required this.authFirebaseService,
      required this.userFirebaseService,
      required this.professionFirebaseService,
      required this.bandFirebaseService,
      required this.areaFirebaseService});

  init() async {
    _authenticatedUserSubscription = authFirebaseService
        .subscribeAuthenticatedUser()
        .listen((auththenticatedUser) {
      final isSignedIn = auththenticatedUser != null;
      if (isSignedIn) {
        _preCacheFirestore();
      }
    });
  }

  _preCacheFirestore() async {
    await userFirebaseService.getUser();
    log("User data successfully cached");
    await professionFirebaseService.getAllProfessions();
    log("Professions data successfully cached");
    await bandFirebaseService.getAllBands();
    log("Bands data successfully cached");
    await areaFirebaseService.getAllAreas();
    log("Successfully pre cache firestore for offline mode");
  }

  close() {
    _authenticatedUserSubscription?.cancel();
  }
}
