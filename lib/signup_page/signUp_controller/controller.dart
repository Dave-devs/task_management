import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/utils/toast.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpController {
  final BuildContext context;

  const SignUpController({required this.context});

  Future<void> handleSignUpState() async {
    try{
        final state = context.read<SignUpBloc>().state;

        String userNameAddress = state.userName;
        String emailAddress = state.email;
        String passwordAddress = state.password;
        String confirmPasswordAddress = state.confirmPassword;

        if(userNameAddress.isEmpty) {
          showToast(message: "Username can't be empty");
        } else if(emailAddress.isEmpty) {
          showToast(message: "Email can't be empty");
        } else if(passwordAddress.isEmpty) {
          showToast(message: "Password can't be empty");
        } else if(confirmPasswordAddress.isEmpty) {
          showToast(message: "Confirm password can't be empty");
        } else if(confirmPasswordAddress != passwordAddress) {
          showToast(message: "Password does not match, check and try again!");
        } else {
          return;
        }

        try{
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailAddress,
              password: passwordAddress
          );

          if(credential.user != null) {
            await credential.user?.sendEmailVerification();
            await credential.user?.updateDisplayName(userNameAddress);
            String photoURL = "uploads/default.png";
            await credential.user?.updatePhotoURL(photoURL);

            showToast(message: "Confirmation mail has been sent to your email.");

            Navigator.of(context).pop();
          }


        } on FirebaseAuthException catch(e) {
          if(e.code == 'email-already-in-use') {
            showToast(message: 'User already exist');
          } else if(e.code == 'invalid-email') {
            showToast(message: 'Invalid email supply');
          } else if(e.code == 'weak-password') {
            showToast(message: 'Password is too weak');
          }
        }
    } catch(e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}