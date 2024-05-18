part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

final class AuthLoggedOutState extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoggedInState extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthErrorState extends AuthState {
  const AuthErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object> get props => [failure];
}
