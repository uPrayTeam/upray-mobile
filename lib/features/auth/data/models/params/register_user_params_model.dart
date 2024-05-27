import 'package:upray_mobile/features/auth/domain/entities/params/register_user_params.dart';

class RegisterUserParamsModel extends RegisterUserParams {
  RegisterUserParamsModel({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  @override
  final String email;

  @override
  final String password;

  @override
  final String? firstName;

  @override
  final String? lastName;

  @override
  final DateTime? dateOfBirth;

  @override
  List<Object?> get props => [
        email,
        password,
        firstName,
        lastName,
        dateOfBirth,
      ];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
    };
  }

  RegisterUserParamsModel copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  }) {
    return RegisterUserParamsModel(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
