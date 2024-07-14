import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late String? userName='';
getCurrentUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  userName = prefs.getString('firstNameAndLastName');
  update();
}
}
