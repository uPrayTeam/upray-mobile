// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities%20/params/log_in_params.dart';

abstract class AuthDatasource {
  Future<Success> logIn(LogInParams params);

  Future<Success> logOut();
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

  @override
  Future<Success> logOut() async {
    final result = await dio.get(
      '/auth/logout',
    );

    return const Success();
  }
}
