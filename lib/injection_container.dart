import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/data/model/band/band_item_model.dart';
import 'package:stepper/data/datasources/local/band_database.dart';
import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/datasources/remote/area_service.dart';
import 'package:stepper/data/datasources/remote/band_service.dart';
import 'package:stepper/data/datasources/remote/profession_service.dart';
import 'package:stepper/data/repositories/profession_repository_impl.dart';
import 'package:stepper/domain/repositories/band_repository.dart';
import 'package:stepper/domain/repositories/profession_repository.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/data/repositories/fake_repos.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features
  sl.registerLazySingleton<AreaRepository>(() => FakeAreaRepositoryImpl(
        areaService: sl(),
        areaDatabase: sl(),
        postDatabase: sl(),
        bandDatabase: sl(),
      ));

  sl.registerLazySingleton<ProfessionRepository>(
      () => ProfessionRepositoryImpl(professionService: sl()));

  sl.registerLazySingleton<BandRepository>(
      () => BandRepositoryImpl(bandService: sl(), bandDatabase: sl()));

  sl.registerLazySingleton<GoalRepository>(
      () => FakeGoalRepositoryImpl(goalDatabase: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => FakePostRepositoryImpl(postDatabase: sl()));

  sl.registerLazySingleton<PostDatabase>(() => PostDatabase());

  sl.registerLazySingleton<GoalDatabase>(() => GoalDatabase());

  sl.registerLazySingleton<AreaDatabase>(() => AreaDatabase());

  sl.registerLazySingleton<BandDatabase>(() => BandDatabase());

  sl.registerLazySingleton<AreaService>(() => AreaService());

  sl.registerLazySingleton<ProfessionService>(() => ProfessionService());

  sl.registerLazySingleton<BandService>(() => BandService());

  // Databases
  await initializeDatabase();
}

Future<void> initializeDatabase() async {
  const storageAboutNumber = 'StorageAboutNumber';
  const post = 'Post';
  const goal = 'Goal';
  const bandItemModel = 'BandItemModel';
  const area = 'Area';

  await Hive.initFlutter();
  Hive.openBox(storageAboutNumber);
  Hive.openBox<Post>(post);
  Hive.openBox<Goal>(goal);
  Hive.openBox<BandItemModel>(bandItemModel);
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
