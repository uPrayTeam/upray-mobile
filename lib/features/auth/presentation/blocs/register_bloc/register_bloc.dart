import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upray_mobile/core/errors/failure.dart';
import 'package:upray_mobile/core/utils/media_picker/media_file.dart';
import 'package:upray_mobile/features/auth/data/models/params/register_user_params_model.dart';
import 'package:upray_mobile/features/auth/domain/use_cases/register_user_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.registerUserUseCase}) : super(RegisterInitialState()) {
    on<AddPersonalDataRegisterEvent>(_onPersonalData);
    on<AddAccountDataRegisterEvent>(_onAccountData);
    on<AddUserAvatarRegisterEvent>(_onAddAvatar);
    on<RegisterUserEvent>(_onRegisterUser);
  }

  final RegisterUserUseCase registerUserUseCase;

  RegisterUserParamsModel _registerUserParams = RegisterUserParamsModel(email: '', password: '');

  _onPersonalData(AddPersonalDataRegisterEvent event, Emitter emit) async {
    _registerUserParams = _registerUserParams.copyWith(
      firstName: event.firstName,
      lastName: event.lastName,
      dateOfBirth: event.dateOfBirth,
    );

    emit(RegisterPersonalDataSuccessState());
  }

  _onAccountData(AddAccountDataRegisterEvent event, Emitter emit) async {
    _registerUserParams = _registerUserParams.copyWith(
      email: event.email,
      password: event.password,
    );

    emit(RegisterAccountDataSuccessState());
  }

  _onAddAvatar(AddUserAvatarRegisterEvent event, Emitter emit) async {
    _registerUserParams = _registerUserParams.copyWith(userAvatarFile: event.userAvatar);

    emit(RegisterAvatarSuccessState());
  }

  _onRegisterUser(RegisterUserEvent event, Emitter emit) async {
    final result = await registerUserUseCase(_registerUserParams);

    emit(
      result.fold(
        (failure) => RegisterErrorState(failure: failure),
        (data) => RegisterSuccessState(),
      ),
    );
  }
}
