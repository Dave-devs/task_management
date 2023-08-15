import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management/common/utils/toast.dart';

class LogOutController{
  final BuildContext context;

  const LogOutController(this.context);

  Future<void> handleLogOut() async{
    try{
      await Future.wait([FirebaseAuth.instance.signOut()]);
      return showToast(message: 'Logged Out Successfully');
    } on FirebaseException catch(e){
      if (kDebugMode) {
        print('Failed with error code: ${e.code}');
      }
    }
  }
}