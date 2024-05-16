import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/gen/strings.g.dart';

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

class CardPaymentFailure extends Failure {
  @override
  String get errorMessage => t.failures.cardPaymentFailure;
}
