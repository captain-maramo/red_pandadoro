import 'package:red_pandadoro/domain/failures/failures.dart';
import 'package:red_pandadoro/domain/repositories/theme_repository.dart';
import 'package:red_pandadoro/infrastructure/datasources/theme_local_datasource.dart';
import 'package:dartz/dartz.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource themeLocalDatasource;

  ThemeRepositoryImpl({required this.themeLocalDatasource});

  @override
  Future<Either<Failure, bool>> getThemeMode() async {
    try {
      final themeMode = await themeLocalDatasource.getCachedThemeData();
      return Right(themeMode);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> setThemeMode({required bool mode}) {
    return themeLocalDatasource.cacheThemeData(mode: mode);
  }

  @override
  Future<Either<Failure, bool>> getUseSystemTheme() async {
    try {
      final themeMode = await themeLocalDatasource.getUseSystemTheme();
      return Right(themeMode);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> setUseSystemTheme({required bool useSystemTheme}) {
    return themeLocalDatasource.cacheUseSystemTheme(
        useSystemTheme: useSystemTheme);
  }
}
