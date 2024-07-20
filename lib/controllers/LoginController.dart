import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/ProfileScreen.dart';
import 'package:teachly/screens/bottomnavScreen.dart';
import '../screens/bottomnavScreen.dart';

class LoginController extends GetxController {
  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();
  bool emailValidate = false;
  bool passValidate = false;
  bool light = false;
  final auth = FirebaseAuth.instance;
  
  loginWithEmail() async {
    emailValidate = emailValue.text.isEmpty;
    passValidate=emailValue.text.isEmpty;
    update();
    if(emailValidate||passValidate){
      return;
    }
    else {
      try {
        final user = await auth.signInWithEmailAndPassword(
            email: emailValue.text, password: passValue.text);
        if (user != null) {
          Get.off(() => bottomnavScreen());
        }
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            'Error',
            'No user found for that email!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: Icon(Icons.warning,color: Colors.white,)
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              'Error',
              'Wrong password provided for that user!',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              icon: Icon(Icons.warning,color: Colors.white,)
          );
        }
        else{
          Get.snackbar(
            'Error',
            'Wrong Email or Password!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: Icon(Icons.warning,color: Colors.white,),
          );
        }
      }
    }
  }
}