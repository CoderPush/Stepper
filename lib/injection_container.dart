import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/profession_service.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/data/repositories/repositories_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features
  sl.registerLazySingleton<AreaRepository>(() => AreaRepositoryImpl(
        bandService: sl(),
        settingFirebaseService: sl(),
        postFirebaseService: sl(),
        areaFirebaseService: sl(),
      ));

  sl.registerLazySingleton<ProfessionRepository>(() => ProfessionRepositoryImpl(
        professionService: sl(),
        settingDatabase: sl(),
        settingFirebaseService: sl(),
      ));

  sl.registerLazySingleton<BandRepository>(() =>
      BandRepositoryImpl(bandService: sl(), settingFirebaseService: sl()));

  sl.registerLazySingleton<GoalRepository>(
      () => GoalRepositoryImpl(goalDatabase: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postFirebaseService: sl()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        firebaseAuth: sl(),
        areaFirebaseService: sl(),
        areaService: sl(),
      ));

  sl.registerLazySingleton<PostDatabase>(() => PostDatabase());

  sl.registerLazySingleton<GoalDatabase>(() => GoalDatabase());

  sl.registerLazySingleton<AreaDatabase>(() => AreaDatabase());

  sl.registerLazySingleton<SettingDatabase>(() => SettingDatabase());

  sl.registerLazySingleton<AreaService>(() => AreaService());

  sl.registerLazySingleton<ProfessionService>(() => ProfessionService());

  sl.registerLazySingleton<BandService>(() => BandService());

  sl.registerLazySingleton<PostFirebaseService>(
      () => PostFirebaseService(firestore: sl()));

  sl.registerLazySingleton<AreaFirebaseService>(
      () => AreaFirebaseService(firestore: sl()));

  sl.registerLazySingleton<SettingFirebaseService>(
      () => SettingFirebaseService(firestore: sl()));

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Databases
  await initializeDatabase();
}

Future<void> initializeDatabase() async {
  const setting = 'Setting';

  await Hive.initFlutter();
  Hive.openBox<dynamic>(setting);
}
