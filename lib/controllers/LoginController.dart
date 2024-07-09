import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/ProfileScreen.dart';

class LoginController extends GetxController {
  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();
  bool emailValidate = false;
  bool passValidate = false;
  bool light = false;
  final auth = FirebaseAuth.instance;

  loginWithEmail() async {
    if (emailValue.text.isEmpty) {
      emailValidate = true;
      update();
    }
    else if (passValue.text.isEmpty) {
      passValidate=true;
      update();
    }
    else {
      try {
        final user = await auth.signInWithEmailAndPassword(
            email: emailValue.text, password: passValue.text);
        if (user != null) {
          Get.off(() => ProfileScreen());
        }
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text('Try Again',style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
              messageText: Text('No user found for that email!',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              icon: const Icon(Icons.email,color: Colors.white,),
              duration: const Duration(seconds: 3),
            ),
          );
        } else if (e.code == 'wrong-password') {
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text('Try Again',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              messageText: Text('Wrong password provided for that user!',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              icon: const Icon(Icons.password,color: Colors.white,),
              duration: const Duration(seconds: 3),
            ),
          );
        }
        else{
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text('Try Again',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              messageText: Text('Wrong Email or Password!',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              icon: const Icon(Icons.error,color: Colors.white,),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
      emailValidate=false;
      passValidate=false;
      update();
    }
  }
}