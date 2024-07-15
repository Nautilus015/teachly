import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'ChatDetailedController.dart';

class ChatDetailedController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  final messageText = TextEditingController();
  TextEditingController message = TextEditingController();
  final auth = FirebaseAuth.instance;
  late User signedinUser;
  dynamic theDataFromPreviousPage = Get.arguments;
  String userName = '';
  String receiverEmail = '';
  DateTime now = DateTime.now();
  String dayTime = '';

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  addMessage() async {
    int minute = now.minute;
    int hour = now.hour;
    if (hour > 11 && hour < 25) {
      dayTime = 'PM';
    } else {
      dayTime = 'AM';
    }
    await fireStore.collection('messages').add({
      'emailSender': auth.currentUser!.email,
      'emailReceiver': receiverEmail,
      'date': '$hour:$minute $dayTime',
      'message': messageText.text.trim()
    });
  }

  void getCurrentUser() {
    userName = theDataFromPreviousPage[0];
    receiverEmail = theDataFromPreviousPage[1];
    print(receiverEmail);
  }
}
