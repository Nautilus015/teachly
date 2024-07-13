import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/LoginScreen.dart';

class SignupController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController guardiansPhoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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
addUser()  async {
 await fireStore.collection('users').add({
    'firstName': firstName.text,
    'lastName':lastName.text,
    'phoneNumber':phoneNumber.text,
    'guardiansPhoneNumber':guardiansPhoneNumber.text,
    'city':selecetedCity,
    'grade':selecetedGrade,
    'email':email.text
  }).then((value)=>Get.off(() => LoginScreen()));
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
    if(validates.contains(true)){
      return;
    }
    else if(selecetedCity=='Select your City'){
      Get.showSnackbar(
              GetSnackBar(
                titleText: Text(
                  'Error!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                messageText: Text('Please choose your city',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                icon: const Icon(
                  Icons.dangerous,
                  color: Colors.white,
                ),
                duration: const Duration(seconds: 3),
              ),
            );
    }
    else if(selecetedGrade=='Select your Grade'){
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          messageText: Text('Please choose your grade',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
    else if(password.text!=confirmPassword.text){
      Get.showSnackbar(
        GetSnackBar(
          titleText: Text(
            'Error!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          messageText: Text('Password not match!',
              style: TextStyle(fontSize: 20, color: Colors.white)),
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
    else {
      try {
            await auth.createUserWithEmailAndPassword(
                email: email.text, password: password.text);
              addUser();
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              Get.showSnackbar(
                GetSnackBar(
                  titleText: Text(
                    'Error!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  messageText: Text('The password provided is too weak!',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  icon: const Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            } else if (e.code == 'email-already-in-use') {
              Get.showSnackbar(
                GetSnackBar(
                  titleText: Text(
                    'Error!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  messageText: Text('The account already exists for that email!',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  icon: const Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            } else {
              Get.showSnackbar(
                GetSnackBar(
                  titleText: Text(
                    'Error!',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  messageText: Text(e.message.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  icon: const Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          }
    }
  }
}
