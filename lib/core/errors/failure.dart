import 'package:equatable/equatable.dart';
import 'package:upray_mobile/gen/strings.g.dart';

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
