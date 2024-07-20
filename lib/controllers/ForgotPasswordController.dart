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
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text('Error',style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),),
          messageText: Text(e.message.toString(),style: TextStyle(
              fontSize: 20,
              color: Colors.white
          )),
          icon: const Icon(Icons.error,color: Colors.white,),
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (err) {
       Get.showSnackbar(
        GetSnackBar(
          titleText: Text('Error',style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),),
          messageText: Text(err.toString(),style: TextStyle(
              fontSize: 20,
              color: Colors.white
          )),
          icon: const Icon(Icons.email,color: Colors.white,),
          duration: const Duration(seconds: 3),
        ),
      );
    }

    update();
  }
}
