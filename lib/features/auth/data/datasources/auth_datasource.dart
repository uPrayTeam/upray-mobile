// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/data/models/auth_token_model.dart';
import 'package:upray_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/register_user_params.dart';

abstract class AuthDatasource {
  Future<AuthToken> logIn(LogInParams params);

  Future<Success> logOut();

  Future<AuthToken> registerUser(RegisterUserParams params);
}

class AuthDatasourceImpl extends AuthDatasource {
  AuthDatasourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<AuthToken> logIn(LogInParams params) async {
    final response = await dio.post(
      '/auth/login',
      data: params.toMap(),
    );

    return AuthTokenModel.fromMap(response.data);
  }

  @override
  Future<Success> logOut() async {
    final response = await dio.post('/auth/logout');

    return const Success();
  }

  @override
  Future<AuthToken> registerUser(RegisterUserParams params) async {
    final response = await dio.post(
      '/auth/register',
      data: params.toMap(),
    );

    return AuthTokenModel.fromMap(response.data);
  }
}
