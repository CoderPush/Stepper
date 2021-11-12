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
  sl.registerLazySingleton<AreaRepository>(
      () => FakeAreaRepositoryImpl(areaService: sl()));

  sl.registerLazySingleton<ProfessionRepository>(
      () => ProfessionRepositoryImpl(professionService: sl()));

  sl.registerLazySingleton<BandRepository>(() => BandRepositoryImpl(
        bandService: sl(),
        bandDatabase: sl(),
      ));

  sl.registerLazySingleton<GoalRepository>(
      () => FakeGoalRepositoryImpl(goalDatabase: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => FakePostRepositoryImpl(postDatabase: sl()));

  // Database
  await Hive.initFlutter();
  Hive.openBox<Post>('Post');
  Hive.openBox<Goal>('Goal');
  Hive.openBox<BandItemModel>('BandItemModel');
  Hive.registerAdapter<Post>(PostAdapter());
  Hive.registerAdapter<Goal>(GoalAdapter());

  sl.registerLazySingleton<BandDatabase>(() => BandDatabase());

  sl.registerLazySingleton<PostDatabase>(() => PostDatabase());

  sl.registerLazySingleton<GoalDatabase>(() => GoalDatabase());

  sl.registerLazySingleton<AreaService>(() => AreaService());

  sl.registerLazySingleton<ProfessionService>(() => ProfessionService());

  sl.registerLazySingleton<BandService>(() => BandService());
}
