import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';

class LogInUseCase extends UseCase<Success, LogInParams> {
  LogInUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  FutureFailable<Success> call(LogInParams params) {
    return authRepository.logIn(params);
  }
}
