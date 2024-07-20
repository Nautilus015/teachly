import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/ProfileScreen.dart';
import 'package:teachly/screens/BottomNavigationScreen.dart';
import '../screens/BottomNavigationScreen.dart';

class LoginController extends GetxController {
  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();
  bool emailValidate = false;
  bool passValidate = false;
  bool light = false;
  bool isLoading = false;
  bool isClicked = false;
  final auth = FirebaseAuth.instance;
  zeroState (){
    isLoading = false;
    isClicked = false;
  }
  loginWithEmail() async {
    emailValidate = emailValue.text.isEmpty;
    passValidate=emailValue.text.isEmpty;
    update();
    if(emailValidate||passValidate){
      zeroState();
      update();
      return;
    }
    else {
      try {
        final user = await auth.signInWithEmailAndPassword(
            email: emailValue.text, password: passValue.text);
        if (user != null) {
          zeroState();
          Get.off(() => BottomNavigationScreen());
          Get.snackbar(
              'Success',
              'You have been Logged In successfully',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              icon: Icon(Icons.warning,color: Colors.white,)
          );
        }
      }
      on FirebaseAuthException catch (e) {
        zeroState();
        update();
        if (e.code == 'user-not-found') {
          Get.snackbar(
            'Error',
            'No user found for that email!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.black,
            icon: Icon(Icons.warning,color: Colors.black,)
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              'Error',
              'Wrong password provided for that user!',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.black,
              icon: Icon(Icons.warning,color: Colors.black,)
          );
        }
        else{
          Get.snackbar(
            'Error',
            'Wrong Email or Password!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.black,
            icon: Icon(Icons.warning,color: Colors.black,),
          );
        }
      }
    }
    update();
  }
}