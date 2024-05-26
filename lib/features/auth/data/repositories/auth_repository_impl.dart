import 'package:dartz/dartz.dart';
import 'package:upray_mobile/core/errors/error_handle.dart';
import 'package:upray_mobile/core/errors/failure.dart';
import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/data/datasources/auth_datasource.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.authDatasource});

  final AuthDatasource authDatasource;

  @override
  FutureFailable<Success> logIn(LogInParams params) async {
    try {
      final result = await authDatasource.logIn(params);
      return Right(result);
    } catch (error) {
      return Left(handleError(error, LogInFailure()));
    }
  }
}
