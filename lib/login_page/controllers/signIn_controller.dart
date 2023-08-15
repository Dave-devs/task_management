import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/utils/toast.dart';
import '../bloc/sign_in_bloc.dart';

class SignInController{

  final BuildContext context;

  const SignInController({ required this.context});

  Future<void> handleSignIn() async {

    try{
        final state = context.read<SignInBloc>().state;

        String emailAddress = state.email;
        String passwordInput = state.password;

        if (emailAddress.isEmpty ||  passwordInput.isEmpty) {
          showToast(message: 'Email or password is empty!');
        } else {
          showToast(message: 'Email is $emailAddress');
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailAddress,
              password: passwordInput
          );

          if (credential.user == null) {
            showToast(message: 'User does not exist');
            return;
          } else if (!credential.user!.emailVerified) {
            showToast(message: 'User is not verified');
            return;
          } else if (credential.user!.emailVerified) {
            showToast(message: 'Verified user');
            return;
          }

          //User credential from Firebase assign to user variable
          var user = credential.user;

          Future<dynamic> getUser({String? id, String? displayName, String? email, String? photoURL}) async {
            if(credential.user != null) {
              user?.uid == id;
              user?.email == email;
              user?.displayName == displayName;
              user?.photoURL == photoURL;
            }
          }

          //Check if user gotten successfully OR not
          if (user != null) {
            if (kDebugMode) {
              print('User exist');
            }

          } else {
            showToast(message: 'No user');
            return;
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