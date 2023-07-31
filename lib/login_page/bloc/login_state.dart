part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool passwordVisibility;

  const LoginState({this.email = '', this.password = '',this.passwordVisibility = false});

  LoginState copyWith({
    final String? email,
    final String? password,
    final bool? passwordVisibility,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
    );
  }
}


