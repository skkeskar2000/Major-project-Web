import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginButtonEvent>((event, emit) => emit(
          LoginButtonState(userEntity: event.userEntity)
        ));
    on<LoginButtonFailureEvent>(
        (event, emit) => emit(FailureState(message: event.message)));
  }
}
