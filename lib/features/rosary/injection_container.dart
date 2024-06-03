import 'package:dio/dio.dart';
import 'package:upray_mobile/features/rosary/data/datasources/rosary_datasource.dart';
import 'package:upray_mobile/features/rosary/data/datasources/rosary_local_datasource.dart';
import 'package:upray_mobile/features/rosary/data/repositories/rosary_repository_impl.dart';
import 'package:upray_mobile/features/rosary/domain/repositories/rosary_repository.dart';
import 'package:upray_mobile/features/rosary/presentation/blocs/rosary_bloc/rosary_bloc.dart';
import 'package:upray_mobile/injection_container.dart';

mixin RosaryInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    sl.registerLazySingleton<RosaryDatasource>(() => RosaryDatasourceImpl(dio: sl<Dio>(instanceName: globalDio)));

    sl.registerLazySingleton<RosaryLocalDatasource>(() => RosaryLocalDatasourceImpl());

    sl.registerLazySingleton<RosaryRepository>(
        () => RosaryRepositoryImpl(rosaryDatasource: sl(), rosaryLocalDatasource: sl()));

    sl.registerFactory<RosaryBloc>(() => RosaryBloc());
  }
}
