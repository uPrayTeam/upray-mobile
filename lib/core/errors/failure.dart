import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  String get errorMessage;

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() {
    return '${super.toString().replaceAll('Instance of', '')} $errorMessage';
  }
}

class LogInFailure extends Failure {
  @override
  String get errorMessage => throw UnimplementedError();
}

class LogOutFailure extends Failure {
  @override
  String get errorMessage => throw UnimplementedError();
}
