import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../models/UserModel.dart';


class NotificationController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  TextEditingController messageText = TextEditingController();
  TextEditingController message = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isTeacher = false;
  late User signedinUser;
  DateTime now = DateTime.now();
  String dayTime = '';
  RxList<String> dates = <String>[].obs;

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
      'uid': auth.currentUser?.uid,
      'emailSender': auth.currentUser!.email,
      'date': '$hour:$minute $dayTime',
      'message': messageText.text.trim(),
      'createdOn': FieldValue.serverTimestamp()
    });
  }

  String formatMessageDate(DateTime messageTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    if (messageTime.isAfter(today)) {
      return DateFormat('HH:mm').format(messageTime);
    } else if (messageTime.isAfter(yesterday)) {
      return 'Yesterday ${DateFormat('HH:mm').format(messageTime)}';
    } else {
      return DateFormat('MMM d, HH:mm').format(messageTime);
    }
  }

  getCurrentUser() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get();
    var user =UserModel.fromJson(users.docs.first.data());
    if(user.uid=='7331f0mjgNaUdb2ux9k1ISC0Wv02'){
      isTeacher=true;
    }
    else{
      isTeacher=false;
    }
    update();
  }
}
