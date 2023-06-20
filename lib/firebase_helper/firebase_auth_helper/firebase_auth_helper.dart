import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/constants/constants.dart';
import 'package:flutter_ec_project/models/user_model/user_model.dart';

class FirebaseAuthHelper{
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Stream<User?> get getAuthChange =>_auth.authStateChanges();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



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
     String name, String email, String password, BuildContext context) async {
    try{
      showLoaderDialog(context);
      UserCredential? userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(id: userCredential.user!.uid, name: name, email: email,image: null);

      //user를만들고 firestore에도 users 테이블에 userModel .id의  doc을 만들고 usermodel을 tojson으로 저장시켜준다.
      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
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

  void singOut() async {
    await _auth.signOut();
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
