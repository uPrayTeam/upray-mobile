import 'package:upray_mobile/core/utils/type_aliases.dart';
import 'package:upray_mobile/core/utils/usecase.dart';
import 'package:upray_mobile/features/auth/domain/entities%20/params/log_in_params.dart';

abstract class AuthRepository {
  FutureFailable<Success> logIn(LogInParams params);

  FutureFailable<Success> logOut();
}
