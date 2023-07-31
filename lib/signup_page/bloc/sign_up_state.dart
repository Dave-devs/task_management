part of 'sign_up_bloc.dart';

class SignUpState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool passwordVisibility;
  final bool confirmPassVisibility;

  const SignUpState({
    this.name= '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.passwordVisibility = false,
    this.confirmPassVisibility = false,
  });

  SignUpState copyWith({
    final String? name,
    final String? email,
    final String? password,
    final String? confirmPassword,
    final bool? passwordVisibility,
    final bool? confirmPassVisibility,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      confirmPassVisibility: confirmPassVisibility ?? this.confirmPassVisibility,
    );
  }
}


