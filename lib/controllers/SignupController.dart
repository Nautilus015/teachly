import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/LoginScreen.dart';

class SignupController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController guardiansPhoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;
  bool isClicked = false;
  final auth = FirebaseAuth.instance;
  final fireStore=FirebaseFirestore.instance;
  List<bool> validates = [
    false,false,false,false,false,false,false
  ];
  Color selectColor = Colors.grey;
  Color selectColorTwo = Colors.grey;
  List<String> citiesList = [
    'Select your City',
    'Cairo',
    'Alexandria',
    'Giza',
    'Shubra El Kheima', // Capital of Qalyubia Governorate
    'Port Said',
    'Suez',
    'Luxor',
    'Aswan',
    'Mansoura', // Capital of Dakahlia Governorate
    'Tanta', // Capital of Gharbia Governorate
    'Asyut',
    'Ismailia',
    'Faiyum',
    'Zagazig', // Capital of Sharqia Governorate
    'Damietta',
    'Beni Suef',
    'Minya',
    'Damanhur', // Capital of Beheira Governorate
    'Banha', // Capital of Qalyubia Governorate
    'Sohag',
    'Hurghada', // Major city in Red Sea Governorate
    'Shibin El Kom', // Capital of Monufia Governorate
    'Qena',
    'Kafr El Sheikh',
    'Arish', // Capital of North Sinai Governorate
    'Marsa Matruh', // Capital of Matrouh Governorate
    'El Tor', // Capital of South Sinai Governorate
  ];
  List<String> grades = [
    'Select your Grade',
    'First Grade',
    'Second Grade',
    'Third Grade'
  ];
  String selecetedCity = 'Select your City';
  String selecetedGrade = 'Select your Grade';
  zeroState (){
    isLoading = false;
    isClicked = false;
  }
addUser()  async {
 await fireStore.collection('users').add({
    'uid': auth.currentUser?.uid,
    'firstName': firstName.text.trim(),
    'lastName':lastName.text.trim(),
    'phoneNumber':phoneNumber.text.trim(),
    'guardiansPhoneNumber':guardiansPhoneNumber.text.trim(),
    'city':selecetedCity,
    'grade':selecetedGrade,
    'email':email.text.trim(),
   'lastMessage':'No messages',
   'circleAvatarImage':''
  }).then((value) {
    Get.off(() => LoginScreen());
  });
}
  signupWithEmailAndPassword() async {
    validates[0] = firstName.text.isEmpty;
    validates[1] = lastName.text.isEmpty;
    validates[2] = phoneNumber.text.isEmpty;
    validates[3] = guardiansPhoneNumber.text.isEmpty;
    validates[4] = email.text.isEmpty;
    validates[5] = password.text.isEmpty;
    validates[6] = confirmPassword.text.isEmpty;
    update();
    Get.snackbar(
        'Success',
        'You have been Signed Up successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: Icon(Icons.warning,color: Colors.white,)
    );
    if(validates.contains(true)){
      zeroState();
      update();
      return;
    }
    else if(selecetedCity=='Select your City'){
      zeroState();
      Get.snackbar(
        'Error!',
        'Please select your city',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.black,
        icon: Icon(Icons.warning,color: Colors.black,)
      );
    }
    else if(selecetedGrade=='Select your Grade'){
      zeroState();
      Get.snackbar(
          'Error!',
          'Please select your grade',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.black,
          icon: Icon(Icons.warning,color: Colors.black,)
      );
    }
    else if(password.text!=confirmPassword.text){
      zeroState();
      Get.snackbar(
          'Error!',
          'Password not match !',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.black,
          icon: Icon(Icons.warning,color: Colors.black,)
      );
    }
    else {
      try {
            await auth.createUserWithEmailAndPassword(
                email: email.text, password: password.text);
              addUser();
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              zeroState();
              Get.snackbar(
                  'Error!',
                  'The password provided is too weak !',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.black,
                  icon: Icon(Icons.warning,color: Colors.black,)
              );
            } else if (e.code == 'email-already-in-use') {
              zeroState();
              Get.snackbar(
                  'Error!',
                  'The account already exists for that email !',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.black,
                  icon: Icon(Icons.warning,color: Colors.black,)
              );
            } else {
              zeroState();
              Get.snackbar(
                  'Error!',
                  e.message.toString(),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.black,
                  icon: Icon(Icons.warning,color: Colors.black,)
              );
            }
          }
    }
    update();
  }
}
