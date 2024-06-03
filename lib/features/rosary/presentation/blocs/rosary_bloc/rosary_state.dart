part of 'rosary_bloc.dart';

sealed class RosaryState extends Equatable {
  const RosaryState({required this.currentPosition});

  final int currentPosition;

  @override
  List<Object> get props => [currentPosition];
}

final class RosaryProgressState extends RosaryState {
  @override
  List<Object> get props => [super.currentPosition];

  const RosaryProgressState({required super.currentPosition});
}

final class RosaryFinishedState extends RosaryState {
  @override
  List<Object> get props => [super.currentPosition];

  const RosaryFinishedState({required super.currentPosition});
}
