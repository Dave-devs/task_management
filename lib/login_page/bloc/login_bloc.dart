import 'dart:async';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {

    on<LoginEmailEvent>(loginEmailEvent);
    on<LoginPasswordEvent>(loginPasswordEvent);
    on<OnTogglePasswordVisibilityEvent>(onTogglePasswordVisibilityEvent);
  }

  FutureOr<void> loginEmailEvent(LoginEmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> loginPasswordEvent(LoginPasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> onTogglePasswordVisibilityEvent(OnTogglePasswordVisibilityEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(passwordVisibility: event.passwordVisibility));
  }
}
