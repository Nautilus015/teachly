import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/UserModel.dart';

class LecturesController extends GetxController{
  final auth=FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
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