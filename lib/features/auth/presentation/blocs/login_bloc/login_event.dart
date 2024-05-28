part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LogInUserAuthEvent extends LoginEvent {
  const LogInUserAuthEvent({required this.params});

  final LogInParams params;

  @override
  List<Object> get props => [params];
}

class LogOutUserAuthEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
