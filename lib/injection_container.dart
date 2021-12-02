import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/data/datasources/remote/services.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/area_service.dart';
import 'package:stepper/data/datasources/remote/band_service.dart';
import 'package:stepper/data/datasources/remote/profession_service.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/data/repositories/repositories_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features
  sl.registerLazySingleton<AreaRepository>(() => AreaRepositoryImpl(
        areaService: sl(),
        bandService: sl(),
        areaDatabase: sl(),
        settingDatabase: sl(),
        postDatabase: sl(),
      ));

  sl.registerLazySingleton<ProfessionRepository>(() =>
      ProfessionRepositoryImpl(professionService: sl(), settingDatabase: sl()));

  sl.registerLazySingleton<BandRepository>(
      () => BandRepositoryImpl(bandService: sl(), settingDatabase: sl()));

  sl.registerLazySingleton<GoalRepository>(
      () => GoalRepositoryImpl(goalDatabase: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(postDatabase: sl(), postService: sl()));

  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(firebaseAuth: sl()));

  sl.registerLazySingleton<PostDatabase>(() => PostDatabase());

  sl.registerLazySingleton<GoalDatabase>(() => GoalDatabase());

  sl.registerLazySingleton<AreaDatabase>(() => AreaDatabase());

  sl.registerLazySingleton<SettingDatabase>(() => SettingDatabase());

  sl.registerLazySingleton<AreaService>(() => AreaService());

  sl.registerLazySingleton<ProfessionService>(() => ProfessionService());

  sl.registerLazySingleton<BandService>(() => BandService());

  sl.registerLazySingleton<PostService>(() => PostService(firestore: sl()));

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Databases
  await initializeDatabase();
}

Future<void> initializeDatabase() async {
  const setting = 'Setting';
  const post = 'Post';
  const goal = 'Goal';
  const area = 'Area';

  await Hive.initFlutter();
  Hive.openBox<Post>(post);
  Hive.openBox<Goal>(goal);
  Hive.openBox<dynamic>(setting);
  Hive.registerAdapter<Post>(PostAdapter());
  Hive.registerAdapter<Goal>(GoalAdapter());
  Hive.registerAdapter<BandItemModel>(BandItemModelAdapter());
  Hive.registerAdapter<Area>(AreaAdapter());
  Hive.registerAdapter<AreaType>(AreaTypeAdapter());

  if (!await Hive.boxExists(area)) {
    prepopulateAreaDatabase();
  }
}

Future<void> prepopulateAreaDatabase() async {
  const area = 'Area';

  Hive.openBox<Area>(area);
  final areaList = await sl<AreaService>().getAllAreas();
  for (var area in areaList) {
    await sl<AreaDatabase>().addArea(area);
  }
}
