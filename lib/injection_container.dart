import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stepper/data/datasources/local/databases.dart';
import 'package:stepper/data/model/models.dart';
import 'package:stepper/domain/repositories/repositories.dart';
import 'package:stepper/data/repositories/fake_repos.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Features
  sl.registerLazySingleton<AreaRepository>(() => FakeAreaRepositoryImpl());

  sl.registerLazySingleton<GoalRepository>(
      () => FakeGoalRepositoryImpl(goalDatabase: sl()));

  sl.registerLazySingleton<PostRepository>(
      () => FakePostRepositoryImpl(postDatabase: sl()));

  // Database
  await Hive.initFlutter();
  Hive.openBox<Post>('Post');
  Hive.openBox<Goal>('Goal');
  Hive.registerAdapter<Post>(PostAdapter());
  Hive.registerAdapter<Goal>(GoalAdapter());

  sl.registerLazySingleton<PostDatabase>(() => PostDatabase());

  sl.registerLazySingleton<GoalDatabase>(() => GoalDatabase());
}
