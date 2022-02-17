import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:stepper/data/datasources/firebase_services/firebase_services.dart';
import 'package:stepper/data/helpers/precache_firestore_handler.dart';
import 'package:stepper/data/repositories_impl/repositories_impl.dart';
import 'package:stepper/domain/repositories/repositories.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<ProfessionFirebaseService>(
      () => ProfessionFirebaseService(firestore: sl()));

  sl.registerLazySingleton<BandFirebaseService>(
      () => BandFirebaseService(firestore: sl()));

  sl.registerLazySingleton<AreaFirebaseService>(
      () => AreaFirebaseService(firestore: sl()));

  sl.registerLazySingleton<AuthFirebaseService>(
      () => AuthFirebaseService(firebaseAuth: sl()));

  sl.registerLazySingleton<UserFirebaseService>(
      () => UserFirebaseService(firestore: sl(), firebaseStorage: sl()));

  sl.registerLazySingleton<PostFirebaseService>(
      () => PostFirebaseService(firestore: sl()));

  sl.registerLazySingleton<ProfessionRepository>(
      () => ProfessionRepositoryImpl(professionFirebaseService: sl()));

  sl.registerLazySingleton<BandRepository>(
      () => BandRepositoryImpl(bandFirebaseService: sl()));

  sl.registerLazySingleton<AreaRepository>(
      () => AreaRepositoryImpl(areaFirebaseService: sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authFirebaseService: sl()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      userFirebaseService: sl(),
      authRepository: sl(),
      professionRepository: sl(),
      bandRepository: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postFirebaseService: sl()));

  sl.registerLazySingleton<PreCacheFirestoreHandler>(() =>
      PreCacheFirestoreHandler(
          authFirebaseService: sl(),
          userFirebaseService: sl(),
          professionFirebaseService: sl(),
          bandFirebaseService: sl(),
          areaFirebaseService: sl()));

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
}
