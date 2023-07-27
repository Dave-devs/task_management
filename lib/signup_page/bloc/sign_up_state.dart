part of 'sign_up_bloc.dart';

class SignUpState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpState({this.name= '', this.email = '', this.password = '', this.confirmPassword = ''});

  SignUpState copyWith({
    final String? name,
    final String? email,
    final String? password,
    final String? confirmPassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}


