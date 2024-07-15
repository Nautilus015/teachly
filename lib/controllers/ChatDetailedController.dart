import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChatDetailedController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  TextEditingController message = TextEditingController();
  dynamic theDataFromPreviousPage = Get.arguments;
  String userName = '';

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() {
    userName = theDataFromPreviousPage;
  }

}
