import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';

class SaveTokenUseCase extends UseCase<Success, AuthToken> {
  SaveTokenUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  FutureFailable<Success> call(AuthToken params) {
    return authRepository.saveToken(params);
  }
}
