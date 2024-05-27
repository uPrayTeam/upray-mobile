part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitialState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterPersonalSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterAccountSuccessState extends RegisterState {
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
