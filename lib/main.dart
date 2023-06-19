import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ec_project/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flutter_ec_project/firebase_helper/firebase_options/firebase_options.dart';
import 'package:flutter_ec_project/provider/app_provider.dart';
import 'package:flutter_ec_project/screens/auth_ui/welcome/welcome.dart';
import 'package:flutter_ec_project/screens/custom_bottom/custom_bottom_bar.dart';
import 'package:provider/provider.dart';

import 'constants/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        title: 'Youtube E Commerce',
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return const CustomButtomBar();
              }
              return const Welcome();
            }),
      ),
    );
  }
}
