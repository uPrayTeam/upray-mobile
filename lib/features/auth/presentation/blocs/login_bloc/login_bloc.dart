import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upray_mobile/core/errors/failure.dart';
import 'package:upray_mobile/features/auth/domain/entities/params/log_in_params.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/log_out_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.logInUseCase, required this.logOutUseCase}) : super(LoginLoggedOutState()) {
    on<LogInUserAuthEvent>(_onLogIn);
    on<LogOutUserAuthEvent>(_onLogOut);
  }

  final LogInUseCase logInUseCase;
  final LogOutUseCase logOutUseCase;

  void _onLogIn(LogInUserAuthEvent event, Emitter emit) async {
    final result = await logInUseCase(event.params);

    result.fold(
      (failure) => emit(LoginErrorState(failure: failure)),
      (data) => emit(LoginLoggedInState()),
    );
  }

  void _onLogOut(LogOutUserAuthEvent event, Emitter emit) async {}
}