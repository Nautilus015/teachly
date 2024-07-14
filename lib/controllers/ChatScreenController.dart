import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/UserModel.dart';

class ChatScreenController extends GetxController{
  final auth=FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentImage();
  }

  getCurrentImage() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get();
    var user =UserModel.fromJson(users.docs.first.data());
    if(user.circleAvatarImage!=null){

    }

  }
}