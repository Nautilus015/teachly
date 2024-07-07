import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../screens/SignIn.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
   initSplash();
  }
Future<void> initSplash() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
 await Future.delayed(Duration(seconds: 3));
  Get.off(()=>SignIn());
}
  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }

}
