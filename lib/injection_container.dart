import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/area_service.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/data/repositories/fake_repos.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features
  sl.registerLazySingleton<AreaRepository>(
      () => FakeAreaRepositoryImpl(areaService: sl(), areaDatabase: sl()));

  sl.registerLazySingleton<GoalRepository>(
      () => FakeGoalRepositoryImpl(goalDatabase: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => FakePostRepositoryImpl(postDatabase: sl()));

  sl.registerLazySingleton<PostDatabase>(() => PostDatabase());

  sl.registerLazySingleton<GoalDatabase>(() => GoalDatabase());

  sl.registerLazySingleton<AreaDatabase>(() => AreaDatabase());

  sl.registerLazySingleton<AreaService>(() => AreaService());

  // Databases
  await initializeDatabase();
}

Future<void> initializeDatabase() async {
  await Hive.initFlutter();
  Hive.openBox<Post>('Post');
  Hive.openBox<Goal>('Goal');
  Hive.registerAdapter<Post>(PostAdapter());
  Hive.registerAdapter<Goal>(GoalAdapter());
  Hive.registerAdapter<Area>(AreaAdapter());
  Hive.registerAdapter<AreaType>(AreaTypeAdapter());

  if (!await Hive.boxExists('Area')) {
    prepopulateAreaDatabase();
  }
}

Future<void> prepopulateAreaDatabase() async {
  Hive.openBox<Area>('Area');
  final areaList = await sl<AreaService>().getAllAreas();
  for (var area in areaList) {
    await sl<AreaDatabase>().addArea(area);
  }
}
