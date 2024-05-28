part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

final class LoginLoggedOutState extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoggedInState extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginErrorState extends LoginState {
  const LoginErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object> get props => [failure];
}
