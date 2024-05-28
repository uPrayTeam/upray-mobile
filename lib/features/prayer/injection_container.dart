import 'package:dio/dio.dart';
import 'package:upray_mobile/features/prayer/data/datasources/prayer_datasource.dart';
import 'package:upray_mobile/features/prayer/data/datasources/prayer_local_datasource.dart';
import 'package:upray_mobile/features/prayer/data/repositories/prayer_repository_impl.dart';
import 'package:upray_mobile/features/prayer/domain/repositories/prayer_repository.dart';
import 'package:upray_mobile/injection_container.dart';

mixin PrayerInjector on Injector {
  @override
  Future<void> init() async {
    await super.init();

    sl.registerLazySingleton<PrayerDatasource>(() => PrayerDatasourceImpl(dio: sl<Dio>(instanceName: globalDio)));

    sl.registerLazySingleton<PrayerLocalDatasource>(() => PrayerLocalDatasourceImpl());

    sl.registerLazySingleton<PrayerRepository>(
        () => PrayerRepositoryImpl(prayerDatasource: sl(), prayerLocalDatasource: sl()));
  }
}
