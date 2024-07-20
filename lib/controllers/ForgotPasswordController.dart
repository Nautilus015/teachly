import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

   passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar(
          'Error',
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.black,
          icon: Icon(Icons.warning,color: Colors.black,)
      );
    } catch (err) {
      Get.snackbar(
          'Error',
          err.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.black,
          icon: Icon(Icons.warning,color: Colors.black,)
      );
    }
    update();
  }
}
