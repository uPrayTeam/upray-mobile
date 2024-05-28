import 'package:dartz/dartz.dart';
import 'package:upray_mobile/core/errors/error_handle.dart';
import 'package:upray_mobile/core/errors/failure.dart';
import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/data/datasources/auth_datasource.dart';
import 'package:upray_mobile/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:upray_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/register_user_params.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.authDatasource,
    required this.authLocalDatasource,
  });

  final AuthDatasource authDatasource;
  final AuthLocalDatasource authLocalDatasource;

  @override
  FutureFailable<AuthToken> logIn(LogInParams params) async {
    try {
      final result = await authDatasource.logIn(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, LogInFailure()));
    }
  }

  @override
  FutureFailable<AuthToken> registerUser(RegisterUserParams params) async {
    try {
      final result = await authDatasource.registerUser(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, RegisterUserFailure()));
    }
  }

  @override
  FutureFailable<Success> logOut() async {
    try {
      final localResult = await authLocalDatasource.logOut();
      authDatasource.logOut(); //not awaited, does not matter

      return Right(localResult);
    } catch (error) {
      return Left(handleError(error, LogOutFailure()));
    }
  }

  @override
  FutureFailable<Success> saveToken(AuthToken params) async {
    try {
      final localResult = await authLocalDatasource.logOut();
      return Right(localResult);
    } catch (error) {
      return Left(handleError(error, SaveTokenFailure()));
    }
  }
}
