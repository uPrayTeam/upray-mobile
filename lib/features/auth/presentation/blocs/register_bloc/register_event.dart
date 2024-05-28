part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class AddAccountDataRegisterEvent extends RegisterEvent {
  final String email;
  final String password;

  const AddAccountDataRegisterEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AddPersonalDataRegisterEvent extends RegisterEvent {
  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;

  const AddPersonalDataRegisterEvent({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
  });

  @override
  List<Object?> get props => [firstName, lastName, dateOfBirth];
}

class AddUserAvatarRegisterEvent extends RegisterEvent {
  final MediaFile userAvatar;

  const AddUserAvatarRegisterEvent({
    required this.userAvatar,
  });

  @override
  List<Object?> get props => [userAvatar];
}

class RegisterUserEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}
