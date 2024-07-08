import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/LoginScreen.dart';

class SignupController extends GetxController {
  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();
  TextEditingController confirmPassValue = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool emailValidate = false;
  bool passValidate = false;
  bool confirmPassValidate = false;

  signupWithEmailAndPassword() async {
    if (emailValue.text.isEmpty) {
      emailValidate = true;
      update();
    } else if (passValue.text.isEmpty) {
      passValidate = true;
      update();
    } else if (confirmPassValue.text.isEmpty) {
      confirmPassValidate = true;
      update();
    } else {
      try {
        await auth.createUserWithEmailAndPassword(
            email: emailValue.text, password: passValue.text);
        Get.off(() => LoginScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text('Try Again',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              messageText: Text('The password provided is too weak!',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              icon: const Icon(Icons.password,color: Colors.white,),
              duration: const Duration(seconds: 3),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text('Try Again',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              messageText: Text('The account already exists for that email!',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              icon: const Icon(Icons.email,color: Colors.white,),
              duration: const Duration(seconds: 3),
            ),
          );
        }
        else {
          Get.showSnackbar(
            GetSnackBar(
              titleText: Text('Try Again',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              messageText: Text('Try Another Email or Password!',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              )),
              icon: const Icon(Icons.email,color: Colors.white,),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
      emailValidate = false;
      passValidate = false;
      confirmPassValidate = false;
      update();
    }
  }
}
