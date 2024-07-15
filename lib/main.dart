import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';
import 'package:teachly/screens/bottomnavScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA8jQHabfNZrQImDE_7XmQv8tgOcP3NVjM",
          authDomain: "teachly-5b61a.firebaseapp.com",
          projectId: "teachly-5b61a",
          storageBucket: "teachly-5b61a.appspot.com",
          messagingSenderId: "822507074043",
          appId: "1:822507074043:web:dff0332b3cb145d83a9b5e",
          measurementId: "G-R3YGW2LX9V"
      ));
  await FirebaseAppCheck.instance
      .activate(
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.appAttest,
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  );
  runApp(GetMaterialApp(
      onInit: () {
        secureScreen();
      },
      debugShowCheckedModeBanner: false,

      home: bottomnavScreen(),
  )
  );
}
secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
