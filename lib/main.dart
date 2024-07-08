import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/SignIn.dart';
import 'package:teachly/screens/SignupScreen.dart';
import 'package:teachly/screens/bottomnavScreen.dart';
import 'package:teachly/screens/onboarding/OnboardingScreen.dart';
import 'package:teachly/screens/splashScreen.dart';

void main(){
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    home: bottomnavScreen()
  ));
}
