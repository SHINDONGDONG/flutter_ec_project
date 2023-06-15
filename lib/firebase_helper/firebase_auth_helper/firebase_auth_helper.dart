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

  Future<bool> login(String email, String password,
      BuildContext context) async {
    try {
      //성공했을 시 다이어로그 toast
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      return true;
    }on FirebaseException catch(e) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(e.code.toString());
      return false;
    }
  }
  Future<bool> signUp(
      String email, String password, BuildContext context) async {
    try{
      showLoaderDialog(context);
      UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    }on FirebaseException catch(e) {
      //현재 화면에서 뒤로가기 버튼을 누를 때
      // 다이얼로그나 모달 창을 닫을 때
      // 특정 조건이 충족되었을 때 이전 화면으로 돌아가기 등
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(e.code.toString());
      return false;
    }
  }
}




/*
// ignore_for_file: use_build_context_synchronously

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(String email, String password,
      BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }
}*/
