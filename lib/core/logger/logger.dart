import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upray_mobile/core/app_config.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class Logger extends Talker {
  final AppConfig config;
  final Dio dio;

  Logger({required this.config, required this.dio});

  void init() {
    if (!config.silenceLogs) {
      logConfig(config: config, talker: this);
      dio.interceptors.add(
        TalkerDioLogger(
          talker: this,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
          ),
        ),
      );

      Bloc.observer = TalkerBlocObserver(talker: this);
    }
  }

  void logConfig({required AppConfig config, required Talker talker}) {
    talker.debug('Selected flavor - ${config.flavor.name}');
    talker.debug('API Server URL - ${config.api.isNotEmpty ? config.api : 'NONE'}');
  }
}
