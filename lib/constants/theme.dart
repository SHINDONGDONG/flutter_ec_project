import 'package:flutter/material.dart';

 ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.red,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.red,
      disabledForegroundColor: Colors.red,
      side: const BorderSide(color: Colors.red, width: 1.7,
      ),
      textStyle: const TextStyle(color: Colors.red),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      disabledBackgroundColor: Colors.grey,
      textStyle: const TextStyle(
        fontSize: 18.0,
      ),
    ),
  ),
   primarySwatch: Colors.red,
   canvasColor: Colors.red,
   appBarTheme: const AppBarTheme(
     elevation: 0.0,
     backgroundColor: Colors.white,
     iconTheme: IconThemeData(color: Colors.black),
     toolbarTextStyle: TextStyle(
       color: Colors.black
     ),
   )
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
  color: Colors.grey,
));