import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachly/models/UserModel.dart';

class HomeController extends GetxController {
  final fireStore = FirebaseFirestore.instance;
  final auth=FirebaseAuth.instance;
  String userName='';
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }
  getCurrentUser() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get();
    var user =UserModel.fromJson(users.docs.first.data());
    userName='${user.firstName!} ${user.lastName!}';
    update();
  }
}
