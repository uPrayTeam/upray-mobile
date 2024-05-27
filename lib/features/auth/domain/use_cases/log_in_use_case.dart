import 'package:dartz/dartz.dart';
import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/save_token_use_case.dart';

class LogInUseCase extends UseCase<Success, LogInParams> {
  LogInUseCase({required this.saveTokenUseCase, required this.authRepository});

  final AuthRepository authRepository;
  final SaveTokenUseCase saveTokenUseCase;

  @override
  FutureFailable<Success> call(LogInParams params) async {
    final token = await authRepository.logIn(params);

    return token.fold(
      (failure) => Left(failure),
      (data) => saveTokenUseCase(data),
    );
  }
}
