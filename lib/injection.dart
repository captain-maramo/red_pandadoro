import 'package:red_pandadoro/application/theme/theme_service.dart';
import 'package:red_pandadoro/domain/repositories/theme_repository.dart';
import 'package:red_pandadoro/infrastructure/datasources/theme_local_datasource.dart';
import 'package:red_pandadoro/infrastructure/repositories/theme_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance; // sl = service Locator

Future<void> init() async {
  //! Application layer
  sl.registerLazySingleton<ThemeService>(
      () => ThemeServiceImpl(themeRepository: sl()));

  //! Usecases

  //! Repos
  sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(themeLocalDatasource: sl()));

  //! DataSources
  sl.registerLazySingleton<ThemeLocalDatasource>(
      () => ThemeLocalDatasourceImpl(sharedPreferences: sl()));

  //! extern
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
