import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teachly/screens/LoginScreen.dart';
import '../models/UserModel.dart';

class ProfileController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController guardiansPhoneNumberController =
      TextEditingController();
  String currentUserImage = '';
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String guardianPhoneNumber = '';
  String circleAvatarImage = '';
  bool isEditMode = false;
  bool isLoading = false;
  bool isClicked = false;
  File? imageFile;
  String networkImage = '';
  List<bool> validates = [false, false, false, false];
  String imageUrl = '';
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
  String userName = '';

  zeroState() {
    isLoading = false;
    isClicked = false;
  }

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  pickImage() async {
    final ImagePicker pick = ImagePicker();
    XFile? file =
        await pick.pickImage(source: ImageSource.gallery); // Pick an image.
    imageFile = File(file!.path);
    update();
  }

  uploadImage() async {
    if (imageFile == null) return;
    final fileName = imageFile!.path.split('/').last;
    final ref = storage.ref().child('uploads/$fileName');
    await ref.putFile(imageFile!).then((TaskSnapshot taskSnapshot) async {
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    }).catchError((e) {
      print(e);
    });
  }

  signOut() async {
    await auth.signOut();
      Get.snackbar(
        'Success',
        'You have been signed out successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(LoginScreen());
  }

  equalsControllers() {
    imageFile = null;
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    phoneNumberController.text = phoneNumber;
    guardiansPhoneNumberController.text = guardianPhoneNumber;
    update();
  }

  checkUser() async {
    validates[0] = firstName.isEmpty;
    validates[1] = lastName.isEmpty;
    validates[2] = phoneNumber.isEmpty;
    validates[3] = guardianPhoneNumber.isEmpty;
    update();
    if (validates.contains(true)) {
      zeroState();
      update();
      return;
    } else if (selecetedCity == 'Select your City') {
      zeroState();
      Get.snackbar(
          'Error!',
          'Please select your city',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.black,
          icon: Icon(Icons.warning,color: Colors.black,)
      );
    } else if (selecetedGrade == 'Select your Grade') {
      zeroState();
      Get.snackbar(
          'Error!',
          'Please select your grade',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.black,
          icon: Icon(Icons.warning,color: Colors.black,)
      );
    } else {
      var user = await fireStore
          .collection('users')
          .where('email', isEqualTo: auth.currentUser!.email)
          .get();
      if (user.docs.isNotEmpty) {
        if (imageFile == null) {
          imageUrl = circleAvatarImage;
        } else {
          await uploadImage();
        }
        var docId = user.docs.first.id;
        await fireStore.collection('users').doc(docId).update({
          'firstName': firstNameController.text.trim(),
          'lastName': lastNameController.text.trim(),
          'phoneNumber': phoneNumberController.text.trim(),
          'guardiansPhoneNumber': guardiansPhoneNumberController.text.trim(),
          'city': selecetedCity,
          'grade': selecetedGrade,
          'circleAvatarImage': imageUrl,
        }).then((value) {
          zeroState();
          getCurrentUser();
          isEditMode = false;
          update();
        });
      }
    }
  }

  getCurrentUser() async {
    var users = await fireStore
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get();
    var user = UserModel.fromJson(users.docs.first.data());
    circleAvatarImage = user.circleAvatarImage!;
    firstName = user.firstName!;
    lastName = user.lastName!;
    userName = '$firstName $lastName';
    phoneNumber = user.phoneNumber!;
    guardianPhoneNumber = user.guardiansPhoneNumber!;
    selecetedCity = user.city!;
    selecetedGrade = user.grade!;
    update();
  }
}
