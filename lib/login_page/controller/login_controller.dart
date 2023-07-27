import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/common/utils/toast.dart';
import 'package:task_management/login_page/bloc/login_bloc.dart';

class LoginController{
  final BuildContext context;

  const LoginController({required this.context});

  Future<dynamic> handleLogin() async {
    final state = context.read<LoginBloc>().state;

    String emailAddress = state.email;
    String passwordAddress = state.password;

    try{
      if(emailAddress.isEmpty) {
        showToast(message: "Email field can't be empty");
        return;
      }

      if(passwordAddress.isEmpty) {
        showToast(message: "Password field can't be empty");
        return;
      }

      try{
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: passwordAddress
        );

        if(credential.user == null) {
          showToast(message: "User does not exist");
          return;
        }
        if(!credential.user!.emailVerified) {
          showToast(message: 'User is not verified');
          return;
        }
        if(credential.user!.emailVerified) {
          showToast(message: 'User has been verified');
          return;
        }

        var user = credential.user;

        if(user != null) {
          if (kDebugMode) {
            print('User has logged in successfully');
          }
        }

        getDisplayName(String? displayName) {
          displayName = user!.displayName;
        }
        getEmail(String? email) {
          email = user!.email;
        }
        getPhotoUrl(String? photoUrl) {
          photoUrl = user!.photoURL;
        }


      } on FirebaseAuthException catch(e) {
        if(e.code == 'user-not-found') {
          showToast(message: 'No user found for the email');
        } else if(e.code == 'wrong-password') {
          showToast(message: 'Wrong password provided, check and try again!');
        } else if(e.code == 'invalid-email') {
          showToast(message: 'Wrong email provided');
        }
      }

    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}