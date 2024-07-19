import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'ChatTeacherController.dart';
class ChatDetailedController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  TextEditingController messageText = TextEditingController();
  TextEditingController message = TextEditingController();
  final auth = FirebaseAuth.instance;
  late User signedinUser;
  dynamic theDataFromPreviousPage = Get.arguments;
  String userName = '';
  String receiverEmail = '';
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
      'emailReceiver': receiverEmail,
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

  void getCurrentUser() {
    userName = theDataFromPreviousPage[0];
    receiverEmail = theDataFromPreviousPage[1];
  }
}
