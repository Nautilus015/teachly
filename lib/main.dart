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
          ));
  runApp(GetMaterialApp(
      onInit: () {
        secureScreen();
      },
      debugShowCheckedModeBanner: false,
      home: bottomnavScreen()));
}
secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}
