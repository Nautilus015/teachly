import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA-Xjr-fhsIC9L9P-ejWW8Y2_hkemt-B5o",
          authDomain: "teachly-78da2.firebaseapp.com",
          projectId: "teachly-78da2",
          storageBucket: "teachly-78da2.appspot.com",
          messagingSenderId: "864379378912",
          appId: "1:864379378912:web:de879150145e98a02c0485",
          measurementId: "G-GP39Z4LW72"));
  runApp(GetMaterialApp(
      onInit: () {
        secureScreen();
      },
      debugShowCheckedModeBanner: false,
      home: LoginScreen()));
}
secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
