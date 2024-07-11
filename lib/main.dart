import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';
import 'package:teachly/screens/SignupScreen.dart';
import 'package:teachly/screens/bottomnavScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDrGYF01YTxxmR4ohopJruyqVgIrTyDVe8",
          authDomain: "teachly-6d7d6.firebaseapp.com",
          projectId: "teachly-6d7d6",
          storageBucket: "teachly-6d7d6.appspot.com",
          messagingSenderId: "983455720395",
          appId: "1:983455720395:web:ff19425122cd4041784c4e",
          measurementId: "G-WFZZTEC8QX"
      ));
  runApp(GetMaterialApp(
      onInit: () {
        secureScreen();
      },
      debugShowCheckedModeBanner: false,
      home: SignupScreen()));
}
secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
