import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/constants/routes.dart';
import 'package:flutter_ec_project/screens/home/home.dart';

class FirebaseAuthHelper{
  static FirebaseAuthHelper instance = FirebaseAuthHelper();

  final FirebaseAuth _auth=FirebaseAuth.instance;
  Stream<User?> get getAuthChange =>_auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      //성공했을 시 다이어로그 toast
      showLoaderDialog(context);
      _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseException catch(e) {
      showMessage(e.code.toString());
      return false;
    }
  }
}

