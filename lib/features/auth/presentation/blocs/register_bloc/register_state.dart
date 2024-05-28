part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitialState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterPersonalDataSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterAccountDataSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterAvatarSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterErrorState extends RegisterState {
  final Failure failure;

  const RegisterErrorState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
