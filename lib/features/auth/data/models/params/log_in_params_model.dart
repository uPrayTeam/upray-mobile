import 'package:upray_mobile/features/auth/domain/entities%20/params/log_in_params.dart';

class LogInParamsModel extends LogInParams {
  LogInParamsModel({
    required this.password,
    required this.email,
  });

  @override
  final String password;
  @override
  final String email;

  @override
  List<Object> get props => [password, email];

  @override
  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'email': email,
    };
  }
}
