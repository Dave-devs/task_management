import 'dart:async';
import 'package:bloc/bloc.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<NameEvent>(nameEvent);
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
    on<ConfirmPasswordEvent>(confirmPasswordEvent);
    on<PasswordVisibilityEvent>(passwordVisibilityEvent);
    on<ConfirmVisibilityEvent>(confirmVisibilityEvent);
  }

  FutureOr<void> nameEvent(NameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> emailEvent(EmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> passwordEvent(PasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  FutureOr<void> passwordVisibilityEvent(PasswordVisibilityEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(passwordVisibility: event.toggleVisibility));
  }

  FutureOr<void> confirmVisibilityEvent(ConfirmVisibilityEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassVisibility: event.toggleConfirmVisibility));
  }
}
