import 'package:dio/dio.dart';
import 'package:upray_mobile/features/auth/data/datasources/auth_datasource.dart';
import 'package:upray_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/log_out_use_case.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:upray_mobile/injection_container.dart';

mixin AuthInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    sl.registerLazySingleton<AuthDatasource>(
        () => AuthDatasourceImpl(dio: sl<Dio>(instanceName: globalDio)));

    sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authDatasource: sl()));

    sl.registerLazySingleton<LogInUseCase>(
        () => LogInUseCase(authRepository: sl()));
    sl.registerLazySingleton<LogOutUseCase>(
        () => LogOutUseCase(authRepository: sl()));

    sl.registerFactory<AuthBloc>(() => AuthBloc(
          logInUseCase: sl(),
          logOutUseCase: sl(),
        ));

    sl.registerFactory<RegisterBloc>(() => RegisterBloc());
  }
}
