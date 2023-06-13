import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/screens/auth_ui/login/login.dart';

class Routes {
  static Routes instance = Routes();

  Future<dynamic> pushAndRemoveUntil(Widget widget, BuildContext context){
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx)=> widget),(route)=> false);
  }

  Future<dynamic> push({required Widget widget, required BuildContext context}){
    return Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx)=> widget),
    );
  }
}