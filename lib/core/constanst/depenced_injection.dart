import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constanst/api_service.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_application_1/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter_application_1/feature/auth/logic/authCubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt<Dio>()));

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<ApiService>()),
  );

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
}
