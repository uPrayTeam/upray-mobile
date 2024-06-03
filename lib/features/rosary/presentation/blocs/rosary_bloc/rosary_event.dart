part of 'rosary_bloc.dart';

sealed class RosaryEvent extends Equatable {
  const RosaryEvent();
}

class NextPositionRosaryEvent extends RosaryEvent {
  @override
  List<Object> get props => [];
}
