import 'package:get_it/get_it.dart';
import 'package:stepper/data/datasources/remote/firebase_services_2/firebase_services.dart';
import 'package:stepper/data/helpers/precache_firestore_handler.dart';
import 'package:stepper/data/repositories2/repositories_impl2.dart';
import 'package:stepper/domain/repositories2/repositories2.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies2() async {
  locator.registerLazySingleton<ProfessionFirebaseService>(
      () => ProfessionFirebaseService(firestore: locator()));

  locator.registerLazySingleton<BandFirebaseService>(
      () => BandFirebaseService(firestore: locator()));

  locator.registerLazySingleton<AreaFirebaseService2>(
      () => AreaFirebaseService2(firestore: locator()));

  locator.registerLazySingleton<AuthFirebaseService>(
      () => AuthFirebaseService(firebaseAuth: locator()));

  locator.registerLazySingleton<UserFirebaseService>(() =>
      UserFirebaseService(firestore: locator(), firebaseStorage: locator()));

  locator.registerLazySingleton<PostFirebaseService>(
      () => PostFirebaseService(firestore: locator()));

  locator.registerLazySingleton<ProfessionRepository>(
      () => ProfessionRepositoryImpl(professionFirebaseService: locator()));

  locator.registerLazySingleton<BandRepository>(
      () => BandRepositoryImpl(bandFirebaseService: locator()));

  locator.registerLazySingleton<AreaRepository>(
      () => AreaRepositoryImpl(areaFirebaseService: locator()));

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authFirebaseService: locator()));

  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      userFirebaseService: locator(),
      authRepository: locator(),
      professionRepository: locator(),
      bandRepository: locator()));

  locator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postFirebaseService: locator()));

  locator.registerLazySingleton<PreCacheFirestoreHandler>(() =>
      PreCacheFirestoreHandler(
          authFirebaseService: locator(),
          userFirebaseService: locator(),
          professionFirebaseService: locator(),
          bandFirebaseService: locator(),
          areaFirebaseService: locator()));
}
