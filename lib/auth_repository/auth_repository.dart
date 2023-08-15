import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepository{
  final FirebaseAuth firebaseAuth;

  const AuthRepository({required this.firebaseAuth});


  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try{
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.runtimeType);
      }
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try{
      await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.runtimeType);
      }
    }
  }

  Future<void> logOutUser() async {
    try{
      await Future.wait([firebaseAuth.signOut()]);
    } catch (e) {
      if (kDebugMode) {
        print(e.runtimeType);
      }
    }
  }
}