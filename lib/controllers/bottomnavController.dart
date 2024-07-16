import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:teachly/screens/TeacherScreens/ChatScreen.dart';
import 'package:teachly/screens/ProfileScreen.dart';
import 'package:teachly/screens/SettingsScreen.dart';
import '../models/UserModel.dart';
import '../screens/HomeScreen.dart';

class NavigationController extends GetxController {
  final auth = FirebaseAuth.instance;
  String imageUrl = '';
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentImage();
  }

  checkTeacher(){
    if(auth.currentUser!.email=='govanynady@gmail.com'){
      return true;
    }else{
      return false;
    }
  }

  getCurrentImage() async {
    var users = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get();
    var user = UserModel.fromJson(users.docs.first.data());
    imageUrl = user.circleAvatarImage!;
    update();
  }
}
