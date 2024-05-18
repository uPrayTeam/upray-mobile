part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LogInUserAuthEvent extends AuthEvent {
  const LogInUserAuthEvent({required this.params});

  final LogInParams params;

  @override
  List<Object> get props => [params];
}

class LogOutUserAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
