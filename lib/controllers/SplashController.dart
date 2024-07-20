import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachly/screens/BottomNavigationScreen.dart';
import 'package:teachly/screens/onboarding/OnboardingScreen.dart';
import '../screens/LoginScreen.dart';

class SplashController extends GetxController {
  final auth=FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    initSplash();
  }
  Future<void> initSplash() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? firstTime = prefs.getBool('firstTime');
    final user= auth.currentUser;
    await Future.delayed(Duration(seconds: 3),(){
      if(user!=null){
        Get.off(()=>BottomNavigationScreen());
      }
     else if(firstTime==false){
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
