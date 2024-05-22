import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/repositories/auth_repository.dart';

class LogOutUseCase extends UseCase<Success, NoParams> {
  LogOutUseCase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  FutureFailable<Success> call(NoParams params) {
    throw Exception();
  }
}
