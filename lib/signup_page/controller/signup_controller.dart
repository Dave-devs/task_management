import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/common/utils/toast.dart';
import 'package:task_management/signup_page/bloc/sign_up_bloc.dart';

class SignUpController{
  final BuildContext context;

  const SignUpController({required this.context});

  Future<dynamic> handleSignUp() async {
    try{
      final state = context.read<SignUpBloc>().state;

      String nameAddress = state.name;
      String emailAddress = state.email;
      String passwordAddress = state.password;
      String confirmPassword = state.confirmPassword;

      if(nameAddress.isEmpty) {
        showToast(message: "Name field can't be empty");
        return;
      }
      if(emailAddress.isEmpty) {
        showToast(message: "Email field can't be empty");
        return;
      }
      if(passwordAddress.isEmpty) {
        showToast(message: "Password field can't be empty");
        return;
      }
      if(confirmPassword.isEmpty) {
        showToast(message: "Confirm password field can't be empty");
        return;
      }
      if(confirmPassword != passwordAddress) {
        showToast(message: 'Password does not match, check and try again.');
        return;
      }

      try{
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailAddress,
            password: passwordAddress
        );

        if(credential.user != null) {
          await credential.user?.sendEmailVerification();

          await credential.user?.updateDisplayName(nameAddress);

          String photoURL = "uploads/default.png";
          await credential.user?.updatePhotoURL(photoURL);
        }

        var user = credential.user;

        void getEmail(String? email) {
          email = user?.email;
        }
        void getPhoto(String? photo) {
          photo = user?.photoURL;
        }
        void getName(String? name) {
          name = user?.displayName;
        }

        showToast(message: 'Email Verification has been sent.');

      } on FirebaseAuthException catch(e) {
        showToast(message: e.message!);
      }

    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}