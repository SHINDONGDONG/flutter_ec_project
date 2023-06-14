import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:720893622280:ios:3f511c2897b4eaae7cf9bd',
        apiKey: 'AIzaSyCRtDtrXjVVpK0Vxf1ELKuEHZLQJqw-WJE',
        projectId: 'fluttere-438ef',
        messagingSenderId: '720893622280',
        iosBundleId: 'com.example.flutterEcProject',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:720893622280:android:9e5a7ac69edfcd007cf9bd',
        apiKey: 'AIzaSyAnTf9XmGS9D9opimMpZ5uPLeKHxTv0Ts0',
        projectId: 'fluttere-438ef',
        messagingSenderId: '720893622280',
      );
    }
  }
}