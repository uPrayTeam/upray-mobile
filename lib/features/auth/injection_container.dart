import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:upray_mobile/features/auth/data/datasources/auth_datasource.dart';
import 'package:upray_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:upray_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/log_out_use_case.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/register_user_use_case.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/save_token_use_case.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:upray_mobile/features/auth/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:upray_mobile/injection_container.dart';

const authStorage = 'authStorage';

mixin AuthInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage(), instanceName: authStorage);

    sl.registerLazySingleton<AuthDatasource>(() => AuthDatasourceImpl(dio: sl<Dio>(instanceName: globalDio)));

    sl.registerLazySingleton<AuthLocalDatasource>(
        () => AuthLocalDatasourceImpl(storage: sl<FlutterSecureStorage>(instanceName: authStorage)));

    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authDatasource: sl(), authLocalDatasource: sl()));

    sl.registerLazySingleton<SaveTokenUseCase>(() => SaveTokenUseCase(authRepository: sl()));
    sl.registerLazySingleton<LogOutUseCase>(() => LogOutUseCase(authRepository: sl()));
    sl.registerLazySingleton<LogInUseCase>(() => LogInUseCase(authRepository: sl(), saveTokenUseCase: sl()));
    sl.registerLazySingleton<RegisterUserUseCase>(
        () => RegisterUserUseCase(authRepository: sl(), saveTokenUseCase: sl()));

    sl.registerFactory<LoginBloc>(() => LoginBloc(
          logInUseCase: sl(),
          logOutUseCase: sl(),
        ));

    sl.registerFactory<RegisterBloc>(() => RegisterBloc(registerUserUseCase: sl()));
  }
}
