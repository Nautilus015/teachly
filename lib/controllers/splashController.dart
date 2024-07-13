import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachly/screens/onboarding/OnboardingScreen.dart';

import '../screens/LoginScreen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initSplash();
  }

  Future<void> initSplash() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? firstTime = prefs.getBool('firstTime');
    await Future.delayed(Duration(seconds: 3),(){
      if(firstTime==false){
        Get.off(()=>LoginScreen());
      }
      else{
        Get.off(() => OnboardingScreen());
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
