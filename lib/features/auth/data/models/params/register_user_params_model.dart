import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/register_user_params.dart';

class RegisterUserParamsModel extends RegisterUserParams {
  RegisterUserParamsModel({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.userAvatarFile,
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
  final MediaFile? userAvatarFile;

  @override
  List<Object?> get props => [
        email,
        password,
        firstName,
        lastName,
        dateOfBirth,
        userAvatarFile,
      ];

  RegisterUserParamsModel copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    MediaFile? userAvatarFile,
  }) {
    return RegisterUserParamsModel(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      userAvatarFile: userAvatarFile ?? this.userAvatarFile,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'userAvatarFile': userAvatarFile,
    };
  }

  factory RegisterUserParamsModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserParamsModel(
      email: map['email'] as String,
      password: map['password'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      dateOfBirth: map['dateOfBirth'] as DateTime,
      userAvatarFile: map['userAvatarFile'] as MediaFile,
    );
  }
}
