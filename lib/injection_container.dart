import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upray_mobile/core/app_config.dart';
import 'package:upray_mobile/core/logger/logger.dart';
import 'package:upray_mobile/core/presentation/blocs/media_picker_bloc/media_picker_bloc.dart';
import 'package:upray_mobile/core/router/router.dart';
import 'package:upray_mobile/core/utils/media_picker/media_picker.dart';
import 'package:upray_mobile/features/auth/injection_container.dart';
import 'package:upray_mobile/features/rosary/injection_container.dart';

final sl = GetIt.instance;

const globalDio = 'global';

class InjectionContainer extends Injector with AuthInjector, RosaryInjector {}

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    sl.registerLazySingleton<AppConfig>(() => AppConfig.init);
    sl.registerLazySingleton<AppRouter>(() => AppRouter());

    sl.registerLazySingleton<Dio>(
      () {
        final dio = Dio(
          BaseOptions(
            baseUrl: sl<AppConfig>().api,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
          ),
        );

        dio.options.headers = {
          "content-type": "application/json",
          "Accept": "application/json",
        };

        return dio;
      },
      instanceName: globalDio,
    );

    sl.registerSingletonAsync<Logger>(() async {
      final logger = Logger(
        config: sl<AppConfig>(),
        dio: sl<Dio>(instanceName: globalDio),
      )..init();

      return logger;
    });

    sl.registerFactory<ImagePicker>(() => ImagePicker());
    sl.registerFactory<ImageCropper>(() => ImageCropper());
    sl.registerFactory<MediaPicker>(
      () => MediaPicker(
        imagePicker: sl(),
        imageCropper: sl(),
      ),
    );

    sl.registerFactory<MediaPickerBloc>(() => MediaPickerBloc(mediaPicker: sl()));
  }
}
