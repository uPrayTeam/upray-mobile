// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';

abstract class AuthDatasource {
  Future<Success> logIn(LogInParams params);
}

class AuthDatasourceImpl extends AuthDatasource {
  AuthDatasourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<Success> logIn(LogInParams params) async {
    final result = await dio.post(
      '/auth/login',
      data: params.toMap(),
    );

    return const Success();
  }
}
