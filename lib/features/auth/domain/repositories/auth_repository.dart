import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities/auth_token.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/register_user_params.dart';

abstract class AuthRepository {
  FutureFailable<AuthToken> logIn(LogInParams params);

  FutureFailable<Success> logOut();

  FutureFailable<AuthToken> registerUser(RegisterUserParams params);

  FutureFailable<Success> saveToken(AuthToken params);
}
