import 'package:flutter/material.dart';
import 'package:flutter_ec_project/screens/auth_ui/welcome/welcome.dart';

import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: 'Youtube E Commerce',
      home: const Welcome(),
    );
  }
}
