import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upray_mobile/core/utils/constants.dart';

part 'rosary_event.dart';
part 'rosary_state.dart';

class RosaryBloc extends Bloc<RosaryEvent, RosaryState> {
  RosaryBloc() : super(const RosaryProgressState(currentPosition: 0)) {
    on<NextPositionRosaryEvent>(_onNextPosition);
  }

  int _currentPosition = 0;

  void _onNextPosition(NextPositionRosaryEvent event, Emitter emit) async {
    _currentPosition++;

    if (_currentPosition < Constants.rosaryLength) {
      emit(RosaryProgressState(currentPosition: _currentPosition));
    } else {
      emit(RosaryFinishedState(currentPosition: _currentPosition));
    }
  }
}
