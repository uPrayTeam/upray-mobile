import 'package:dartz/dartz.dart';
import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/register_user_params.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/save_token_use_case.dart';

class RegisterUserUseCase extends UseCase<Success, RegisterUserParams> {
  RegisterUserUseCase({
    required this.authRepository,
    required this.saveTokenUseCase,
  });

  final AuthRepository authRepository;
  final SaveTokenUseCase saveTokenUseCase;

  @override
  FutureFailable<Success> call(RegisterUserParams params) async {
    final token = await authRepository.registerUser(params);

    return token.fold(
      (failure) => Left(failure),
      (data) => saveTokenUseCase(data),
    );
  }
}
