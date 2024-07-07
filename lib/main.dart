import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/onboarding/OnboardingScreen.dart';
import 'package:teachly/screens/splashScreen.dart';

void main(){
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    home: OnboardingScreen()
  ));
}
